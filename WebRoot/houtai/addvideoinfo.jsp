<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>

	<div>
		<form action="adminvideoinfo_savevideoinfo.action" method="post"
			enctype="multipart/form-data">
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray"
				border="1" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
				<tr align="center">
					<td colspan="6" bgColor="#afd1f3"><h1>
							<strong>新增电影</strong>
						</h1></td>
				</tr>
				<tr>
					<td>影片名称</td>
					<td><input type="text" name="vidName" /></td>
					<td>大类型</td>
					<td><select name="maxId">

							<s:iterator var="maxtype" value="maxtypes" status="status">
								<option value="<s:property value="#maxtype.maxId"/>"><s:property
										value="#maxtype.maxName" /></option>
							</s:iterator>
					</select></td>
					<td>小类型</td>
					<td><select name="minId">
							<s:iterator var="mintype" value="mintypes" status="status">
								<option value="<s:property value="#mintype.minId"/>"><s:property
										value="#mintype.minName" /></option>
							</s:iterator>
					</select></td>
				</tr>
				<tr>
					<td>地区</td>
					<td><select name="areaId">
							<s:iterator var="ae" value="areas" status="status">
								<option value="<s:property value="#ae.areaId"/>"><s:property
										value="#ae.areaName" /></option>
							</s:iterator>
					</select></td>
					<td>导演</td>
					<td><input type="text" name="vidDirector" /></td>
					<td>明星</td>
					<td><input type="text" name="vidStar" /></td>
				</tr>
				<tr>

					<td>年份</td>
					<td><input type="text" name="vidYear" /></td>
					<td>影片简介</td>
					<td><input type="text" name="vidjianjie" /></td>
					<td>影片内容简介</td>
					<td><input type="text" name="vidInfo" /></td>
				</tr>
				<tr>
					<td>封面图片</td>
					<td><input name="imageaddfiler" type="file" id="picture2">
					</td>
					<td>状态</td>
					<td><input type="text" name="vidState" /></td>
					<td>影片集数</td>
					<td><input type="text" name="couCount" /></td>
				</tr>
				<tr>

					<td>网络地址</td>
					<td><input name="viaddrfile" type="file" id="picture1">
					</td>
					<td>时长</td>
					<td><input type="text" name="couDuration" /></td>
				</tr>
				<tr>
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