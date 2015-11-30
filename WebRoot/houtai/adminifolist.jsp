<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
</head>
<script type="text/javascript">
function adminUpdate() {
	window.location.href = "${pageContext.request.contextPath}/houtai/adminupdate.jsp";
}


</script>

<body>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/user/list.jsp"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			class="ta" bgColor="#f5fafe" border="0">
			<br>
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><h1><strong>管理员信息</strong></h1>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="update" name="update"
							class="button_add" onclick="adminUpdate()">
							修改</button>
					</td>
				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
										width="300px">ID：</td>
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
									width="300px">${adminLogin.id}</td>
								</tr>
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
										width="300px">姓名：</td>
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
									width="300px">${adminLogin.username}</td>
								</tr>
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
										width="300px">电话：</td>
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
									width="300px">${adminLogin.phone}</td>
								</tr>
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
										width="18%">邮箱：</td>
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
									width="300px">${adminLogin.email}</td>
								</tr>
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
										width="300px">状态：</td>
									<td style="CURSOR: hand; HEIGHT: 40px" align="center"
									width="300px">${adminLogin.state}</td>
								</tr>
						</table>
					</td>
				</tr>


			</tbody>
		</table>
	</form>



</body>

</html>