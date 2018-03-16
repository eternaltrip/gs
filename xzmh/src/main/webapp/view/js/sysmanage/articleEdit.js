//新闻资讯列表
$(document).ready(function(){
		
		var actionState = true;
		var basePath = $("#basePath").val();
		//编辑框
		$("#summernote").summernote({
			minHeight: 200,
			lang:'zh-CN',  //设置中文，需引入中文插件summernote-zh-CN.js
			dialogsInBody: true,  //对话框放在编辑框还是Body
			dialogsFade: true ,//对话框显示效果
			disableDragAndDrop: true ,//禁用拖放功能
			shortcuts: true ,//禁用快捷键
			callbacks: {
				onImageUpload: function(file) {
				//将图片放入Formdate对象中
				var formData = new FormData();  
				//‘picture’为后台获取的文件名，file[0]是要上传的文件
				formData.append("file", file[0]); 
				
				$.ajax({
					type:'post',
					url: basePath+'sys/upload.do',
					cache: false,
					data:formData, 
					processData: false,
					contentType: false,
					dataType:'json', //请求成功后，后台返回图片访问地址字符串，故此以text格式获取，而不是json格式
					success: function(data) {
						$('#summernote').summernote('insertImage' , basePath + data.path); 
					},
					error:function(){
						alert("上传失败");
					}
				});
				}
			}
		});
		
		
		//启动验证
		$('#articleForm').bootstrapValidator({
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
				}
				//设置消息窗口消息内容
				$("#messcontent").html(result.return_mess);
				//显示消息窗口并隐藏编辑窗口
				$("#messModal").modal('show');
			}, 'json');
		});
		
		
		
		//提交
		$("#submit").click(function(){
			var content = $("#summernote").summernote("code");
			$("#aContext").val(content);
			formcheck();
		});
		
		//form手动检查（适用于form外其他按键进行检查）
		function formcheck(){
			$('#articleForm').bootstrapValidator('validate');
			var bootstrapValidator = $('#articleForm').data('bootstrapValidator');
		}
		
		//弹窗确定按钮事件
		$("#messcomfirm").click(function(){
			if(actionState){
				window.location.reload();
			}else{
				//隐藏消息窗口并显示编辑窗口
				$("#messModal").modal('hide');
			}
		});
		
		//封面图片上传
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
						$("#fmtp").attr("src",basePath + data.path);
						$('#articleForm').find("input[name='aPic']").val( data.path);
						$('#fmtp').show();
					}
				},
				error: function(responseError){
					alert("系统错误");
				}
			
			});
		});
		
		
		
		
	})