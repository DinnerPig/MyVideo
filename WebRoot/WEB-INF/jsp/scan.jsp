<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>搜索结果</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="js/sousuo.css">
<script type="text/javascript" src="js/jquery.js"></script>

<script type="text/javascript" src="js/jSuggest.js"></script>

</head>
<style>
#id1 {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 49;
	display: none;
}

#id2 {
	top: 200px;
	position: absolute;
	z-index: 50;
	display: none;
	border: 3px solid #E5E5E5;
	left: 500px;
	background-color: white;
	background-image: url(img/body.jpg)
}
</style>
<script type="text/javascript">
	function valid() {
		var vidName = document.getElementById("text").value;
		var pagenum = document.getElementById("pagenum").value;
		alert(vidName);
		if (vidName == "") {
			alert("出现错误");
			return false;
		}
		if (pagenum == "") {
			alert("跳转不能为空");
			return false;
		}
		return true;
	}
</script>

<body
	style="text-align: center; background-repeat: no-repeat; background-position: center top;background:url(images/3b9.jpg);">
	<div class="main">
		
		<div class="sousuo" style="background-color:#999; height:80px;">
			<div style=" float:left; margin-left:0px; margin-top:3px;">
				<img src="image/logo.png" height="74px" />
			</div>
			<div class="m_1"
				style="float:right; margin-top:17px; margin-right:220px;">
			
				
			</div>
		</div>
		<div class="info" style="background-color:#CCC; height:40px;">
			<div style="float:left; margin-left:5%; margin-top:9px;">
				搜索"${requestScope.serachname}"共找到约
				<s:property value="scanBean.totalCount" />
				个视频
			</div>
		</div>
		<div class="con" style=" margin-left:5%; margin-right:5%;">
			<div style="float:left; width:65%;height:650px;">
				<div>
					<br>

					<table width="80%" border="0"
						style="float: left; margin-left: 20px;">
						<s:if test="scanBean.totalCount == 0 ">
							<div style="margin-top:20px;">
								<font color="#d5333a">非常抱歉，没有搜索到您要的结果，请参考下面的搜索帮助：</font>
							</div>
							<div style="margin-top:20px;margin-left:10px;">
								<font size="-1">请使用简化搜索，比如搜索：大话西游，只需要输入：“大话”或者“西游”或者“话”，输入的关键词越少越全面。</font>
							</div>
						</s:if>
						<s:else>

							<s:iterator var="sb" value="scanBean.list">
								<tr>
									<td width="35%" rowspan="8"><a href="#"> <img
											src="${ pageContext.request.contextPath }/<s:property value="#sb.vidImage"/>"
											width="150px" height="200px" />
									</a></td>
									<td width="65%" align="left"><h3>
											视频：
											<s:property value="#sb.vidName" />
										</h3></td>
								</tr>
								<tr>
									<td align="left">内容描述：<s:property value="#sb.vidjianjie" /></td>
								</tr>
								<tr>
									<td align="left">类型：<s:property
											value="#sb.maxtype.maxName" /></td>
								</tr>
								<tr>
									<td>小类型：<s:property value="#sb.mintype.minName" /></td>
								</tr>
								<tr>
									<td align="left">年份：<s:property value="#sb.vidYear" /></td>
								</tr>
								<tr>
									<td>状态：<s:property value="#sb.vidState" /></td>
								</tr>
								<tr>
									<td align="left"><a
										href="${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=<s:property value="#sb.vidId"/>">查看详情</a>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>

							</s:iterator>
						</s:else>


					</table>
				</div>
			</div>
			<div
				style="float:right; width:25%;background-color:#E1C8E1; height:650px;">
				<table width="80%" border="0">
					<tr height="50px">
						<td colspan="2" align="left"><h3>推荐视频</h3></td>
					</tr>
					<tr height="50px">
						<td>1、</td>
						<td align="left"><a href="#">海贼王</a></td>
					</tr>
					<tr height="50px">
						<td>2、</td>
						<td align="left"><a href="#">火影忍者</a></td>
					</tr>
					<tr height="50px">
						<td>3、</td>
						<td align="left"><a href="#">银魂</a></td>
					</tr>
					<tr height="50px">
						<td>4、</td>
						<td align="left"><a href="#">金色琴弦</a></td>
					</tr>
					<tr height="50px">
						<td>5、</td>
						<td align="left"><a href="#">秦时明月</a></td>
					</tr>
					<tr height="50px">
						<td>6、</td>
						<td align="left"><a href="#">喜洋洋</a></td>
					</tr>
				</table>
			</div>
		</div>

		<div class="page" style="background-color:#CCC">
		
	   <s:if test="scanBean.totalCount != 0 ">
			<div style="float:left; margin-left:250px; margin-top:12px;">
				<s:if test="scanBean.page != 1">
					<a
						href="${ pageContext.request.contextPath }/videoinfo_findbylikename.action?vidName=${requestScope.serachname}&page=1"
						style="text-decoration:none">首页</a>&nbsp;&nbsp;
				<a
						href="${ pageContext.request.contextPath }/videoinfo_findbylikename.action?vidName=${requestScope.serachname}&page=<s:property value="scanBean.page-1"/>"
						style="text-decoration:none">上一页</a>&nbsp;&nbsp;
				</s:if>
				共
				<s:property value="scanBean.totalPage" />
				页 /当前第
				<s:property value="scanBean.page" />
				页&nbsp;&nbsp;
				<s:if test="scanBean.page !=  scanBean.totalPage">
					<a
						href="${ pageContext.request.contextPath }/videoinfo_findbylikename.action?vidName=${requestScope.serachname}&page=<s:property value="scanBean.page+1"/>"
						style="text-decoration:none">下一页</a>&nbsp;&nbsp;
				<a
						href="${ pageContext.request.contextPath }/videoinfo_findbylikename.action?vidName=${requestScope.serachname}&page=<s:property value="scanBean.totalPage"/>"
						style="text-decoration:none">尾页</a>&nbsp;&nbsp;
				</s:if>
			</div>
			</s:if>
		</div>

	</div>



</body>
</html>

