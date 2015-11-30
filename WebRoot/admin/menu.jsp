<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
html, body {height:100%;overflow:hidden;} /*为兼容ie7,ff*/
body {font-family:Arial, Helvetica, sans-serif; font-size:12px; margin:0px; text-align:center; border-right:1px #ccc solid;}
a {color: #000; text-decoration: none;}
#menu img {_margin-top: 12px;}/*没办法,ie6对list-style-image支持不好*/
#all {width: 100%;height:100%;}
#menu {width: 96%;}
#menu ul {padding:0; margin: 0; list-style: none;}
#menu ul li {background-image:url(/match/public/images/menu_bg.gif); background-repeat: repeat-x; background-position:center; height: 32px;;margin-top: 2px; margin-bottom: 2px; border:1px #ccc solid; line-height: 2.8;}
</style>
</head>

<body>
<div id="all">
    <div id="menu">
        <ul>
        	<li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>houtai/adminifolist.jsp" target="main">个人信息</a></li>
        	<li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>adminUser_findAllUser.action?page=1" target="main">用户信息</a></li>
            <li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>adminvideoinfo_findallvideo.action?page=1" target="main">视频管理</a></li>
            <li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>adminvideoinfo_toaddview.action" target="main">视频添加</a></li>
            <li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>adminUserupload_getAllUserVideoInfo.action?page=1" target="main">上传视频</a></li>
            <li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath%>commentManage_findAllComment.action?page=1" target="main">评论管理</a></li>
            <li><img src="images/li.jpg" />&nbsp;&nbsp;&nbsp; <a href="<%=basePath %>ad_findallAd.action?page=1" target="main">广告管理</a></li>
  
        </ul>
    </div>
</div>
</body>
</html>