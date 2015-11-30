<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<!--
.STYLE1 {color:#3300FF}
#paiheng a
{
	color:#999999;
   text-decoration: none;
}

#paiheng a:HOVER
{
    color:#3300FF;
}
-->
</style>
</head>
<body id="paiheng">
		<table width="240" cellspacing="6">
			
			<tr>
			
				<td width="50">  <div align="center"><span class="STYLE1"> 编号 </span></div></td>
				<td width="170"><div align="center"><span class="STYLE1">电视剧名称</span></div></td>
				<td width="60"><div align="center"><span class="STYLE1">类型</span></div></td>
			
			</tr>
			
			
			<s:iterator var="dsj" value="dianshijutenlist" status="status">  
					<tr>
					     
						<td> <!-- 编号 -->	<s:property value="#status.count"/>	</td>
						<td><!-- 电影名称 --><a href="${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=<s:property value="#dsj.vidId"/>" >	<s:property value="#dsj.vidName"/> </a> 	   	</td>
						<td colspan="2" align="center"><!-- 类型-->			<s:property value="#dsj.mintype.minName"/>	</td>
		    		</tr>
		   </s:iterator>
			
			
			
</table>

</body>
</html>