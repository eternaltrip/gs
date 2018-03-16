//导航标题管理
$(document).ready(function(){
	var actionState = true;
	var actionModal;
	//表单
	var table = $("#linkinfoList").DataTable({
		responsive : true,
		"ordering": true,
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
	$('#linkForm').bootstrapValidator({
		excluded: [':disabled', ':hidden', ':not(:visible)'],//设置影藏的元素不进行验证。方便后面的模块直接进行隐藏或者显示。
		message: '验证未通过',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		}
	}).on('change', '#acountchoice', function() {
		var sameAsSender = $(this).is(':checked');
		if (!sameAsSender) {
			$('#acountInfo').hide();
		} else {
			$('#acountInfo').show();
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		var $form = $(e.target);
		var bv = $form.data('bootstrapValidator');
		// Use Ajax to submit form data
		$.post($form.attr('action'), $form.serialize(), function(result) {
			
			//判断添加是否成功
			if(result.return_state != 'success'){
				actionState = false;
				actionModal = "newlinkmodal";
			}
			//设置消息窗口消息内容
			$("#messcontent").html(result.return_mess);
			//显示消息窗口并隐藏编辑窗口
			$("#messModal").modal('show');
			$("#newlinkmodal").modal("hide");
		}, 'json');
	});


	
	//按钮提交form
	$("#newlinksub").click(function(){
		formcheck();
	});
	
	//弹窗确定按钮事件
	$("#messcomfirm").click(function(){
		if(actionState){
			window.location.reload();
		}else{
			//隐藏消息窗口并显示编辑窗口
			$("#messModal").modal('hide');
			$("#"+actionModal+"").modal("show");
		}
	});
	
	
	//form手动检查（适用于form外其他按键进行检查）
	function formcheck(){
		$('#linkForm').bootstrapValidator('validate');
		var bootstrapValidator = $('#linkForm').data('bootstrapValidator');
	}
	
	
	
	
	//点击编辑按钮
	$('#linkTables').on('click','button.editRow',function(){
		defaultFormInput();//重置编辑区域
		var lid = $(this).parents("tr").attr("lid");
		loadlinkInfo(lid , "getInfoIntoModal");
	} );
	
	//查询用户信息
	function loadlinkInfo(linkid , functionName) {
		var url = "link/info.do?lId=" + linkid;
		$.ajax({
			url : url,
			dataType : 'json',
			success : function(result) {
				var  func=eval(functionName);
				func(result);
			}
		});
	}
	
	//把获取到的信息放入信息窗口
	function getInfoIntoModal(Object){
		$('#linkForm').find("input[name='lid']").val(Object.lid);
		$('#linkForm').find("input[name='linkname']").val(Object.linkname);
		$('#linkForm').find("input[name='linksort']").val(Object.linksort);
		$('#linkForm').find("input[name='linkaddr']").val(Object.linkaddr);
		if(Object.linkstate == "1"){
			$('#linkForm').find("input[name='linkstate'][value='1']").prop("checked", true);
			$('#linkForm').find("input[name='linkstate'][value='0']").prop("checked", false);
		}else{
			$('#linkForm').find("input[name='linkstate'][value='1']").prop("checked", false);
			$('#linkForm').find("input[name='linkstate'][value='0']").prop("checked", true);
		}
		$("#newlinkmodal").modal("show");
	}
	
	
	
	
	
	//几个状态的改变（启用，停用，删除）按钮
//	$(".changestate").click(function(){
	$('#linkTables').on('click','button.changestate',function(){
		var lid = $(this).parents("tr").attr("lid");
		var linkname = $(this).parents("tr").attr("linkname");
		var changeType = $(this).attr("changeType");
		var info;
		if(changeType == "on"){
			info = "确定启用<span style=\"color: red;font-size: 24px;\">"+linkname+"</span>"
		}else if(changeType == "off"){
			info = "确定停用<span style=\"color: red;font-size: 24px;\">"+linkname+"</span>"
		}else{
			info = "确定删除<span style=\"color: red;font-size: 24px;\">"+linkname+"</span><br>删除之后将无法恢复！"
		}
		$("#OnOffDelInfo").html(info);
		$("#OnOffDelcomfirm").attr("lid" , lid);
		$("#OnOffDelcomfirm").attr("changeType" ,changeType);
		$("#OnOffDelModal").modal("show");
	})
	
	//启用，停用，删除弹窗界面确认按钮
	$("#OnOffDelcomfirm").click(function(){
		var url , data;
		var changeType = $(this).attr("changeType");
		var lid = $(this).attr("lid");
		if(changeType == "on"){
			url = "link/update.do";
			data = {lid : lid , linkstate:1}
		}else if(changeType == "off"){
			url = "link/update.do";
			data = {lid : lid , linkstate:0}
		}else{
			url = "link/del.do";
			data = {lId : lid }
		}
		$.ajax({
			url : url,
			data: data,
			type : 'post',
			dataType : 'json',
			success : function(result) {
				//判断添加是否成功
				if(result.return_state != 'success'){
					actionState = false;
					actionModal = "OnOffDelModal";
				}
				//设置消息窗口消息内容
				$("#messcontent").html(result.return_mess);
				//显示消息窗口并隐藏编辑窗口
				$("#OnOffDelModal").modal("hide");
				$("#messModal").modal('show');
			}
		});	
		
	});

	
	
	
	

	
	
	//新增按钮
	$("#newlinkBtn").click(function(){
		defaultFormInput();
	});
	
	//选择图片按钮
	$("#choosePic").click(function(){
		$("#picForm").find("input[name='file']").trigger("click");
	});
	
	//jquery上传图片
	$("#picForm").find("input[name='file']").change(function(){
		$("#picForm").ajaxSubmit({
			dataType:'json',
			success: function(data){
				if(data.return_state == 'success'){
					$("#image").attr("src",data.path);
					$('#linkForm').find("input[name='tPic']").val(data.path);
					$('#image').show();
				}
			},
			error: function(responseError){
				alert("系统错误");
			}
		
		});
	});
	
	
	
	
	
	//重置编辑区域
	function defaultFormInput(){
		//重置编辑区域
		$('#linkForm').data('bootstrapValidator').resetForm(true);
		$("#image").removeAttr("src");
		$('#linkForm').find("input[name='tPic']").val(null);
		$('#linkForm').find("input[name='tEnableState']").removeAttr("checked");
		$('#image').hide();
	}
	
	//是否是链接
	$('input[name="isUrl"]').on('change', function() {
		//var bootstrapValidator = $('#linkForm').data('bootstrapValidator'),
		isurl = ($(this).val() == '1');
		isurl ? $("input[name='tUrl']").removeAttr('disabled') :$("input[name='tUrl']").attr('disabled', 'disabled');
		
	});
	

	
	
	
})
