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
	//window.location.href = "${pageContext.request.contextPath}/admin_update.action";
	$("#adminupdate").submit();
}

$(function(){
	$("#aId").focus(function(){
			$("#lab1").html("ID不可修改");
	});
	
	$("#aName").blur(function(){
		if($("#aName").val() == ""){
			$("#lab2").html("姓名不能为空");
		}
	});
	
	$("#aPhone").blur(function(){
		if($("#aPhone").val() == ""){
			$("#lab3").html("电话不能为空");
		}
	});
	
	$("#aEmail").blur(function(){
		if($("#aEmail").val() == ""){
			$("#lab4").html("邮箱不能为空");
		}
	});
	
	$("#aState").blur(function(){
		if($("#aState").val() == ""){
			$("#lab4").html("邮箱不能为空");
		}
	});
});

</script>

<body>
	<form id="adminupdate" name="adminupdate"
		action="admin_update.action"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			class="ta" bgColor="#f5fafe" border="0">
			<br>
			<tbody>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><h1><strong>管理员信息修改</strong></h1>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<input type="submit"  onclick="adminUpdate()" value="保存">
					</td>
				</tr>
				<tr>
					<td class="ta_01"  bgColor="#f5fafe">
						<div style="height: 350px; margin-left:380px">
							<div style="height:40px; ">
								ID：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="aId" name="id" readonly="readonly" value="${adminLogin.id}">
								<label id="lib1"></label>
							</div style="height:40px; ">
							<div style="height:40px; ">
								姓名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="aName" name="username" value="${adminLogin.username}"><br>
								<label id="lib2"></label>
							</div>
							<div style="height:40px; ">
								电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="aPhone" name="phone" value="${adminLogin.phone}"><br>
								<label id="lib3"></label>
							</div style="height:40px ">
							<div style="height:40px; ">
								邮箱：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="aEmail" name="email" value="${adminLogin.email}"><br>
								<label id="lib4"></label>
							</div>
							<div style="height:40px; ">
								状态：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="aState" name="state" value="${adminLogin.state}"><br>
								<label id="lib5"></label>
							</div>
						</div>
					</td>
				</tr>

			</tbody>
		</table>
	</form>



</body>

</html>