<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#one{
width:830px;
height:500px;
margin:0 auto;
}
#tow{
width:610px;
height:400px;
margin-top:50px;
margin-left:110px;
}
#three{
width:600px;
height:350px;
border:1px  #FF0000 solid;
margin-left:5px;
margin-top:10px;
}
</style>
</head>
<body>

	<div id="one">
	 <div style="margin-top:30px;font-size:20px;">编辑广告位 </div>
		<div id="tow">		
		<form action="ad_updateAd.action" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="adimage" value="<s:property value="model.adimage"/>">
		 <font style="margin-left:2px;">广告id：</font>
		 <input name="id" type="text" size="30" width="300px" height="20" value="<s:property value="model.id"/>"   readonly />
		  <font style="margin-left:2px;">跳转的地址：</font>
		  <input name="adzhi" type="text" size="30" width="300px" height="20"  value="<s:property value="model.adzhi"/>" />
		  
		  <br /><br />
		  图片地址:<input name="adimagefile" type="file" id="imgfile" size="25"  />
		  <br /><br />
		  图片显示：
		  <img src="<s:property value="model.adimage"/>" width="165" height="160" />
			<input  style="margin-left:100px;" type="submit" value="提交">
			</form>	
		</div>
	</div>
</body>
</html>