<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>影视电影 :<s:property value="model.maxtype.maxName" /></title>
<style type="text/css">
#main {
	width: 1024px;
	height: auto;
	margin: 0 auto;
	background-color: #000000;
	border-bottom: 3px solid red;
}

#head {
	margin: 0 auto;
	width: 1024px;
	height: auto;
	color: #FFFFFF;
	background-color: #333333;
}

#bodyq {
	margin: 0 auto;
	width: 1024px;
	height: 385px;
}

#xiangxitu {
	width: auto;
	height: auto;
	float: left;
}

#xinxi2 {
	margin-left: 35px;
	width: 730px;
	height: 170px;
	float: left;
}

#xinxi li {
	list-style-type: none;
}

#paly {
	margin-left: 35px;
	width: 730px;
	height: 70px;
	float: left;
	border: 1px solid #999999;
	background-color: #666666;
}

#jishu {
	margin: 5px;
	width: 65px;
	margin-left: 1px;
	float: left;
	text-align: center;
}

#juqingjianjie {
	margin: 0 auto;
	width: 1024px;
	height: 30px;
}

#juqing li {
	margin: 0 auto;
	width: 1024px;
	height: auto;
	list-style-type: none;
}

body {
	text-align: left;
}

a:link,a:visited {
	color: white;
	text-decoration: none;
	font-size: 15px;
}

a:hover {
	color: red;
	text-decoration: underline;
	font-size: 15px;
}

.v a:link,.v a:visited {
	color: black;
	text-decoration: none;
	font-size: 15px;
}

.v a:hover {
	color: red;
	text-decoration: underline;
	font-size: 15px;
}

.STYLE2 {
	color: #FFFFFF;
	font-size: medium;
}

.STYLE3 {
	font-size: large
}

.STYLE4 {
	font-size: x-large
}

.STYLE5 {
	color: #FF0000;
	font-size: medium;
}
</style>
</head>

<body>
	<jsp:include page="top.jsp" />



	<div class="STYLE4" id="head">
		<span class="STYLE2"><s:property value="model.vidName" />></span>&nbsp;&nbsp;
		<s:property value="model.maxtype.maxName" />
	</div>
	<div id="bodyq">
		<div id="xiangxitu">
			<p align="center">
				<img
					src="${ pageContext.request.contextPath }/<s:property value="model.vidImage"/>"
					border="1" width="240" height="350" />
			</p>
		</div>
		<div id="xinxi2" style="margin-top:80px;">
			<ul class="v">
				<li><strong><a href="#">导演</a>：</strong> <s:property
						value="model.vidDirector" /></li>
				<li><strong><a href="#">主演</a>：</strong> <s:property
						value="model.vidStar" /></li>
				<li><strong><a href="#">类型</a>：</strong> <s:property
						value="model.mintype.minName" /></li>
				<li><strong><a href="#">地区</a>：</strong> <s:property
						value="model.area.areaName" /></li>
				<li><strong><a href="#">年份</a>：</strong> <s:property
						value="model.vidYear" /></li>
						
					<s:if test="model.vidName.maxId==1">	
				<li><strong><a href="#">片长</a>：</strong> <s:iterator
						var="videocount" value="model.videocounts">
						<s:property value="#videocount.couDuration" />

					</s:iterator></li>
				<li><strong><a href="#">播放次数</a>：</strong>
				 <s:iterator var="videocount" value="model.videocounts">
						<s:property value="#videocount.couClick" />
				</s:iterator>
				</li>
				</s:if>	
			</ul>
		</div>
		<div id="paly">
		
		<s:if test="model.maxtype.maxId==1">	
			<div>
				<a href="${ pageContext.request.contextPath }/videoinfo_bofangbyvidId.action?vidId=<s:property value="model.vidId"/>">播放</a>
			</div>
			</s:if>	
			<s:if test="model.maxtype.maxId==2">
			 <%int aa=0; %>
			 <s:iterator var="videocount" value="model.videocounts" status="st"  >  
			
					 <div id=jishu><a href="${pageContext.request.contextPath}/videocount_findBycouid.action?couId=<s:property value='#videocount.couId'/>">第 <s:property value="#st.count"/>集</a></div>
			</s:iterator>
			</s:if>	
		</div>
	</div>
	<div id="juqingjianjie">
		<div class="STYLE3" id="head">剧情简介</div>
		<div id="juqing" style="margin-left:-35px;">
			<ul>
				<li><s:property value="model.vidjianjie" /></li>
			</ul>
		</div>
		<div class="STYLE3" id="head">影评</div>

		
			
			<div id="juqing" style="margin-left:-15px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<s:property value="#comment.comSubtance" />
				<br />
			</div>
			


	</div>

	<div style="width:1024px;margin:0 auto;margin-top:100px; ">
		<jsp:include page="bottom.jsp" />
	</div>
</body>
</html>