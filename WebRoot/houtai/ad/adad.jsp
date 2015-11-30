<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	 
		<div id="tow">		
		<form action="ad_saveAd.action" method="post" enctype="multipart/form-data">
		<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray"
				border="1" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word" > 
		 <tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" colspan="2"><strong>添加广告</strong>
					</td>
				</tr>
		 <tr><td> <font style="margin-left:2px;">跳转的地址：</font></td><td><input name="adzhi" type="text"  width="300px" height="20"size="30"/></td></tr>
		<tr><td> 图片地址:</td><td><input name="adimagefile" type="file" id="imgfile" size="30"/></td></tr>
		  <br /><br />
		  <tr  align="center"> <td colspan="2">	<input  style="margin-left:100px;" type="submit" value="提交"></td></tr>
			</table>
			</form>	
		</div>
	</div>
</body>
</html>