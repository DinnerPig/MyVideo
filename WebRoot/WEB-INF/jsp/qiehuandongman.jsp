<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
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
				<td width="130"><div align="center"><span class="STYLE1">动漫名称</span></div></td>
				<td width="40"><div align="center"><span class="STYLE1">评分</span></div></td>
			
			</tr>
			
			
			<c:forEach var="i" begin="1" end="10" step="1" >  
			</c:forEach>
			<tr>
				<td> <!-- 编号 -->		1	</td>
				<td><!-- 电影名称 --><a href="#" >火影</a> 	</td>
				<td><!-- 评分-->			10	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		2	</td>
				<td><!-- 电影名称 --><a href="#" >	   刀剑神域  </a> 	</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		3	</td>
				<td><!-- 电影名称 --><a href="#" >	  笨蛋召唤测试兽</a> 	</td>
				<td><!-- 评分-->			5.0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		4	</td>
				<td><!-- 电影名称 --><a href="#" >	    龙虎斗   </a> 	</td>
				<td><!-- 评分-->			9.0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		5	</td>
				<td><!-- 电影名称 --><a href="#" >	   千与千寻的神隐  </a> 	</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		6	</td>
				<td><!-- 电影名称 --><a href="#" >	  我的妹妹  </a> 	</td>
				<td><!-- 评分-->			0</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		7	</td>
				<td><!-- 电影名称 --><a href="#" >	  我的朋友很少  </a> 	</td>
				<td><!-- 评分-->			10</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->	    8  	</td>
				<td><!-- 电影名称 --><a href="#" >	   无限斯特拉托斯   </a> 	</td>
				<td><!-- 评分-->			9.0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		9	</td>
				<td><!-- 电影名称 --><a href="#" >	    银魂   </a> 	</td>
				<td><!-- 评分-->			8.0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->		10	</td>
				<td><!-- 电影名称 --><a href="#" >	  罪恶王冠 </a> 	</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    
</table>

</body>
</html>