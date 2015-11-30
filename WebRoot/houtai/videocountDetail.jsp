<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>分页</title>
<style type="text/css">
<!--
.STYLE1 {
	color: #FFFFFF
}

.STYLE2 {
	color: #333333
}

.STYLE2 a {
	font-size: 12px;
	display: block;
	padding: 4px 3px 5px 3px;
	color: black;
	margin: 0px;
}

.STYLE2 a:link,.STYLE2 a:visited {
	color: black;
	text-decoration: none;
}

.STYLE2 a:hover {
	color: red;
	text-decoration: underline;
	/* 替换背景图片 */
}
-->
</style>


<script type="text/javascript">
function delet(couId){
	alert(couId);
	
	window.location.href="adminvideocount_deletVideocount.action?couId="+couId;
} 
</script>
</head>
<body>
	<form id="pageForm" method="post"
		action="adminvideocount_updateVideocount.action"
		enctype="multipart/form-data">
		<input type="hidden" name="couUrl"
			value="<s:property value="model.couUrl"/>" /> <input id="vidId"
			type="hidden" name="vidId"
			value="<s:property value="model.videoinfo.vidId"/>" />
		<table id="tab" width="982" border="0" cellspacing="0">
			<tr>
				<td width="62" height="26" bgcolor="#6699FF"><div
						align="center" class="STYLE1">
						<div align="center">编号</div>
					</div></td>
				<td width="149" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">影片名称</div>
					</div></td>
				<td width="149" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">视频序号</div>
					</div></td>
				<td width="149" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">点击率</div>
					</div></td>
				<td width="249" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">网络地址</div>
					</div></td>
				<td width="149" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">时长</div>
					</div></td>
				<td width="131" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">上传时间</div>
					</div></td>

				<td width="131" bgcolor="#6699FF"><div align="center"
						class="STYLE1">
						<div align="center">操作</div>
					</div></td>

			</tr>

			<tr>
				<td width="62" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="couId"
								value="<s:property value="model.couId"/>" />
						</div>

					</div></td>
				<td width="149" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="vidName"
								value="<s:property value="model.videoinfo.vidName"/>" />
						</div>
					</div></td>

				<td width="149" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="couCount"
								value="<s:property value="model.couCount"/>" />
						</div>
					</div></td>

				<td width="149" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="couClick"
								value="<s:property value="model.couClick"/>" />
						</div>
					</div></td>

				<td width="149" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input name="couUrlfile" type="file" id="picture1"
								value="<s:property value="#vcs.couUrl"/>" />
							<s:property value="model.couUrl" />
						</div>
					</div></td>

				<td width="149" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="couDuration"
								value="<s:property value="model.couDuration"/>" />
						</div>
					</div></td>
				<td width="131" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<div align="center">
							<input type="text" name="couUpload"
								value="<s:property value="model.couUpload"/>" />
						</div>
					</div></td>
				<td width="131" bgcolor="#FFFF99"><div align="center"
						class="STYLE2">
						<input type="submit" name="Submit2" value="提交" /> <input
							type="button" name="btn" value="删除"
							onclick="delet(<s:property value="model.couId"/>)" />
					</div></td>

			</tr>

		</table>




	</form>
</body>
</html>