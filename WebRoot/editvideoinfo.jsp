<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员视频编辑</title>
<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<style>
body {
	font-size: 62.5%;
}

label,input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td,div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
<script type="text/javascript">
	function showDetail(couId) {

		window.location.href = "adminvideocount_toshowDetail.action?couId="
				+ couId;

	}

	/* 	function addvideocount(vidId){
			alert(vidId);
			
			window.location.href="adminvideocount_tosaveVideocount.action?vidId="+vidId;
		} */
</script>

<script>
	$(function() {
		var vidName = $("#couDuration"), couCount = $("#couCount"), couUrl = $("#couUrl"), allFields = $(
				[]).add(vidName).add(couCount).add(couUrl), tips = $(".validateTips");

		function updateTips(t) {
			tips.text(t).addClass("ui-state-highlight");
			setTimeout(function() {
				tips.removeClass("ui-state-highlight", 1500);
			}, 500);
		}

		$("#dialog-form")
				.dialog(
						{
							autoOpen : false,
							height : 300,
							width : 350,
							modal : true,
							buttons : {
								"创建一个视频" : function() {
									var bValid = true;
									allFields.removeClass("ui-state-error");

									var vidId = document
											.getElementById("vidId").value;
									var couCount = document
											.getElementById("couCount111").value;
									var couUrl = document
											.getElementById("couUrl111").value;

									if (couCount == "") {
										alert("时长不能为空");
										bValid = false;
									}
									if (couCount == "") {
										alert("必须选择文件");
										bValid = false;
									}

									if (bValid) {

										alert(vidId);
										alert(couCount);

										document.addform1.submit();

										$(this).dialog("close");
									}

								},
								Cancel : function() {
									$(this).dialog("close");
								}
							},
							close : function() {
								allFields.val("").removeClass("ui-state-error");
							}
						});

		$("#create-user").button().click(function() {
			$("#dialog-form").dialog("open");
		});
	});
</script>
</head>



<body>
	<div>
		<form name="addform1" method="post" enctype="multipart/form-data"
			action="userupload_editvideoinfosave.action">
			<table cellSpacing="1" cellPadding="0" width="100%" align="center"
				class="ta" bgColor="#f5fafe" border="0" cellSpacing="1"
				cellPadding="0" width="100%" align="center" class="ta"
				bgColor="#f5fafe" border="0">
				<tr align="center" bgColor="#afd1f3">
					<td colspan="4"><h1>编辑视频：</h1></td>
				</tr>
				<input id="vidId" type="hidden" name="uld"
					value="<s:property value="userupload.uld"/>" />
				<tr>
					<td>--视频名称</td>
					<td><input type="text" name="name"
						value="<s:property value="userupload.name"/>" /></td>

					<td>--视频类型</td>
					<td><input type="text" name="type"
						value="<s:property value="userupload.type"/>" /></td>

				</tr>

				<tr>

					<td>--年份</td>
					<td><input type="text" name="duration"
						value="<s:property value="userupload.duration"/>" /></td>
					<td>--影片简介</td>
					<td><input type="text" name="info"
						value="<s:property value="userupload.info"/>" /></td>

				</tr>
				<tr>

					<td>--状态</td>
					<s:if test="#userupload.status==1">
						<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">审核通过</td>
					</s:if>
					<s:elseif test="#userupload.status==2">
						<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">审核未通过</td>
					</s:elseif>
					<s:else>
						<td style="CURSOR: hand; HEIGHT: 22px" align="center" width="17%">待审核</td>
					</s:else>

				</tr>

				<tr align="center">


					<td colspan="4"><input type="submit" value="确定修改" /></td>

				</tr>


			</table>

		</form>




	</div>
</body>
</html>