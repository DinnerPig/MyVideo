<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<form action="DianshijuUploadServlet" method="post" enctype="multipart/form-data">
 	<table cellspacing="20">
 	<tr>  <td>新增电视剧：</td> </tr>
	 <tr>
		<td>--影片名称</td><td> <input type="text" name="vidName"/></td> 
		<td>--大类型  </td><td><select name="vidMax">
			<option value="电视剧"> 电视剧</option>	
			</select>
		</td> 
		<td>--小类型</td><td> <select name="vidMin">
			<option value="武侠">武侠</opttion>	
			<option value="悬疑">悬疑 </option>	
			<option value="古装">古装</option>	
			<option value="穿越">穿越 </option>	
			<option value="偶像">偶像</option>	
			<option value="恐怖">恐怖 </option></select>
		</td> 
	</tr>
	<tr>
		<td>--地区</td><td> <select name="vidArea"> 
			<option value="大陆">大陆</option>	
			<option value="台剧">台剧</option>	
			<option value="港剧">港剧</option>	
			<option value="日韩">日韩</option>	
			<option value="欧美">欧美 </option>	</select>
		</td> 
		<td>--导演</td><td> <input type="text" name="vidDirector" /></td> 
		<td>--明星</td><td> <input type="text" name="vidStar" /></td> 
	</tr>
	<tr>
	
		<td>--年份</td><td> <input type="text" name="vidYear" />  </td> 
		<td>--影片简介</td><td> <input type="text" name="vidjianjie" /> </td> 
		<td>--影片内容简介</td><td> <input type="text" name="vidInfo" />  </td> 
		</tr>
	<tr>
		 <td>--封面图片</td><td> <input name="imageaddr" type="file" id="picture2">  </td> 
		<td>--状态</td><td>
		<select name="vidState">
			<option value="连载中">连载中</opttion>	
			<option value="完结">完结 </option>	
			</select></td> 
		<td>--影片集数</td><td> <input type="text" name="couCount" /></td> 
		</tr>
	<tr>
		
		
		<td> <input type="submit" name="Submit2" value="提交"> </td> 
		</tr>
	<tr>
		
	</table>
  </form>
	<br><br>
  <form action="adddianshijuupdateServlet" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td>更新电视剧信息:</td>
		</tr>
		<tr>
				<td>--选择电视剧<select name="vidId"> 
					<c:forEach items="${DianshijuItem}" var="item">  
					  <c:if test="${item.vidState==连载中} }"></c:if>
						<option value="${item.vidId}">${item.vidName} </option>	
					</c:forEach>	</select></td>					
				<td>--影片集数<input type="text" name="couCount"></td>
				<td>--时长<input type="text" name="couDuration"></td>
		</tr>
		<tr>
				<td>--视频 <input name="imageaddr" type="file" id="picture2">  </td> 
				<td><input type="submit" name="Submit2" value="提交"></td>
		</tr>
		<tr></tr>
		<tr></tr>
	</table>
	</form>





</div>
</body>
</html>