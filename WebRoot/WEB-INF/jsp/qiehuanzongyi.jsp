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
				<td width="130"><div align="center"><span class="STYLE1">综艺节目</span></div></td>
				<td width="40"><div align="center"><span class="STYLE1">评分</span></div></td>
			
			</tr>
			
			
			<c:forEach var="i" begin="1" end="10" step="1" >  
 			</c:forEach>
			<tr>
				<td> <!-- 编号 -->			1	</td>
				<td><!-- 电影名称 --><a href="#" >快乐大本营</a>		</td>
				<td><!-- 评分-->			0</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			2	</td>
				<td><!-- 电影名称 --><a href="#" >非诚勿扰</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			3	</td>
				<td><!-- 电影名称 --><a href="#" >娱乐百分百</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			4	</td>
				<td><!-- 电影名称 --><a href="#" >中国好声音</a>		</td>
				<td><!-- 评分-->			0</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			5	</td>
				<td><!-- 电影名称 --><a href="#" >天天向上</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			6	</td>
				<td><!-- 电影名称 --><a href="#" >康熙来了</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			7	</td>
				<td><!-- 电影名称 --><a href="#" >今晚谁当家</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			8	</td>
				<td><!-- 电影名称 --><a href="#" >至尊百家乐</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			9	</td>
				<td><!-- 电影名称 --><a href="#" >天天冲冲冲</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		    <tr>
				<td> <!-- 编号 -->			10	</td>
				<td><!-- 电影名称 --><a href="#" >向上吧少年</a>		</td>
				<td><!-- 评分-->			0	</td>
		    </tr>
		   
</table>

</body>
</html>