<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style2.css"
	rel="stylesheet" type="text/css" />
<title>会员新增电影</title> 
</head>
<body>

	<div>
		<form action="userupload_savevideoinfo.action" method="post"
			enctype="multipart/form-data">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray"
				border="0" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
				<tr align="center">
					<td colspan="4" bgColor="#afd1f3"><h1>
							<strong>会员新增电影</strong>
						</h1></td>
				</tr>
				<tr>
					<td>影片名称</td>
					<td><input type="text" name="name" /></td>

					<td>视频类型</td>
					<td><select name="type">
							<option value="动作片">动作</option>
							<option value="科幻片">科幻</option>
							<option value="爱情片">爱情</option>
							<option value="喜剧片">喜剧</option>
							<option value="恐怖片">恐怖</option>
							<option value="搞笑片">搞笑</option>
					</select></td>
				</tr>

				<tr>
					<td>封面图片</td>
					<td><input name="imageaddfile" type="file" id="picture2">
					</td>

					<td>时长</td>
					<td><input type="text" name="duration" /></td>
				</tr>
				<tr>

					<td>网络地址</td>
					<td colspan="3"><input name="uldaddrfile" type="file"
						id="picture1"></td>

				</tr>

				<tr>
					<td>影片简介</td>
					<td colspan="3"><textarea rows="3" cols="30" name="info"></textarea></td>

				</tr>

				<tr align="center">


					<td colspan="6"><input type="submit" name="Submit2" value="提交"
						width="80px"></td>
				</tr>
				<tr>
			</table>
		</form>




	</div>
</body>
</html>