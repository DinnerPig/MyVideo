<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>视频管理系统-个人信息</title>
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
		$("#uName").blur(function(){
			if($("#uName").val() == ""){
				$("#lab1").html("用户名不能为空");
			}
		});
		
		$("#uNickName").blur(function(){
			if($("#uNickName").val() == ""){
				$("#lab2").html("昵称不能为空");
			}
		});
		
		$("#uLive").focus(function(){
			$("#lab4").html("等级不可修改");
		});
		
		$("#uAccumulate").focus(function(){
			$("#lab5").html("积分不可修改");
		});
		
		$("#email").focus(function(){
			$("#lab7").html("邮箱不可修改");
		});
	});
		
	function prompt(){
		if($("#uName").val()=="" || $("#uNickName").val()==""){
			alert("请完善信息！");
		}else{
			alert("保存成功！");
			$("#saveInfo").submit();
		}
		
	}
</script>
<body id="loginBody" style="margin:0px 0px 0px 0px">
	<div id="pointerOpen" onclick=hideLoginBezel();>开启登录</div>
	<div id="loginBezel">
		<!-- <div id="loginChildTop" onclick="hideLoginBezel()" title="点击将隐藏登录小窗口">　CMS管理平台</div>-->
		<div id="loginChildTop">
			<img src="admin/images/logo-right.png" width="57" height="50"
				align="absbottom" /> 个人信息
		</div>
		<div id="loginChildBottom">
			<form action="user_update.action" id="saveInfo" method="post">
				<table cellpadding="0" cellspacing="0" width="100%" height="95%"
					border="0">
					
					<tr>
						<td align="right">用户名：</td>
						<td align="left"><input type="text" id="uName" name="uName" class="inputUP" value="${existUser.uName}"/>
						<label id="lab1">
						</td>
					</tr>
					<tr>
						<td align="right">昵称：</td>
						<td align="left"><input type="text" id="uNickName" name="uNickName" class="inputUP" value="${existUser.uNickName}"/>
						<label id="lab2"></td>
					</tr>
					
					<tr>
						<td align="right">等级：</td>
						<td align="left"><input type="text" id="uLive" name="uLive" readonly="readonly" class="inputUP" value="${existUser.uLive}"/>
						<label id="lab4"></label>
						</td>
					</tr>
					<tr>
						<td align="right">积分：</td>
						<td align="left"><input type="text" id="uAccumulate" name="uAccumulate" readonly="readonly" class="inputUP" value="${existUser.uAccumulate}"/>
						<label id="lab5">
						</td>
					</tr>
					
					<tr>
						<td align="right">性别：</td>
						<td align="left"><input type="text" id="uSex" name="uSex" class="inputUP" value="${existUser.uSex}"/>
						<label id="lab6"></td>
					</tr>
					<tr>
						<td align="right" width="150px">邮箱：</td>
						<td align="left" width="350px"><input type="email" id="email"
							name="uMail" class="inputUP" readonly="readonly" value="${existUser.uMail}"/>
							<label id="lab7"></label>
						</td>
					</tr>
					<tr>
						<td align="right">出生年月：</td>
						<td align="left"><input type="text" id="uBirthday" name="uBirthday" class="inputUP" value="${existUser.uBirthday}"/>
						</td><label id="lab8">
					</tr>
					<tr>
						<td align="center" valign="bottom" colspan="2">
							<input type="button" id="register" value="保　存" / onclick="prompt()">&nbsp;&nbsp;&nbsp;
							<input type="button" id="toHistory" value="返　回" onclick="history.go(-1)" />
						</td>

					</tr>
					
				</table>
				<br>
			</form>
		</div>
	</div>
	<script src="js/jquery-1.11.0.js"></script>
	<script src="js/login.js"></script>
	<div style="text-align: center;"></div>
</body>
</html>