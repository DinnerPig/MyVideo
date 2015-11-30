<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<style type="text/css">
<!--
#globallink{
	width:auto;
	height:40px;
	border:1px solid  #999999;
	background-color:#222222;
	color:#222222;
}
#globallink ul{
    	list-style:none;
	    padding:0px; margin:0px;
	
}
#globallinkul li{
	float:left; 
	text-align:center;
	border:0px solid  #cccccc;
	width:70px;
	margin-left:-1px;
	margin-top:5px;
	
}

#globallinkul a:HOVER
{
 background-color:#969394;
  color:blue;
}
#globallinkul a{
    font-size:12px;
	display:block;
	padding:4px 3px 5px 3px;
	margin:0px;
	color:white;
}
</style>
</head>
<body>
<center>
	<div id="globallink">
  
      <div style="width:1024px; height:40px; text-align:center;">
           <div>
						<ul id="globallinkul" >
							<li style="	margin-left:5px;"><a style="font-size:20px;" href="${ pageContext.request.contextPath }/index.jsp">首页</a></li>
							<li><a style="font-size:20px;" href="${ pageContext.request.contextPath }/videoinfo_findbymaxtype.action?maxtype.maxId=1">电影</a></li>
							<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=2&page=1">电视剧</a></li>
							<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=3&page=1">动漫</a></li>
							<li><a style="font-size:20px;"  href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=4&page=1">综艺</a></li>
			
						</ul>
			</div>
		</div>		 
	</div>		
	<div style="background-color:red;height:5px;color:white; "></div>
</center>
</body>
</html>

