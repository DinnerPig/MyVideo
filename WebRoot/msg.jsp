<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册成功-跳转</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript"> 
	var t=2;//设定跳转的时间 
	setInterval("refer()",1000); //启动1秒定时 
	function refer(){  
	    if(t<1){ 
	        location="login.jsp"; //#设定跳转的链接地址 
	    } 
	    document.getElementById('show').innerHTML=""+t+"秒后跳转到登录页面！"; // 显示倒计时 
	    t--; // 计数器递减 
	} 
	</script>
	<style type="text/css">


h1 {
	text-transform: uppercase;
	text-align: center;
	color: #666;
	margin: 0 0 20px 0;
	letter-spacing: 4px;
	font: normal 26px/1 Verdana, 妤蜂綋, Helvetica;
	position: relative;
}

h1:after, h1:before {
	background-color: #777;
	content: "";
	height: 1px;
	position: absolute;
	top: 15px;
	width: 120px;
}

h1:after {
	background-image: -webkit-gradient(linear, left top, right top, from(#777),
		to(#fff));
	background-image: -webkit-linear-gradient(left, #777, #fff);
	background-image: -moz-linear-gradient(left, #777, #fff);
	background-image: -ms-linear-gradient(left, #777, #fff);
	background-image: -o-linear-gradient(left, #777, #fff);
	background-image: linear-gradient(left, #777, #fff);
	right: 0;
}

h1:before {
	background-image: -webkit-gradient(linear, right top, left top, from(#777),
		to(#fff));
	background-image: -webkit-linear-gradient(right, #777, #fff);
	background-image: -moz-linear-gradient(right, #777, #fff);
	background-image: -ms-linear-gradient(right, #777, #fff);
	background-image: -o-linear-gradient(right, #777, #fff);
	background-image: linear-gradient(right, #777, #fff);
	left: 0;
}

.back-image {
	text-align: center;
}

	</style> 

  </head>
  
  <body>
	
		<h1>注册成功,<span id="show">3秒后跳转到登录页面！</span></h1>
	
	
  </body>
</html>
