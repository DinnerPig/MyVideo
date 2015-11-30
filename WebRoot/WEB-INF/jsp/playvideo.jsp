<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><s:property value="model.vidName" /></title>


<link rel="stylesheet" type="text/css" href="js/jsuggest.css">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jSuggest.js"></script>
<script type="text/javascript" src="" <%=basePath%>javaScript/html5media.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var video = $('#mysp');

		$("#play").click(function() {
			video[0].play();
		});
		$("#pause").click(function() {
			video[0].pause();
		});
		$("#go10").click(function() {
			video[0].currentTime += 10;
		});
		$("#back10").click(function() {
			video[0].currentTime -= 10;
		});
		$("#rate1").click(function() {
			video[0].playbackRate += 2;
		});
		$("#rate0").click(function() {
			video[0].playbackRate -= 2;
		});
		$("#volume1").click(function() {
			video[0].volume += 0.1;
		});
		$("#volume0").click(function() {
			video[0].volume -= 0.1;
		});
		$("#muted1").click(function() {
			video[0].muted = true;
		});
		$("#muted0").click(function() {
			video[0].muted = false;
		});
		$("#full").click(function() {
			video[0].webkitEnterFullscreen(); // webkit类型的浏览器
			video[0].mozRequestFullScreen(); // FireFox浏览器
		});
	});

	

	//得到消息（输入的字）
	function xiaoshi() {
		
		var liaotian = document.getElementById("liaotian").value;
		var uid = document.getElementById("uid").value;
		var uName = document.getElementById("uName").value;
		
		if (uid == "") {
			alert("请先登录");
			return;
			
		}
		if (liaotian == "") {
			alert("发送信息不能为空");
			return;
			
		}
		$("#liaotian").val('');
		
		
		
		var couId = document.getElementById("couId").value;
		send(liaotian, uName, couId);
	}

	//发送聊天
	function send(liaotian, uName, couId) {

		if (liaotian != null && liaotian != undefined && liaotian != "") {

			// 1.创建异步交互对象
			var xhr = createXmlHttp();
			// 2.设置监听
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var data = encodeURI(xhr.responseText, "utf-8");

						if (data != null) {
							
						
						} else {

						}
					}
				}
			}
			// 3.打开连接
			xhr.open("GET","${pageContext.request.contextPath}/messages_talktoall.action?couId="+ couId + "&infoToAll=" + liaotian + "&uname="+uName, true);
			// 4.发送
			xhr.send(null);

		}
	}

	function send2() {
		var couId = document.getElementById("couId").value;
		$.getJSON("messages_gettalktoall.action", {
			couId : couId
		}, function(data) {
			if (data != null) {
				var str = "";
				
				
				for (var i = 0; i < data.length; i++) {
					str += data[i].uname+ ":" + data[i].infoToAll + "<br>";

				}
				$("#content").html(str);

			} else {

			}
		});
	}
	//得到 弹幕
	function getDanmu() {

		var couId = document.getElementById("couId").value;
		$.getJSON("danmu_getDanmu.action", {
			couId : couId
		}, function(data) {
			if (data != null) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += data[i].infoToAll + "<br>";
				}
				//添加一个用于接收字幕的div
				
				
				var text_screen = $("<div style='top:0px;color:" + getRandomColor() + ";'>" + str
						+ "</div>");
				str=" ";
				$(".main .middle1").append(text_screen); //.screen后加上字幕div
				var text_width = text_screen.width(); //获取div的宽度
				$(".main .middle1 div").css("right", "-" + text_width + "px");
				run_screen();
			} else {
			}
		});
	}
</script>
<script >
	var timer = null;
	var timer2 = null;
	function start_timer() {
		if (timer == null)
			timer = window.setInterval("send2()", 500);
		if (timer2 == null)
			timer2 = window.setInterval("getDanmu()",2000);
	}



	//添加评论
	function savedata() {

		var uid = document.getElementById("uid").value;
		var couId = document.getElementById("couId").value;
		var editor = $("#commentarea").xheditor({
			tools : 'simple',
			skin : 'default'
		});
		editor.focus();
		editor.setSource($("#commentarea").val());
		var op = editor.getSource();
		if (uid == "") {
			alert("请先登录");
			return;
			
		}
		if (op == "") {
			alert("评论不能为空");
			return;
			
		}
		
		$.getJSON("comment_savecomment.action", {
			comSubtance : encodeURI(op, "utf-8"),
			couId : couId,
			uid : uid
		}, function(data) {
			if (data == 1) {
				
				showcomment(1);
			} else {

			}
		});

	}

	function createXmlHttp() {
		var xmlHttp;
		try { // Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			try {// Internet Explorer
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e) {
				}
			}
		}

		return xmlHttp;
	}

	function checkdanmu() {
		// 获得文件框值:
		var couId = document.getElementById("couId").value;
		var uid = document.getElementById("uid").value;
		if (uid == "") {
			alert("亲先登录");
			return;
			
		}
		var text = $(".s_text").val();//获得input里的内容
		if (text == "") {
			alert("请先输入弹幕");
			return;
			
		}
		$("#liaotian").val('');
		
		
		$.getJSON("danmu_xianshidanmu.action", {
			couId : couId ,infoToAll:text
		}, function(data) {
			if (data != null) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
					str += data[i].infoToAll + "<br>";
				}
				//添加一个用于接收字幕的div
				
				
				var text_screen = $("<div style='top:0px;color:" + getRandomColor() + ";'>" + str
						+ "</div>");
				$(".main .middle1").append(text_screen); //.screen后加上字幕div
				var text_width = text_screen.width(); //获取div的宽度
				$(".main .middle1 div").css("right", "-" + text_width + "px");
				run_screen();
			} else {
			}
		});
	/* // 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == 200) {
					
					var data=xhr.responseText;
				
					if (data!= null) {
						
						var str = "";
						for (var i = 1; i < data.length; i++) {
							str += data[i].infoToAll + "<br>";
						}
								
								//添加一个用于接收字幕的div
								var text_screen = $("<div style='top:0px;color:"+ getRandomColor() + ";'>" + str + "</div>");
								$(".main .middle1").append(text_screen); //.screen后加上字幕div
								var text_width = text_screen.width(); //获取div的宽度
								$(".main .middle1 div").css("right","-" + text_width + "px");
								run_screen(); 
					} else {

					}
				}
			}
		};
		// 3.打开连接
		xhr.open("GET",
				"${pageContext.request.contextPath}/danmu_xianshidanmu.action?couId="
						+ couId + "&infoToAll=" + text, true);
		// 4.发送
		xhr.send(null);  */
	}
</script>


<style>
#id1 {
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	z-index: 49;
	display: none;
}

#id2 {
	top: 200px;
	position: absolute;
	z-index: 50;
	display: none;
	border: 3px solid #E5E5E5;
	left: 500px;
	background-color: white;
	background-image: url(img/body.jpg)
}
</style>

<script type="text/javascript">
	$(window).load(function() {
		start_timer();
	});
</script>


<script >
	//让字幕动起来
	function run_screen() {

		var screen_width = $(".main .middle1").width(); //获得字幕板的大小
		$(".middle1 div").animate({
			right : +screen_width + "px"
		}, 6000, function() {
			$(this).remove(); //移除div和字体
		});
	}

	//设置字体的随机颜色
	function getRandomColor() {
		return '#' + (function(h) {
			return new Array(7 - h.length).join("0") + h
		})((Math.random() * 0x1000000 << 0).toString(16))
	}

	//设置随机
	function RandomNum(Min, Max) {
		var Range = Max - Min;
		var Rand = Math.random();
		var num = Min + Math.round(Rand * Range);
		return num;
	}
	function kaidm() {

		$(".main .middle1 div").toggle();
		timer2 = null;
		start_timer();
		e.stopPropagation(); //阻止事件冒泡，否则事件会冒泡到下面的文档点击事件 
	}
	function guandm() {

		clearTimeout(timer2);
		$(".main .middle1 div").hide();
	}
	//显示评论
	function showcomment(page) {
		var couId = document.getElementById("couId").value;
		var but = document.getElementById("but");
		var commentdiv = document.getElementById("commentdiv");
		
		var editor = $("#commentarea").xheditor({
			tools : 'simple',
			skin : 'default'
		});

		editor.focus();
		editor.setSource($("#commentarea").val());
		
		if (but.value == "展开评论") {

			// 1.创建异步对象
			var xhr = createXmlHttp();
			// 2.设置监听
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {

						var data=xhr.responseText;
						
						if (data != null) {
						
							$("#commentdiv").html(data);
						} else {
							$("#commentdiv").html("出错了");
						}
					}
					
					
				}
				
			}
			// 3.打开连接
			xhr.open("GET","${pageContext.request.contextPath}/comment_findByPagecouId.action?couId="+ couId + "&page=" +page , true);
			// 4.发送
			xhr.send(null); 
			but.value = "关闭评论";
		} else {
			commentdiv.innerHTML = "";
			but.value = "展开评论";
		}
		
	
		
		

	}

	function show() {

		id1.style.height = window.screen.height + "px";
		id1.style.width = window.screen.width + "px";
		id1.style.display = 'block';
		id2.style.display = 'block';
	}

	//
	function hide() {
		id1.style.display = 'none';
		id2.style.display = 'none';
	}
	
	
	//登录
	function check() {
		var uMail = document.getElementById("uMail").value;
		var uPassword = document.getElementById("uPassword").value;
		if (uMail == "" || uPassword == "") {
			alert("亲，不要输入空值O(∩_∩)O哈哈~");
			return;
		}
		$.post("user_AJAXlogin.action", {
			uMail : uMail,
			uPassword : uPassword
		}, function(data) {
			if (data == "0") {
				hide();
				alert("用户出错了");
			} else {
				hide();
				window.location.reload();

			}
		});

	}
	
	
	
	function dianzan() {
		var couId = document.getElementById("couId").value;
		var uid = document.getElementById("uid").value;
		var zanCount = "${sessionScope.zanCount}";
		if (uid == "") {
			show();
		} else {
			$.post("comment_chadianzan.action", {
				uid : uid,
				couId : couId
			}, function(data) {
				if (data == -1) {
					alert("您已经赞过了");
				} else {
					var html = "<a style='cursor:pointer;color: red'>赞(" + data
							+ ")</a>"
					document.getElementById("zan").innerHTML = html;
				}
			});
		}
	}

	
	function sou() {
		
		var con = document.getElementById("search").value;
		location.href = "videoinfo_findbylikename.action?vidName=" + con;
	}

</script>




</head>
<body
	style="text-align: center; background-repeat: no-repeat; background-position: center top;background-image: url(img/066.jpg);">


	<div class="main">
		<div class="top1" style="width: 1000px;">
			<div
				style="float: left; width: auto; height: 50px; margin-left: 20px;background-color: black;">
				<a href=""> <img src="img/log1.png"
					style="width: auto; height: 50px" />
				</a>
			</div>
			<div
				style="float: right; height: 50px; margin-top: auto; width: 600px;">
				<div style="float: left;">
					<input style="width: 200px" id="search" /> <input type="button"
						value="搜索" onclick="sou()" />
				</div>
				<span id="dengluhou"></span>
				<div style="float: right;height:40px;width:200px;">
					<c:if test="${not empty  sessionScope.existUser}">
						<a style="cursor: pointer;" ><label id="label2">用户名：${sessionScope.existUser.uName } </label></a>
					</c:if>
					<c:if test="${empty sessionScope.existUser}">
						<label id="check">

							<div id="xianshi"
								style="float:right;width: 300px; text-align:right;">
								<a onclick="show()">登录 </a> <a href="register.jsp">注册 </a>

							</div>
						</label>
					</c:if>
				</div>
			</div>
		</div>
		<div style="width: 100%;height: 500px;background-color:black">
			<div id="shipin" class="middle1" style="float: left;">
				<video id="mysp" width=100% height="490px" poster="img/c3.jpg"
					controls="controls"> 
					<source
					src="<%=basePath%><s:iterator var='videocount' value='model.videocounts'><s:property value='#videocount.couUrl'/></s:iterator>"
					type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'></source> </video>
			</div>

			<div
				style=" float: right; margin-top: 0px; background-color: black; width:180px;
			height: 497px;overflow:auto;color: white; text-align: left;"
				id="content"></div>
		</div>

		<div class="play1">
			<button id="play">播放</button>
			<button id="pause">暂停</button>
			<button id="go10">快进</button>
			<button id="back10">快退</button>
			<button id="rate1">播放速度+</button>
			<button id="rate0">播放速度-</button>
			<button id="volume1">声音+</button>
			<button id="volume0">声音-</button>
			<button id="muted1">静音</button>
			<button id="muted0">解除静音</button>
			<button id="full">全屏</button>
		</div>
		<div class="danmu" style="">
			<div class="send" style="float: left;margin-left:0px;">
				<div style="float: left;margin-left:0px;">
					弹幕 <input type="button" name="course" value="开" onclick="kaidm()"
						style="width: 40px;background-color: green" /> <input
						type="button" name="course" value="关" onclick="guandm()"
						style="width: 40px;background-color: green" />
				</div>
				<input class="s_text" id="liaotian" name="danmu"
					style="background-color: #A2FFC5" /> 
				
			
					<input class="s_btn" id="fasong" type="button" value="发送" onclick="xiaoshi()"
					style="background-color: blue; /* cursor: pointer; */width: 80px" />
				<button class="btn1" onclick="checkdanmu()">发送弹幕</button>
			</div>
			<div style="float: right; width: 200px; margin-top: 8px;">
				<a id="zan" style="cursor:pointer" onclick="dianzan()">赞(${sessionScope.zanCount})</a>
				<a>点击数(<s:property value='#videocount.couClick' />)</a>
				<a href="<%=basePath%>videocount_downloadFile.action?fileName=<s:iterator var='videocount' value='model.videocounts'><s:property value='#videocount.couUrl'/></s:iterator>">下载</a>&nbsp;
			</div>
		</div>
		 <input id="vidId" type="hidden" value="<s:property value="model.vidId"/>" /> 
		  <input id="uid"  type="hidden"  value="${sessionScope.existUser.uid}" /> 
		  <input id="uName"  type="hidden"  value="${sessionScope.existUser.uName}" /> 
		  <input id="couId" type="hidden" value="<s:iterator var='videocount' value='model.videocounts'><s:property value='#videocount.couId' /></s:iterator>" />
		<hr />
		<div class="lianjie">
			<div id="container" style="float: left;">
				<table width="70%" border="0">
			
				<tr>
					<s:iterator var="rb" value="videolist" status="st" begin="1" end="2">
					 
					
						<td>
							<div class="wrapper">
								<div class="item">
									<a href="${ pageContext.request.contextPath }/videocount_findBycouid.action?couId=<s:property value="#rb.couId"/>"><img src="${ pageContext.request.contextPath }/<s:property value="#rb.videoinfo.vidImage"/>" 
										style="width: 100px; height: 100px" /> <span
										class="information"> <strong><s:property value="#rb.videoinfo.vidName"/> 
										</strong><s:property value="#rb.videoinfo.vidjianjie"/> </span></a>
								</div>
							</div>
						</td>
						
						</s:iterator>	
				
					</tr>
						<tr>
						
					<s:iterator var="rb" value="videolist" status="st" begin="5" end="6">
					 
					
						<td>
							<div class="wrapper">
								<div class="item">
									<a href="${ pageContext.request.contextPath }/videocount_findBycouid.action?couId=<s:property value="#rb.couId"/>"><img src="${ pageContext.request.contextPath }/<s:property value="#rb.videoinfo.vidImage"/>" 
										style="width: 100px; height: 100px" /> <span
										class="information"> <strong><s:property value="#rb.videoinfo.vidName"/> 
										</strong><s:property value="#rb.videoinfo.vidjianjie"/> </span></a>
								</div>
							</div>
						</td>
						
						</s:iterator>	
				
					</tr>

				</table>
			</div>
			<div
				style="float: right; width: 28%; margin-top: 5px; border: #97FF99 solid 1px">
				<table width="100%" border="0">
					<tr>
						<td colspan="2">

							<h2>
								<s:property value="model.vidName" />
							</h2>
						</td>
					</tr>
					<tr>
						<td width="50px">类型:</td>
						<td><s:property value="model.maxtype.maxName" /></td>
					</tr>
					<tr>
						<td>标签:</td>
						<td><s:property value="model.mintype.minName" />|<s:property
								value="model.area.areaName" /></td>
					</tr>
					<tr>
						<td>简介:</td>
						<td><s:property value="model.vidjianjie" /></td>
					</tr>
				</table>

			</div>
		</div>
		<%-- --%>
		<div class="comment">
			<script type="text/javascript"
				src="<%=basePath%>js/edit/xheditor-1.1.10-zh-cn.min.js">
				
			</script>
			<div style="float: left">
				<textarea rows="5" cols="125" class="xheditor" name="videocomment"
					id="commentarea"></textarea>
			</div>
			<div
				style="float: right; width: 80px; height: 32px; margin-bottom: 10px">
				<br /> <br /> <input type="button" value="评论" onclick="savedata()"
					style="text-align: right; font-size: 18px" /> &nbsp;
			</div>
		</div>

		<input type="button" value="展开评论" id="but" onclick="showcomment(1)"
			style="text-align: right; font-size: 18px" />
			
		<div id="commentdiv" class="commentinfo" style='text-align:center'></div>
		<center>
			<label id="lab"> </label>
		</center>
			
		</div>
	





		<div id="id2" style="z-index: 99;">
			<table width="100%" border="0">
				<tr align="center">
					<td colspan="2">用户直接请登录</td>
				</tr>
				<tr align="center">
					<td style="text-align: right">账号：</td>
					<td><input id="uMail" /></td>
				</tr>
				<tr align="center">
					<td style="text-align: right">密码：</td>
					<td><input type="password" id="uPassword" /></td>
				</tr>

				<tr align="center">
					<td colspan="2"><input type="button" onclick="check();"value="登录" /></td>
				</tr>

				<!-- <tr align="center">
					<td colspan="2">没有账号吗？</td>
				</tr>
				<tr align="center">
					<td colspan="2"><input type="button" value="立即注册账号！"onclick="zhuce()" /></td>
				</tr> -->
			</table>

			<br />
			<div align="center">
				<input name="Button1" type="button" value="返回" onclick="hide()" />
			</div>
		</div>
		<div id="id1"></div>
</body>
</html>
