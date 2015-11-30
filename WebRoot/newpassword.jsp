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
<title>视频管理系统-找回密码</title>
<link href="../img/favicon.ico" rel="shortcut icon" />
<link href="css/share.css" rel="stylesheet" type="text/css" />
<link href="css/videoupload/admin/login.css" rel="stylesheet"
	type="text/css" />
<link href="css/videoupload/admin/share.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript">

	function refreshyan() {
		document.getElementById("checkImage").src = "image.jsp?id="
				+ Math.random();//验证码刷新必须要加?id=Math.random()，要不然没用
	}

	function check() {
		var pass=$("#password").val();
		var compass=$("#compass").val();

		if (pass!=compass) {
			$("#lab1").html("两次输入密码不一致");
			
		} else {
			$("#lab1").html("");
		}
	}
</script>
</head>

<body id="loginBody" background="./image/back3.jpg">

	<div id="loginBezel">

		<div id="loginChildTop">
			<img src="image/logo-right.png" width="57" height="50"
				align="absbottom" /> 视频管理系统--找回密码
		</div>
		<div id="loginChildBottom">
			<form method="post" action="user_findpassword.action">
				<table cellpadding="0" cellspacing="0" width="100%" height="95%"
					border="0">
					<tr>
						<td align="right" width="35%">找回的邮箱账号：</td>
						<td align="left" width="65%"><input type="text" id="email"
							class="inputUP" name="email" value="${finduser.uMail}" /></td>
					</tr>

					<tr>
						<td align="right">密 码：</td>
						<td align="left"><input type="password" id="pwd"
							class="inputUP" name="password" /></td>
					</tr>

					<tr>
						<td align="right">确定密 码：</td>
						<td align="left"><input type="password" id="compass"
							class="inputUP" name="compass" onblur="checkpass()" /><label id="lab1"></label></td>
					</tr>

					<tr>
						<td align="right">验 证 码：</td>
						<td align="left"><input type="text" name="checkcode"
							id="checkNum" /> <span id="checkNumResult"> <img
								src="image.jsp" id="checkImage" onclick="refreshyan()"
								align="absbottom" alt="验证码" title="点击更换验证码" /></span></td>
					</tr>

					<tr>
						<td align="center" colspan="2"><input type="submit"
							id="toLogin" value="确 定 找 回" />&nbsp;&nbsp;&nbsp; <input
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

