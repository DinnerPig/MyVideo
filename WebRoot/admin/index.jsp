<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Tiger视频播放器后台管理页面</title>
</head>

<frameset cols="*" rows="136, *" id="frame_main"  border="0">
    <frame src="admin/header.jsp" noresize="noresize" name="header">
    
    <frameset cols="240, *">
    	<frame src="admin/menu.jsp" name="menu" />
    	<frame src="admin/main.jsp" name="main">
    </frameset>
</frameset>

<noframes><body>
</body>
</noframes></html>
