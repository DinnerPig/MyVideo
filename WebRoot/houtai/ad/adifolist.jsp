<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/Style1.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/public.js"></script>
<script type="text/javascript">
function addadinfo(){
	window.location.href = "${pageContext.request.contextPath}/ad_toaddview.action";
}
		
		</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action=""
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center" class="ta"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>广告列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
						<button type="button" id="add" name="add" value="添加"
							class="button_add" onclick="addadinfo()">
							&#28155;&#21152;</button>

					</td>
				</tr>

				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">
						<table cellspacing="0" cellpadding="1" rules="all"
							bordercolor="gray" border="1" id="DataGrid1"
							style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
							<tr scrolling="auto"
								style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">

								<td align="center" width="10%">序号</td>
								<td align="center" width="10%">广告id</td>
								<td align="center" width="10%">图片地址</td>
								<td align="center" width="10%">网络地址</td>
								<td width="7%" align="center">
										编辑
								</td>
								<td width="7%" align="center">
										删除
								</td>
								
								
								
							</tr>
							<s:iterator var="v" value="AdpageBean.list" status="status">
								<tr onmouseover="this.style.backgroundColor = 'white'"
									onmouseout="this.style.backgroundColor = '#F5FAFE';">
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="18%"><s:property value="#status.count" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><s:property value="#v.id" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><s:property value="#v.adimage" /></td>
									<td style="CURSOR: hand; HEIGHT: 22px" align="center"
										width="17%"><s:property value="#v.adzhi" /></td>

										
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/ad_editadinfo.action?id=<s:property value="#v.id"/>">
													<img src="${pageContext.request.contextPath}/img/i_edit.gif" border="0" style="CURSOR: hand">
												</a>
											</td>
									
											<td align="center" style="HEIGHT: 22px">
												<a href="${ pageContext.request.contextPath }/ad_deleteAd.action?id=<s:property value="#v.id"/>">
													<img src="${pageContext.request.contextPath}/img/i_del.gif" width="16" height="16" border="0" style="CURSOR: hand">
												</a>
											</td>
									

								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
				<tr align="center">
					<td colspan="7">第<s:property value="AdpageBean.page" />/<s:property
							value="AdpageBean.totalPage" />页 
							<s:if test="AdpageBean.page != 1">
							<a
								href="${ pageContext.request.contextPath }/ad_findallAd.action?page=1">首页</a>|
								<a
								href="${ pageContext.request.contextPath }/ad_findallAd.action?page=<s:property value="AdpageBean.page-1"/>">上一页</a>|
							</s:if> <s:if test="AdpageBean.page != AdpageBean.totalPage">
							<a
								href="${ pageContext.request.contextPath }/ad_findallAd.action?page=<s:property value="AdpageBean.page+1"/>">下一页</a>|
								<a
								href="${ pageContext.request.contextPath }/ad_findallAd.action?page=<s:property value="AdpageBean.totalPage"/>">尾页</a>|
							</s:if>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

