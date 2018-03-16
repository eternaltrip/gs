$(document).ready(function(){
	var basePath = $("#basePath").val();
	
	$("#account,#password,#imgcode").on("input",function(){
		$("#errorinfo").html("");
	});
	
	
	$("#login").click(function(){
		var pw = $("#password").val();
		var ac = $("#account").val();
		var imgcode = $("#imgcode").val();
		if(ac && pw && imgcode){
			$.ajax({
				type : "post",
				dataType : "json",
				url : basePath + "account/login.do",
				data : {
					account : ac,
					passwd : pw,
					imgcode : imgcode
				},
				success :function(result){
					if(result.return_state == "success"){
						location.href= basePath + "sys.do";
					}else{
						if(result.imgcodecheck == "false"){
							$("#errorinfo").html(result.return_mess);
						}else{
							$("#errorinfo").html("帐号或密码错误！");
						}
						changeimgcodepic();
					}
				},
				error:function(e){
					alert("网络错误")
				}
			});
		}else{
			if(!ac){
				$("#errorinfo").html("请输入帐号！");
			}else if(!pw){
				$("#errorinfo").html("请输入密码！");
			}else if(!imgcode){
				$("#errorinfo").html("请输入验证码！");
			}
			changeimgcodepic();
		}
		
	});
	
	
	$("#imgcodepic").click(function(){
		changeimgcodepic();
	});
	
	function changeimgcodepic(){
		var rad = Math.floor(Math.random() * Math.pow(10, 8));
		$("#imgcodepic").attr("src",$("#imgcodepic").attr("src") + "?datetime=" + rad );
	}
	
	
	
})
