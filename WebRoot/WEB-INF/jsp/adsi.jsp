<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
      <%@ taglib uri="/struts-tags" prefix="s"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		
		<s:iterator var="ad" value="ads">
		<s:if test="#ad.id == 4">
		<s:if test="#ad.adzhi != null">
		
			<a href="#"><img src="${ pageContext.request.contextPath }/<s:property value="#ad.adimage"/>" height=100 width=1024 border="0"></a>
		</s:if>
		</s:if>
	</s:iterator>	
	</div>
</body>
</html>