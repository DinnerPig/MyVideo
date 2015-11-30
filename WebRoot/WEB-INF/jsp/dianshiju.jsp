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



</style>

</head>
<body>
		<div style="width:106; height:32px;text-align:left" ><img src="${ pageContext.request.contextPath }/image/dianshiju.png"></div>
		
		<div style="width:auto; height:2px; background-color:#0033FF"> </div>
		
		<div style="margin-left:-50px;" >
			<ul id="dianshiju">
			
		
				<s:iterator var="p" value="dianshijutenlist">
			
					<li >
								<div style="width:160px;height:250px;"> 
									<a href="${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=<s:property value="#p.vidId"/>"><img src="${ pageContext.request.contextPath }/<s:property value="#p.vidImage"/>" width="158" height="200" border="0"><br>									
									</a><br> 
									<span style="color:#999999;"> <font size=2 ><s:property value="#p.vidjianjie"/></font></span>
									
								</div>
				</li>
						
			</s:iterator>	
					
		
			</ul>
		</div>

</body>
</html>