<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'main.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
body {
	font-size: 12px;
	font-family: tahoma;
}

#title {
	height: 25px;
	line-height: 25px;
	border: 1px solid #FF0099;
	background-color: #FFCCFF;
}

#min {
	position: absolute;
	width: 400px;
	height: 200px;
	left: 50%;
	top: 50%;
	margin-left: -200px;
	margin-top: -100px;
	border: 0px solid #00F
}
</style>

</head>

<body>

	<div>
		<div align="center" id="min"><h2><Strong>Tiger视频网站欢迎您:&nbsp;&nbsp; <a href="<%=basePath %>houtai/adminifolist.jsp" target="main">${adminLogin.username}</a></Strong></h2></div>
	</div>

</body>
</html>
