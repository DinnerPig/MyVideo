<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频管理系统-登录</title>
<link href="../img/favicon.ico" rel="shortcut icon" />
<link href="css/share.css" rel="stylesheet" type="text/css" />
<link href="css/videoupload/admin/login.css" rel="stylesheet"
	type="text/css" />
<link href="css/videoupload/admin/share.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">
$(function(){
	 $("#email").blur(function(){
			
			var email=$("#email").val();
			if(email==""){
				alert("请输入用户名");
				$("#email").focus();
			}
			if(email!=""){
				$.post("user_isExitUserEmail.action",
					{uMail:email,flag:1}
				,function(data){
					$("#lab1").html(data);
				});
			}
			
       });
	 $("#pwd").blur(function(){
		
			
			if($("#pwd").val()==""){
				
				$("#pwd").focus();
				alert("请输入密码");
				
			}
			
			
		});
	 $("#checkNum").blur(function(){
			
			if($("#checkNum").val()==""){
				
				alert("请输入验证码");
			}
			
			
		}); 
     $("#toLogin").click(function(){
    	if($("#email").val()==""){
    		
    		alert("请输入邮箱");
    	}
    	if ($("#pwd").val()=="") {
    		alert("请输入密码");
		
		}
    	if ($("#checkNum").val()=="") {
    		alert("请输入验证码");
			
		}
    	 
    	if($("#email").val()!=""&&$("#pwd").val()!=""&&$("#checkNum").val()!="")
    	{	
    		
    		 $("#myLogin").submit();		
    	}
		 
	   });
});
		 
     function refreshyan(){
 		document.getElementById("checkImage").src="image.jsp?id="+Math.random();//验证码刷新必须要加?id=Math.random()，要不然没用
 	}
	
	</script>
</head>

<body id="loginBody" background="./image/back3.jpg">
	<div id="pointerOpen" onclick=hideLoginBezel();>开启登录</div>
	<div id="loginBezel">
		<!-- <div id="loginChildTop" onclick="hideLoginBezel()" title="点击将隐藏登录小窗口">　CMS管理平台</div> -->
		<div id="loginChildTop">
			<img src="./image/logo-right.png" width="57" height="50"
				align="absbottom" /> 视频管理系统
		</div>
		<div id="loginChildBottom">
			<form method="post" action="user_login.action" id="myLogin">
				<table cellpadding="0" cellspacing="0" width="100%" height="95%"
					border="0">
					<tr>
						<td align="right" width="35%">邮箱账号：</td>
						<td align="left" width="65%"><input type="email" id="email"
							class="inputUP" name="email" /> <a id="lab1"
							style="font-size: 8px;text-decoration: none;" href="register.jsp">注册账号</a>
						</td>
					</tr>
					<tr>
						<td align="right">密 码：</td>
						<td align="left"><input type="password" id="pwd"
							class="inputUP" name="password" /> <a id="lab2"
							style="font-size: 8px;text-decoration: none;" href="foundPwd.jsp">找回密码</a>
						</td>
					</tr>
					
					<tr>
						<td align="right">验证码：</td>
						<td align="left"><input type="text" name="checkcode" id="checkNum" />
							<span id="checkNumResult"> <img src="image.jsp"
								id="checkImage" onclick="refreshyan()" align="absbottom"
								alt="验证码" title="点击更换验证码" /></span></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="button"
							id="toLogin" value="登　录" />&nbsp;&nbsp;&nbsp; <input
							type="button" id="toHistory" value="返　回"
							onclick="javascipt:history.go(-1)" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script src="js/jquery-1.11.0.js"></script>
	<script src="js/login.js"></script>
	<div style="text-align: center;"></div>
</body>
</html>

