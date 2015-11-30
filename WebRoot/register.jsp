<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频管理系统-注册</title>
<link href="share/images/favicon.ico" rel="shortcut icon" />
<link href="share/css/share.css" rel="stylesheet" type="text/css" />
<link href="admin/css/default/login.css" rel="stylesheet"
	type="text/css" />
<link href="admin/css/default/share.css" rel="stylesheet"
	type="text/css" />
<style type="text/css">
#lab3 {
	color: red
}
</style>
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/commom.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#email").blur(function(){
			
			var email=$("#email").val();
			if(email!=null){
			
			//var patten = new RegExp(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
			if(email.match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/))
		    {
				$.post("user_isExitUserEmail.action",
					{uMail:email,flag:0}
				,function(data){
					$("#lab1").html(data);
					
					
				});
				
				
			}	
			else{
				
				$("#lab1").html("邮箱格式错误");
				$("#email").focus();
			}
			}
			else{
				$("#lab1").html("请输入邮箱注册");
				
			}
		});
		
		
		
		
		
		
		
	});
	function checkPwd() {
		var password = document.getElementById("pwd").value;
		var checkpwd = document.getElementById("checkpwd").value;
		if(checkpwd=="")
			{
			
			$("#lab3").html("密码不能为空");
			}
		
		
		if(password!=checkpwd){
			
			$("#lab3").html("密码不一致");
			alert("两次密码不一致");
		}
	}
    
	function change() {
		document.getElementById("lab3").innerHTML = "";
	}
	function refreshyan(){
		document.getElementById("checkImage").src="image.jsp?id="+Math.random();//验证码刷新必须要加?id=Math.random()，要不然没用
	}
</script>
<body id="loginBody">
	<div id="pointerOpen" onclick=hideLoginBezel();>开启登录</div>
	<div id="loginBezel">
		<!-- <div id="loginChildTop" onclick="hideLoginBezel()" title="点击将隐藏登录小窗口">　CMS管理平台</div>-->
		<div id="loginChildTop">
			<img src="admin/images/logo-right.png" width="57" height="50"
				align="absbottom" /> 用户注册
		</div>
		<div id="loginChildBottom">
			<form action="user_register.action" method="post">
				<table cellpadding="0" cellspacing="0" width="100%" height="95%"
					border="0">
					<tr>
						<td align="right" width="150px">邮箱：</td>
						<td align="left" width="350px"><input type="email" id="email"
							name="email" class="inputUP"/> <label id="lab1">


						</label></td>
					</tr>
					<tr>
						<td align="right">用户名：</td>
						<td align="left"><input type="text" id="uName" name="userName" class="inputUP" "/>
						<label id="lab1">
						</td>
					</tr>
					<tr>
						<td align="right">密 码：</td>
						<td align="left"><input type="password" id="pwd"
							name="password" class="inputUP" /> <label id="lab2"> </label></td>
					</tr>
					<tr>
						<td align="right">确认密码：</td>
						<td align="left"><input type="password" id="checkpwd"
							name="checkpwd" class="inputUP" onBlur="checkPwd()"
							onFocus="change()" /> <label id="lab3"></label></td>
					</tr>
					<tr>
						<td align="right">昵称：</td>
						<td align="left"><input type="text" id="uNickName" name="nickName" class="inputUP"/>
						<label id="lab2"></td>
					</tr>	
					<tr>
						<td align="right">出生年月：</td>
						<td align="left"><input type="" id="uBirthday" name="birthday" class="inputUP" />
						</td><label id="lab8">
					</tr>		
					<tr>
						<td align="right">性别：</td>
						<td align="left">	
						<input type="radio" name="sex" value="男" checked>男
	                     <input type="radio" name="sex" value="女">女
						<label id="lab6"></td>
					</tr>
					
					
					<tr>
						<td align="right">验证码：</td>
						<td align="left">
							 <input
							type="text" name="checkcode" id="checkNum" /> <span
							id="checkNumResult"> <img src="image.jsp" id="checkImage"
								
								onclick="refreshyan()" align="absbottom" alt="验证码"
								title="点击更换验证码" /></span>
						</td>
						</td>
					</tr>
					<tr>
						<td align="center" valign="bottom" colspan="2"><input
							type="submit" id="register" value="注 　册" />&nbsp;&nbsp;&nbsp; <input
							type="button" id="toHistory" value="返　回" onclick="history.go(-1)" />
						</td>

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
