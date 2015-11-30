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
		<table width="240" cellspacing="6">
			
			<tr>
			
				<td width="50">  <div align="center"><span class="STYLE1"> 编号 </span></div></td>
				<td width="170"><div align="center"><span class="STYLE1">名称</span></div></td>
				<td width="70"><div align="center"><span class="STYLE1">类型</span></div></td>
			
			</tr>
			
				<s:iterator var="rb" value="dianjirb" status="status"> 
				
					<tr>
					  
						<td> <!-- 编号 -->	<s:property value="#status.count"/>	</td>
						<td><!-- 名称 --><a href="${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=<s:property value="#rb.videoinfo.vidId"/>">	<s:property value="#rb.videoinfo.vidName"/>  </a> 	   	</td>
						<td><!-- 类型-->		<s:property value="#rb.videoinfo.maxtype.maxName"/>	</td>
		    		</tr>
		    		
			</s:iterator>
</table>

</body>
</html>