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
-->
</style>
</head>
<body>
		<table width="224" cellspacing="6">
			
			<tr>
			
				<td width="50">  <div align="center"><span class="STYLE1"> 编号 </span></div></td>
				<td width="130"><div align="center"><span class="STYLE1">电影名称</span></div></td>
				<td width="40"><div align="center"><span class="STYLE1">评分</span></div></td>
			
			</tr>
			
		
			<s:iterator var="gd" value="grades" status="status">  
			
					<tr>
					    
						<td> <!-- 编号 --><s:property value="#status.count"/>	</td>
						<td><!-- 电影名称 --><a href="${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=<s:property value="#gd.videoinfo.vidId"/>" >	<s:property value="#gd.videoinfo.vidName"/>  </a> 	   	</td>
						<td><!-- 评分-->		<s:property value="#gd.graCount"/>	</td>
		    		</tr>
		   
		</s:iterator>
			
	
		   
</table>

</body>
</html>