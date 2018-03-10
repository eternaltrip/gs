$(document).ready(function(){
	
	  var table = $("#titleinfoList").DataTable({
		responsive : true,
		"ordering": false,
		"processing" : true, //开启读取服务器数据时显示正在加载中……特别是大数据量的时候，开启此功能比较好
		"bLengthChange" : true, //默认true，开启一页显示多少条数据的下拉菜单，允许用户从下拉框(10、25、50和100)，注意需要分页(bPaginate：true)。
		"oLanguage" : {
			"sLengthMenu" : "每页显示 _MENU_ 条记录",
			"sZeroRecords" : "抱歉， 没有找到",
			"sInfo" : "当前第 _START_ 至 _END_ 项记录 /共 _TOTAL_ 项数据",
			"sInfoEmpty" : "没有数据",
			"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
			"sZeroRecords" : "没有检索到数据",
			"sSearch" : "查询:",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "前一页",
				"sNext" : "后一页",
				"sLast" : "尾页"
			}
		}
		
	});
	
	
	
	//启动验证
	$('#titleForm').bootstrapValidator({
		excluded: [':disabled', ':hidden', ':not(:visible)'],//设置影藏的元素不进行验证。方便后面的模块直接进行隐藏或者显示。
		message: '验证未通过',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		},
		fields: {
			mobile:{
				message:'电话号码输入无效',
				threshold : 11 ,//满足11为才发送ajax验证
				validators :{
					notEmpty:{
						message:'电话号码不能为空'
					},
					remote:{//ajax验证
						url:'<%=basePath %>sys/checkMobile',
						message:'电话号码已存在',
						delay:1000,
						type:'GET'
					}
					
				}
			}
			
			
		}
	}).on('change', '#acountchoice', function() {
		var sameAsSender = $(this).is(':checked');
		if (!sameAsSender) {
			$('#acountInfo').hide();
		} else {
			$('#acountInfo').show();
		}
		
	}).on('success.form.bv', function(e) {
		// Prevent form submission
		e.preventDefault();
		
		// Get the form instance
		var $form = $(e.target);
		
		// Get the BootstrapValidator instance
		var bv = $form.data('bootstrapValidator');
		
		// Use Ajax to submit form data
		$.post($form.attr('action'), $form.serialize(), function(result) {
			alert(result.info);
		}, 'json');
	});


	
	//按钮提交
	$("#newtitlesub").click(function(){
		formcheck();
	});
	
	//form手动检查（适用于form外其他按键进行检查）
	function formcheck(){
		$('#titleForm').bootstrapValidator('validate');
		var bootstrapValidator = $('#titleForm').data('bootstrapValidator');
	}
	
	
	

	//双击行事件
	$("#titleinfoList").find("tbody tr").dblclick(function() {
		loadtitleInfo($(this).attr("tid"));
	});
	//点击编辑按钮
	$('.editRow').click( function () {
		var tid = $(this).parents("tr").attr("tid");
		loadtitleInfo(tid);
	} );
	
	//查询用户信息
	function loadtitleInfo(titleid) {
		var url = "title/info?tid=" + titleid;
		$.ajax({
			url : url,
			dataType : 'json',
			success : function(result) {
				$('#titleForm').find("input[name='tId']").val(result.tId);
				$('#titleForm').find("input[name='tName']").val(result.tName);
				$('#titleForm').find("input[name='tCode']").val(result.tCode);
				$('#titleForm').find("input[name='tIndex']").val(result.tIndex);
				$('#titleForm').find("input[name='tPic']").val(result.tPic);
				if(result.tEnableState == "1"){
					$('#titleForm').find("input[name='tEnableState']").attr("checked");
				}else{
					$('#titleForm').find("input[name='tEnableState']").removeAttr("checked");
				}
			}
		});
	}
	
	
	
})
