<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/houtai/css/style.css">
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
function showDetail(uid){
	window.location.href = "${pageContext.request.contextPath}/adminUser_userDetail.action?uid="+uid+"";
	//window.location.href = "${pageContext.request.contextPath}/adminUser_userDetail?id="+id+".action";
}
	
</script>
</head>

<body>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			class="ta" bgColor="#f5fafe" border="0">
			<br>
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><h1><strong>用户列表</strong></h1>
				</tr>
				<!-- <tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addvideoinfo()">
							&#28155;&#21152;</button>
					</td>
				</tr> -->


				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr scrolling="auto"
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
								<td align="center" width="10%">序号</td>
								<td align="center" width="10%">用户编号</td>
								<td align="center" width="10%">用户名称</td>
								<td align="center" width="10%">昵称</td>
								<td align="center" width="10%">性别</td>
								<td align="center" width="10%">出生年月</td>
								<td align="center" width="10%">邮箱</td>
								<td align="center" width="10%">等级</td>
								<td align="center" width="10%">积分</td>
								<td align="center" width="10%">状态</td>
								<td align="center" width="7%">编辑</td>
								<td align="center" width="7%">删除</td>
								<td align="center" width="10%">视频详情</td>
							</tr>

							<c:forEach var="u" items="${pageBean.list}">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%"></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uid}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uName}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uNickName}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uSex}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uBirthday}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uMail}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uLive}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.uAccumulate}</td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%">${u.state}</td>

									<td align="center" style="HEIGHT: 22px"><a
										href="${ pageContext.request.contextPath }/adminvideoinfo_editvideoinfo.action?vidId=${u.uid}&page=${pageBean.page}">
											<img src="${pageContext.request.contextPath}/img/i_edit.gif"
											border="0" style="CURSOR: hand">
									</a>
									
										<!-- <div class="switch">
									      <input type="radio" class="switch-input" name="view" value="week" id="week" checked>
									      <label for="week" class="switch-label switch-label-off">Week</label>
									      <input type="radio" class="switch-input" name="view" value="month" id="month">
									      <label for="month" class="switch-label switch-label-on">Month</label>
									      <span class="switch-selection"></span>
									    </div> -->
									
									</td>

									<td align="center" style="HEIGHT: 22px">
									<a
										href="${ pageContext.request.contextPath }/adminUser_deleteUser.action?Uid=${u.uid}">
											<img src="${pageContext.request.contextPath}/img/i_del.gif"
											width="16" height="16" border="0" style="CURSOR: hand">
									</a></td>

									<td align="center" style="HEIGHT: 22px"><input
										type="button" value="详情" id="but${u.uid}"
										onclick="showDetail(${u.uid})" />
										<div id="div${u.uid}"></div></td>
								</tr>
							</c:forEach>
						</table>
					</td>
				</tr>

				<tr align="center">
					<td colspan="7">第${pageBean.page}/${pageBean.totalPage}页 
						<c:if test="pageBean.page != 1">
							<a href="${ pageContext.request.contextPath }/adminUser_findAllUser.action?page=1">首页</a>|
							<a href="${ pageContext.request.contextPath }/adminUser_findAllUser.action?page=${pageBean.page-1}">上一页</a>|
						</c:if> <c:if test="pageBean.page != pageBean.totalPage">
							<a href="${ pageContext.request.contextPath }/adminUser_findAllUser.action?page=${pageBean.page+1}">下一页</a>|
							<a href="${ pageContext.request.contextPath }/adminUser_findAllUser.action?page=${pageBean.totalPage}">尾页</a>|
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</form>



</body>

</html>