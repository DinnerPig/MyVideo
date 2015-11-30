<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
#main {
	width: 1024px;
	height: auto;
	margin: 0 auto;
}

#head {
	margin: 0 auto;
	width: 1024px;
	height: auto;
	color: #FFFFFF;
	background-color: black;
}

#bodyq {
	margin: 0 auto;
	width: auto;
	height: auto;
	margin-bottom: 5px;
	margin-top: 5px;
	background-color: #333333;
}

#bottom {
	border: 3px solid #CC0000;
	margin: 0 auto;
	width: 1024px;
	height: 80px;
}

#jishu li {
	margin-left: 20px;
	padding-top: 5px;
	list-style-type: none;
	float: left;
}

#left {
	background-color: #CCCCCC;
	float: left;
	width: 700px;
	border: 1px solid #999999;
	margin-top: 10px;
	text-align: left;
}

#neirong {
	background-color: #FFFFFF;
	color: #000000;
	border-bottom: 1px solid #CCCCCC;
}

#plshijian {
	background-color: #FFFFFF;
	color: #000000;
}

#right {
	margin-top: 10px;
	background-color: #CCCCCC;
	float: right;
	width: 300px;
	text-align: left;
}

#paihang li {
	list-style-type: none;
}

a:link,a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: red;
}

li a:link,li a:visited {
	color: black;
	text-decoration: none;
}

li a:hover {
	color: blue;
	text-decoration: underline;
}

.v a:link,.v a:visited {
	color: #000000;
	text-decoration: none;
}

.v a:hover {
	color: blue;
}

.STYLE1 {
	font-size: 24px;
	font-weight: bold;
}
</style>

<script type="text/javascript" src="javaScript/jquery-1.7.2.js">
	
</script>
<script type="text/javascript">
	var i = 0;
	function sub() {
		if (i == 0) {

			var params = $("#pingfeng").serialize();
			//ajax提交表单.function是回调函数,自动调用，从response中获取返回的信息
			$.post("PingfenServer", params, function(result) {
				//把JSON格式转换成对象格式
				//清空div中的内容
				alert("提交成功、感谢你对我们的支持！");
				$("#aaa").html("");
				$("#aaa").append("abcdefg");
			});
			i = 1;
		} else
			alert("你以提交过，有你的支持我们将做的更好！");
	}
	function texta() {
		document.getElementById("text").value = "";
	}
	function overtexta() {
		var str = document.getElementById("text").value;
		if (str == "") {
			document.getElementById("text").value = "我也来说两句...";

		}

	}
</script>
</head>

<body>
	<jsp:include page="top.jsp"/>

<div id="top">
<div id="head">影片>> &nbsp;&nbsp;<span id="b" style=" font-size:24px"><s:property value='model.vidName' /></span></div>
	 
	  <div id="bodyq">
	  	<div id="play" style="width:1024px; height:480px; margin:0 auto;background-color:#000000">
	  	<center>
<div >
<div style="width:1024px;height: 10px;margin-top: -10px;"></div>
 <div>
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="800" height="450">
    <param name="movie" value="<%=basePath%>page/Flvplayer.swf" />
    <param name="quality" value="high" />
    <param name="allowFullScreen" value="true"/>
    <param name="FlashVars" value="vcastr_file=<%=basePath%><s:iterator var='videocount' value='model.videocounts'><s:property value='#videocount.couUrl' /></s:iterator>&LogoText=''  &BufferTime=3" />
    <embed src="http://localhost:8080/MyVideo/page/Flvplayer.swf" allowFullScreen="true" FlashVars="vcastr_file=<%=basePath%><s:iterator var='videocount' value='model.videocounts'><s:property value='#videocount.couUrl' /></s:iterator>&LogoText=wanglflv" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="800" height="450"></embed>
  </object>
 
  </div>
</div>          
</center>
	  	
	  	
	  	</div>
	  </div>
<div id="main">
	  <div id="bottom" >
		<div id="jishu">
		  <ul>
		  <%int aa=0; %>
			<c:forEach items="${Dianshijishu}" var="item">  
			<%aa=aa+1;%>
					<li> <div id=jishu><a href="BofangServlet?vidid=${item.vidId}&name=dianshiju&couId=${item.couId}">第 <%=aa%> 集</a></div>
			</c:forEach>
		  </ul>
		</div>
	   </div>
	   <div style="background-color:#CCCCCC; float:left; margin-top:5px; width:700px;"><center>
	  <script type="text/javascript" src="javaScript/jquery-1.7.2.js"></script>
<script type="text/javascript">
var n=0;
function pinglunsub(){
		if(n==0)
		{
				   var params = $("#ff1").serialize();
				  //ajax提交表单.function是回调函数,自动调用，从response中获取返回的信息
				  $.post("pinglunServer",params,function(result){
					   //把JSON格式转换成对象格式
					   //清空div中的内容
					   var obj = $.parseJSON(result);
					   alert("提交成功、感谢你对我们的支持！");
			           $(".outer").html("");
					   $(".outer").append("<tr class='inner'>"+
							      "<td>用户:"+obj.uname+" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
							      "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评论时间：刚刚</td></tr>"+
			                      "<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+obj.comSubtance+"</td></tr>"			                      			                      
					  );					   
				  });	
				  n=1;
    }
		else 
			alert("你以评论过，有你的支持我们将做的更好！");
}
</script>

  <form id="ff1">
    
    <span style="margin-top:-10px; "><input type="text" name="textarea"  id="text" value="我也来说两句..." onfocus="texta()" onblur="overtexta()" style="width:620px;height: 30px; " ></span>
		 	<input type="hidden" name="vidId" value="${DYBean.vidId}"> 
		 	<input id="create" type="button" value="评论" onclick="pinglunsub();">
    <br>
    
    <div id="left">
    <table border="0">
    <tr class="outer">
           
    </tr>
	 <c:forEach items="${pinglun}" var="item">  
    	<tr>  
     		 <td>用户:${item.uname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		 评论时间:${item.time}</td>
    	</tr>
    	<tr>  
     		 <td>&nbsp;&nbsp;&nbsp;&nbsp; ${item.comSubtance}</td>
    	</tr>
     </c:forEach>
  		</table>
   </div>
  </form>

	        
 	  </div>
 	  
	  
	
	<div id="right">
	<div><form action="PingfenServer" id="pingfeng">
	     <span style="margin-left: 15px;'">我要评分：</span>  <input type="button" value="提交分数" onclick="sub();" style="margin-left: 100px;"><br>
	    <input type="radio" name="pf" value=10 style="margin-left: 15px" checked="checked">10
		<input type="radio" name="pf" value=9 style="margin-left: -5px">9
		<input type="radio" name="pf" value=8 style="margin-left: -5px">8
		<input type="radio" name="pf" value=7 style="margin-left: -5px">7
		<input type="radio" name="pf" value=6 style="margin-left: -5px">6
		<input type="radio" name="pf" value=5 style="margin-left: -5px">5
		<input type="radio" name="pf" value=4 style="margin-left: -5px">4
		<input type="radio" name="pf" value=3 style="margin-left: -5px">3
		<input type="radio" name="pf" value=2 style="margin-left: -5px">2
		<input type="radio" name="pf" value=1 style="margin-left: -5px">1
	    <input type="hidden" name="vidId" value="${DYBean.vidId}">
	
	</form></div>
	
	<div id="rightTitle">
	  <div id="paihang" style="background-color:#FFFFFF; color:#000000;">
	   排行榜
			<ul>
				
			</ul>
	  </div>
	</div>
	</div>
	<div> 
	</div>




</body>

</html>
