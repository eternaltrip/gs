//新闻资讯列表
$(document).ready( function() {
	var actionState = true;
	var basePath = $("#basePath").val();
	var getPageInfo = $("#queryForm").attr("action");
	
	//加载数据
	var atricleData = $("#articleinfoList") .DataTable({
					"destroy" : true, // 销毁表格对象
					"aLengthMenu" : [ 10, 20 ], // 用户可自选每页展示数量
					"searching" : false,// 禁用搜索（搜索框）
					"lengthChange" : false,
					"paging" : true,// 开启表格分页
					"bProcessing" : true,
					"bServerSide" : true,
					"bAutoWidth" : false,
					// "sort" : "position",
					"deferRender" : true,// 延迟渲染
					// "bStateSave" : false,
					// //在第三页刷新页面，会自动到第一页
					// "retrieve" : true,
					// //类似单例模式，重复利用以存在对象。
					"iDisplayLength" : 10,
					"iDisplayStart" : 0,
					"select" : {
						style : 'os',
						selector : 'td:first-child'
					},
					"ordering" : false,// 全局禁用排序
					"ajax" : { // ajax方式向后台发送请求
						"type" : "POST",
						"url" : getPageInfo,
						"dataType" : "json",
						"data" : function(d){
							var titleId = $("#queryForm").find("[name='titleId']").val();
							var aTitle = $("#queryForm").find("[name='aTitle']").val();
							var aEnableHeadline = $("#queryForm").find("[name='aEnableHeadline']").val();
							var aEnableTop = $("#queryForm").find("[name='aEnableTop']").val();
							var aEnableState = $("#queryForm").find("[name='aEnableState']").val();
							//添加额外的参数传给服务器  
							d.titleId = titleId;
							d.aTitle = aTitle;
							d.aEnableHeadline = aEnableHeadline;
							d.aEnableTop = aEnableTop;
							d.aEnableState = aEnableState;
						}
					},
					"columns" : [// 对接收到的json格式数据进行处理，data为json中对应的key
						{ "data" : "aId" },
						{ "data" : "aTitle" },
						{ "data" : "titleName" },
						{ "data" : "aEnableTop" },
						{ "data" : "aEnableState" },
						{ "data" : "aPic" },
						{ "data" : "updateTime" },
						{ "data" : null }
					],
					// 渲染
					"columnDefs" : [
							{
								"render" : function(data, type, row , meta) {
									return meta.row + 1 + meta.settings._iDisplayStart;
								},
								"targets" : 0 // 指定渲染列：第一列(渲染第一列为单选框，data自动匹配为{"data":"id"}中数据）
							}, 
							{
								"render" : function(data, type, row ) {
									var showInfo = "<div style=\"width:100%;text-align: left;\" title=\""+data+"\">";
									if(data.length >= 16){
										showInfo += data.substring(0,10) + "...";
									}else{
										showInfo += data;
									}
									if(row.aEnableHeadline == 1 || row.aEnableHeadline == "1"){
										showInfo += "<span class=\"label label-danger pull-right \" style=\"padding: 3px;text-align: right;\">头条# " + row.aHeadlineSort + "</span>";
									}
									return showInfo + "<\div>";
								},
								"targets" : 1 // 渲染新闻资讯title部分
							},
							{
								"render" : function(data, type, row) {
									if(data == 1 || data == "1"){
										return  "<span class=\"label label-info \" style=\"padding: 3px;\">置顶</span> ";
									}else{
										return "";
									}
								},
								"targets" : 3 // 指定渲染列此列，判断是否有效，显示有效和无效的标签
							},
							
							{
								"render" : function(data, type, row) {
									if(data==1 || data == "1"){
										return "<span class=\"label label-success \" style=\"padding: 3px;\">显示</span>";
									}else{
										return "<span class=\"label label-default \" style=\"padding: 3px;\">隐藏</span>";
									}
								},
								"targets" : 4 // 指定渲染列此列，判断是否有效，显示有效和无效的标签
							},
							
							{
								"render" : function(data, type, row) {
									if(data != null && data !=''){
										return "<a class=\"btn btn-xs btn-primary picclick\" pic=\""+data+"\" >查看</a>";
									}else{
										return "无";
									}
								},
								"targets" : 5 // 封面图
							},
							{
								"render" : function(data, type, row) {
									if(data != null){
										return DateTime(data);
									}else{
										return "";
									}
								},
								"targets" : 6 // 时间标签
							},
							
							{
								"render" : function(data, type, row ,meta) {
									var showInfo= "<a  class=\"btn btn-danger btn-xs pull-right action delete\" action=\"del\" style=\"margin:0 3px;\"  datarownum=\""+meta.row+"\"><i class=\"fa fa-remove fa-fw\"></i>删除</a> ";
									showInfo += "<a class=\"btn btn-info btn-xs pull-right action edit\"  action=\"edit\" style=\"margin:0 3px;\" datarownum=\""+meta.row+"\"><i class=\"fa fa-edit fa-fw\"></i>编辑</a>  ";
									showInfo += "<a class=\"btn btn-primary btn-xs pull-right action  headline\"  action=\"headline\" style=\"margin:0 3px;\" datarownum=\""+meta.row+"\"><i class=\"fa fa-tasks fa-fw\"></i>头条设置</a>  ";
									return showInfo ;
								},
								"targets" : 7 // 显示操作按钮
							}
							],
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
				// initComplete:initComplete,
				});
	// dutyTable.fnDraw();//重绘
	
	
	//查询按钮
	$("#query").click(function(){
		atricleData.ajax.reload();
	});
	
	//清空按钮
	$("#clear").click(function(){
		
		$("#queryForm").find("[name='titleId']").val("-1");
		$("#queryForm").find("[name='aTitle']").val("");
		$("#queryForm").find("[name='aEnableHeadline']").val("-1");
		$("#queryForm").find("[name='aEnableTop']").val("-1");
		$("#queryForm").find("[name='aEnableState']").val("-1");
		atricleData.ajax.reload();
	});
	
	
	
	
	
	
	
	
	//头条设置，启动验证
	$('#headlineForm').bootstrapValidator({
		excluded: [':disabled', ':hidden', ':not(:visible)'],//设置影藏的元素不进行验证。方便后面的模块直接进行隐藏或者显示。
		message: '验证未通过',
		feedbackIcons: {
			valid: 'glyphicon glyphicon-ok',
			invalid: 'glyphicon glyphicon-remove',
			validating: 'glyphicon glyphicon-refresh'
		}
	}).on('success.form.bv', function(e) {
		e.preventDefault();
		var $form = $(e.target);
		var bv = $form.data('bootstrapValidator');
		// Use Ajax to submit form data
		$.post($form.attr('action'), $form.serialize(), function(result) {
			//判断添加是否成功
			if(result.return_state == 'success'){
				atricleData.ajax.reload();//重新加载表格
			}
			//设置消息窗口消息内容
			$("#messcontent").html(result.return_mess);
			//显示消息窗口并隐藏编辑窗口
			$("#messModal").modal('show');
			$("#headlineModal").modal("hide");
			$('#headlineForm').data('bootstrapValidator').resetForm(true);
		}, 'json');
	});
	
	
	
	
	//头条弹窗中的默认选择事件
	$('input[name="aEnableHeadline"]').on('change', function() {
		var bootstrapValidator = $('#headlineForm').data('bootstrapValidator'),
			shipNewAddress = ($(this).val() == '1');
		shipNewAddress ? $('#headline').find('.form-control').removeAttr('disabled') : $('#headline').find('.form-control').attr('disabled', 'disabled');
		
	});
	//设置头条按钮
	$("#headlinecomfirm").click(function(){
		$('#headlineForm').bootstrapValidator('validate');
		var bootstrapValidator = $('#headlineForm').data('bootstrapValidator');
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//点击删除,头条设置,编辑按钮事件
	$("#articleinfoList").on("click","a.action",function(){
		if ( $(this).parents("tr").hasClass('selected') ) {
			$(this).parents("tr").removeClass('selected');
		}else {
			atricleData.$('tr.selected').removeClass('selected');
			$(this).parents("tr").addClass('selected');
		}
		var datathis = $(this).attr("datarownum");
		var realData = atricleData.rows(datathis).data()[0];
		
		var action = $(this).attr("action");//获取操作方式（删除，头条设置，编辑）
		if(action == "del"){
			$("#actioncomfirm").attr("aId",realData.aId);
			$("#actionInfo").html("确定删除<span style=\"color: red;font-size: 20px;\">“"+realData.aTitle+"”</span>");
			$("#actionmodal").modal("show");
			
		}else if(action == "edit"){
			$("#editAid").val(realData.aId);
			$("#editTopage").submit();
			
		}else if(action == "headline"){
			$("#titleName").text("“"+realData.aTitle+"”");
			if(realData.aEnableHeadline == 1 || realData.aEnableHeadline == "1"){
				$('#headlineon').prop("checked", true);
				$('#headline').find('input[name="aHeadlineSort"]').removeAttr('disabled') ;
			}else{
				$('#headlineoff').prop("checked", true);
				$('#headline').find('input[name="aHeadlineSort"]').attr('disabled', 'disabled');
			}
			$('input[name="aHeadlineSort"]').val(realData.aHeadlineSort);
			$('input[name="aId"]').val(realData.aId);
			
			$("#headlineModal").modal("show");
		}
		
		
		
		//浏览器删除后会重新请求服务器获取数据，所以删除一定要在服务端操作
	});
	
	//确定删除
	$("#actioncomfirm").click(function(){
		var id = $("#actioncomfirm").attr("aId");
		delrowServer(id);
	});
	
	
	//确定删除,执行服务器删除
	
	function delrowServer(id){
		var  url = basePath + "article/del.do";
		$.ajax({
			url : url,
			data: {id:id},
			type : 'post',
			dataType : 'json',
			success : function(result) {
				//设置消息窗口消息内容
				$("#messcontent").html(result.return_mess);
				$("#actionmodal").modal("hide");
				$("#messModal").modal("show");
				if(result.return_state == 'success'){
					delrow();
				}
			}
		});
	}
	
	//删除页面数据
	function delrow(){
		atricleData.row('.selected').remove().draw( false );
	}
	
	
	//消息弹窗确认按钮
	$("#messcomfirm").click(function(){
		$("#messModal").modal("hide");
		
	});
	
	
	//封面图片预览
	$("#articleinfoList").on("click","a.picclick",function(){
		var pic = $(this).attr("pic");
		$("#fmtpshow").attr("src",basePath + pic);
		$("#fmtpshowModal").modal("show");
	});
	
	
	
	})