<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.etc.myvideo.switchimage.entity.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="javaScript/RevealTrans.js"></script>
<style type="text/css">
.container {
	width: 740px;
	height: 300px;
	border: 1px solid #eee;
	position: relative;
}

#idPicText {
	background: #eee;
	line-height: 30px;
	opacity: .5;
	-moz-opacity: .5;
	text-align: center;
	font-weight: bold;
	width: 740px;
	font-size: 12px;
}

#idPicText a {
	text-decoration: none;
	color: #000000;
	display: block;
	margin-left: 20px;
}

#idPicList img {
	cursor: pointer;
	width: 65px;
	height: 50px;
	/*filter:alpha(opacity=50);*/
	-moz-opacity: .5;
	opacity: .5;
	margin-top: 0px;
	margin-left: 12px;
}

#idPicList img.on {
	-moz-opacity: 1;
	border: 2px solid #0000FF;
	opacity: 1;
}

#idNum {
	position: absolute;
	right: 0px;
	bottom: -16px;
}

#idNum li {
	float: left;
	list-style: none;
	color: #fff;
	text-align: center;
	line-height: 0px;
	width: 16px;
	height: 16px;
	font-family: Arial;
	font-size: 12px;
	cursor: pointer;
	margin: 1px;
	border: 1px solid #707070;
	background-color: #060a0b;
}

#idNum li.on {
	line-height: 0px;
	width: 18px;
	height: 18px;
	font-size: 14px;
	border: 0;
	background-color: #ce0609;
	font-weight: bold;
}

#h {
	height: 400px;
}
</style>

</head>
<body>

	<div id="idPicShow" class="container">
		<ul id="idNum">
			<div id="idPicText">
		</ul>


	</div>
	<div id="idPicList"></div>


	<script>
		var rvt = new RevealTrans("idPicShow");

		<c:forEach items="${SwitchImageitem}" var="item">
		rvt.Add("${item.sAddr}", "${item.sText}",
				" ${ pageContext.request.contextPath }/videoinfo_findByvidId.action?vidId=${item.couId}");
		</c:forEach>
		var oList = $("idPicList"), oText = $("idPicText"), arrImg = [];

		var oNum = $("idNum"), arrNum = [];

		Each(rvt.List, function(list, i) {
			
			var img = document.createElement("img");
			img.src = list["img"];
			img.alt = list["text"];
			arrImg[i] = img;
			oList.appendChild(img);

			var li = document.createElement("li");
			li.innerHTML = i + 1;
			arrNum[i] = li;
			//oNum.appendChild (li);

			img.onmouseover = li.onmouseover = function() {
				rvt.Auto = false;
				rvt.Index = i;
				rvt.Start();
			};
			img.onmouseout = li.onmouseout = function() {
				rvt.Auto = true;
				rvt.Start();
			};
		});

		rvt.onShow = function() {
			var i = this.Index, list = this.List[i];
				
			Each(arrImg, function(o) {
				o.className = "";
			});
			arrImg[i].className = "on";

			Each(arrNum, function(o) {
				o.className = "";
			});
			arrNum[i].className = "on";
			
			oText.innerHTML = !!list.url ? "<a href='" + list.url + "' target='_blank'>" + "</a>"
					: list.text;
		}

		oText.onmouseover = function() {
			rvt.Auto = false;
			rvt.Stop();
		};
		oText.onmouseout = function() {
			rvt.Auto = true;
			rvt.Start();
		};

		rvt.Start();
	</script>
	<br />


</body>
</html>