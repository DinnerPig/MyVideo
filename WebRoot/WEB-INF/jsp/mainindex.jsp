<%@page import="com.etc.myvideo.user.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影视</title>

<script language="javascript">
	window.onload = resetTab;
	function getTabTitle(tab) {
		var childNodesList = tab.childNodes;
		var titleNodes = new Array();
		var j = 0;
		var i;
		for (i = 0; i < childNodesList.length; i++) {
			if (childNodesList[i].nodeName == "H1") {
				titleNodes[j] = childNodesList[i];
				j++;
			}
		}
		return titleNodes;
	}
	function getTabContent(tab) {
		var childNodesList = tab.childNodes;
		var tabContent = new Array();
		var j = 0;
		var i;
		for (i = 0; i < childNodesList.length; i++) {
			if (childNodesList[i].nodeName == "DIV") {
				tabContent[j] = childNodesList[i];
				j++;
			}
		}
		return tabContent;
	}
	function resetTab() {
		var allDiv = document.getElementsByTagName("div");
		var tab = new Array();
		var j = 0;
		var i;
		for (i = 0; i < allDiv.length; i++) {
			if (allDiv[i].className == "tabs") {
				tab[j] = allDiv[i];
				j++;
			}
		}
		var tabTitle, tabContent;
		for (i = 0; i < tab.length; i++) {
			tabTitle = getTabTitle(tab[i]);
			tabTitle[0].className = "selectTab";
			tabContent = getTabContent(tab[i]);
			tabContent[0].className = "selectContent";
			for (j = 1; j < tabTitle.length; j++) {
				tabTitle[j].className = "unselectTab";
				tabContent[j].className = "unselectContent";
			}
		}
	}
	function changTab(tab) {
		var tabTitle, tabContent, i;
		if (tab.className != "selectTab") {
			tabTitle = getTabTitle(tab.parentNode);
			tabContent = getTabContent(tab.parentNode);
			for (i = 0; i < tabTitle.length; i++) {
				if (tabTitle[i].className == "selectTab") {
					tabTitle[i].className = "unselectTab";
				}
				if (tabContent[i].className == "selectContent") {
					tabContent[i].className = "unselectContent";
				}
			}
			tab.className = "selectTab";
			for (i = 0; i < tabTitle.length; i++) {
				if (tabTitle[i].className == "selectTab") {
					tabContent[i].className = "selectContent";
					break;
				}
			}
		}
	}

	function ClearValue() { //清空文本
		var txt = document.getElementById("text");
		if (txt.value == "请输入视频名...") {
			document.getElementById("text").value = "";
			txt.style.color = "black";
		}
	}
	function WriteValue() { //设置默认值
		var txt = document.getElementById("text");
		if (txt.value == "") {
			txt.value = "请输入视频名...";
			txt.style.color = "#D5D5D5";
		}
	}
	
	
	
	
</script>


<script src="RevealTrans.js"></script>
<style type="text/css">
<!--
#Layer1 {
	width: 745px;
	height: 370px;
	Margin-top: -30px;
	Margin-right: 0px;
	background-color: #000000;
	border: 1px solid #999999;
}

#Layer3 {
	width: 275px;
	height: 371px;
	background-color: #000000;
	color: #999999;
	Margin-top: -30px;
}

#Layer5 {
	width: 1028px;
	height: 108px;
}
/* 最大层Div*/
#Layer6 {
	width: 1024px;
	height: auto;
	marign: auto;
}

body {
	text-align: center
}

#align {
	text-align: center
}

#float  li {
	list-style-type: none;
	float: left;
	text-align: center;
	Margin-top: 10px;
}

#mokuai {
	width: 1028px;
	height: 580px;
	background-color: #FDFDFD;
	Margin-Top: 20px;
}

#paixing {
	Margin-top: -8px;
	Margin-left: 8px;
	width: 255px;
	height: 345px;
	border: 1px solid #999999;
}

<!--
排行榜-->#globallink {
	width: 250px;
	height: 100px;
	border: 1px solid #999999;
	color: white;
}

#globallink ul {
	list-style: none;
	padding: 0px;
	margin: 0px;
}

#globallink li {
	float: left;
	text-align: center;
	border: 1px solid #cccccc;
	width: 48px;
	margin-left: -1px;
}

#globallinkul li {
	float: left;
	text-align: center;
	border: 0px solid #cccccc;
	width: 68px;
	margin-left: -1px;
	margin-top: 4px;
	list-style-type: none;
}

#globallink a {
	font-size: 12px;
	display: block;
	padding: 4px 3px 5px 3px;
	color: white;
	margin: 0px;
}

#globallink a:link,#globallink a:visited {
	color: white;
	text-decoration: none;
}

#globallink a:hover {
	color: white;
	text-decoration: underline;
	background-color: #999999;
	/* 替换背景图片 */
}

#globallink a:focus {
	font-size: 14px;
	text-decoration: underline;
	color: blue;
}

<!--
end 排行榜-->#topmenu {
	background-color: #999999;
}

#logon li {
	float: left;
	text-align: center;
	border: 0px solid #cccccc;
	margin-left: -1px;
	margin-top: 4px;
	list-style-type: none;
}

#logon a {
	font-size: 12px;
	color: #333333;
	text-decoration: none;
}

#logon a:HOVER {
	font-size: 12px;
	color: red;
}

.tabs {
	width: auto;
	height: auto;
	border: 0px solid red;
	margin-top: 4px;
	margin-left: 5px;
}

.selectTab,.unselectTab {
	border: 1px solid #BDDFF9;
	width: 48px;
	height: 23px;
	line-height: 23px;
	vertical-align: middle;
	text-align: center;
	background-color: #37709B;
	margin-left: -1px;
	margin-top: 0px;
	font-weight: bold;
	font-size: 12px;
	color: #000000;
	cursor: pointer;
	float: left;
}

.unselectTab {
	color: #37709B;
	background-color: #000000;
}

.unselectContent {
	display: none;
}
</style>
</head>


<body>

	<center>

		<div style="background-color:#222222;height:40px;color:white; ">
			<div style="width:1024px;">
				<div id="globallink">
					<ul id="globallinkul">
						<li style="	margin-left:5px;"><a style="font-size:20px;	"
							href="${ pageContext.request.contextPath }/index.jsp">首页</a></li>
						<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=1&page=1">电影</a></li>
						<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=2&page=1">电视剧</a></li>
						<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=3&page=1">动漫</a></li>
						<li><a style="font-size:20px;" href="${pageContext.request.contextPath}/videoinfo_findbymaxtype.action?maxtype.maxId=4&page=1">综艺</a></li>
					</ul>
					<br>
				</div>
			</div>

		</div>
		<div style="background-color:red;height: 5px;color:white; "></div>


		<div id=Layer6>
			<form id="san" action="${ pageContext.request.contextPath }/videoinfo_findbylikename.action"  target="main" method="get">
				<div id="Layer5" style="height: 90px">
					<ul id="logon">
						<li style="margin-left:-50px;margin-top:-15px;"><img
							width="150" height="80" src="image/logo.png" /></li>
						
						<li>
							<div>

  										<div class="box" style="margin-left:100px; margin-top: 20px;">
  									   <input type="text" class="text" id="text"  name="vidName" style="color:#D5D5D5;" value="请输入视频名..."  onfocus="ClearValue();" onblur="WriteValue();"/>
  										<input class="submit" type="submit" value="搜索"  />
  										<input name="page" type="hidden" value="1" /> 
  											</div>
 								
								
								
							</div>
						</li>



						<%
							User user = (User) session.getAttribute("existUser");
							if (user != null) {
						%>

						<li style="margin-left:300px; margin-top: 24px;">
						
						    
							<a href="user_findUserInfo.action"target="_blank">${existUser.uName}</a>&nbsp;&nbsp;
							 <a href="<%=basePath%>userupload_getUserVideoInfo.action">查看上传信息</a>
							&nbsp;&nbsp;<a href="<%=basePath%>useraddvideoinfo.jsp"target="_blank">我要上传</a>&nbsp;&nbsp;<a href="user_quit.action" target="_blank">退出 </a>
						</li>
						<li>
							
						</li>



						<%
							} else {
						%>

						<li style="margin-left:400px; margin-top: 24px;">
							<a href="login.jsp" target="_blank">登录</a>&nbsp;&nbsp;
							<a href="register.jsp" target="_blank">注册 </a>
						</li>
						<%
							}
						%>

					</ul>
				</div>
			</form>
			<div id=float>

				<li>
					<div id="Layer1">
						<!--图片切换-->
						<jsp:include page="switchimage.jsp" />
					</div>
				</li>

				<!-- 排行榜 -->
				<li>
					<div id="Layer3">
						&nbsp;
						<div id="paixing">

							<div class="tabs">
								<h1 onMouseOver="changTab(this)">热榜</h1>
								<h1 onMouseMove="changTab(this)">电影</h1>
								<h1 onMouseOver="changTab(this)">电视剧</h1>
								<h1 onMouseMove="changTab(this)">动漫</h1>
								<h1 onMouseMove="changTab(this)">综艺</h1>
								<br> <br>
								<div>
									<!--切换热榜-->
									<jsp:include page="qiehuanrebang.jsp" />
								</div>
								<div>
									<!--切换 电影 -->
									<jsp:include page="qiehuandianying.jsp" />
								</div>
								<div>
									<!--切换电视剧-->
									<jsp:include page="qiehuandianshiju.jsp" />
								</div>
								<div>
									<!--切换动漫-->
									<jsp:include page="qiehuandongman.jsp" />
								</div>
								<div>
									<!--切换综艺-->
									<jsp:include page="qiehuanzongyi.jsp" />
								</div>
							</div>
						</div>
					</div>
				</li>

			</div>
			<div style="height:380px;"></div>
			<!-- 推荐 -->

			<div id=mokuai>
				<jsp:include page="dianshiju.jsp" /><!-- 电视剧-->
			</div>
			<div></div>
			<div>
				<jsp:include page="adone.jsp" /><!-- 一号广告 -->
			</div>
			<div id=mokuai>
				<jsp:include page="dianying.jsp" /></div>
			<!-- 电影-->

			<div>
				<jsp:include page="adtwo.jsp" /><!-- 2号广告 -->
			</div>
			<div></div>
			<div id=mokuai>
				<jsp:include page="zongyi.jsp" /></div>
			<!-- 综艺-->
			<div></div>

			<jsp:include page="adthree.jsp" /><!-- 3号广告 -->
			<div id=mokuai>
				<jsp:include page="dongman.jsp" /></div>
			<!-- 动漫-->
			<div></div>
			<jsp:include page="adsi.jsp" /><!-- 4号广告 -->

			<div>
				<div style="height: 300px;  color:#FDFDFD">
					<jsp:include page="bottom.jsp" /></div>
				<div></div>

			</div>
	</center>
</body>
</html>