<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			function showDetail(couId){
				
				window.location.href="adminvideocount_toshowDetail.action?couId="+couId;
				
			}
			
		/* 	function addvideocount(vidId){
				alert(vidId);
				
				window.location.href="adminvideocount_tosaveVideocount.action?vidId="+vidId;
			} */
			
		</script>

<script>
  $(function() {
    var vidName = $( "#couDuration" ),
    couCount = $( "#couCount" ),
    couUrl = $( "#couUrl" ),
      allFields = $( [] ).add( vidName ).add( couCount ).add( couUrl ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips.text( t ) .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 

 

 
    $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 300,
      width: 350,
      modal: true,
      buttons: {
        "创建一个视频": function() {
          var bValid = true;
          allFields.removeClass( "ui-state-error" );
         
         var vidId = document.getElementById("vidId").value;
  		var couCount = document.getElementById("couCount111").value;
  		var couUrl = document.getElementById("couUrl111").value;
      
    if(couCount==""){
    	alert("时长不能为空");
    	bValid=false;
    }
    if(couCount==""){
    	alert("必须选择文件");
    	bValid=false;
    }

     if ( bValid ) {
       
    	 /* alert(vidId);
    	 alert(couCount); */
    	
    	 document.addform1.submit();
       
       
         $( this ).dialog( "close" );
         }
 
        },
        Cancel: function() {
          $( this ).dialog( "close" );
        }
      },
      close: function() {
        allFields.val( "" ).removeClass( "ui-state-error" );
      }
    });
 
    $( "#create-user" )
      .button()
      .click(function() {
        $( "#dialog-form" ).dialog( "open" );
      });
  });
  </script>
</head>



<body>


	<div id="dialog-form" title="添加新视频">
		<p class="validateTips">所有的表单字段都是必填的。</p>

		<form name="addform1" method="post" enctype="multipart/form-data"
			action="adminvideocount_saveVideocount.action">
			<input id="vidId" type="hidden" name="vidId"
				value="<s:property value="model.vidId"/>" />
			<fieldset>

				<label for=couCount>影片序号</label> <input type="text" name="couCount"
					id="couCount111" value=""
					class="text ui-widget-content ui-corner-all"> <label
					for="couUrl">上传地址</label> <input type="file" name="couUrlfile"
					id="couUrl111" value=""
					class="text ui-widget-content ui-corner-all"> <label
					for="couDuration">视频时长</label> <input type="text"
					name="couDuration" id="couDuration111"
					class="text ui-widget-content ui-corner-all">

			</fieldset>
		</form>
	</div>




	<div>
		<form action="adminvideoinfo_updatevideoinfo.action" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="vidImage"
				value="<s:property value="model.vidImage"/>"> <input
				id="vidId" type="hidden" name="vidId"
				value="<s:property value="model.vidId"/>" />
			<table cellspacing="0" cellpadding="1" rules="all" bordercolor="gray"
				border="1" id="DataGrid1"
				style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
				<tr align="center" bgColor="#afd1f3">
					<td colspan="6"><h1><Strong>编辑视频：</Strong></h1></td>
				</tr>
				<tr>
					<td>--视频名称</td>
					<td><input type="text" name="vidName"
						value="<s:property value="model.vidName"/>" /></td>
					<td>--大类型</td>
					<td><select name="maxtype.maxId">

							<s:iterator var="maxtype" value="maxtypes" status="status">
								<option value="<s:property value="#maxtype.maxId"/>"
									<s:if test="#maxtype.maxId == model.maxtype.maxId">selected</s:if>><s:property
										value="#maxtype.maxName" /></option>
							</s:iterator>
					</select></td>
					<td>--小类型</td>
					<td><select name="mintype.minId">
							<s:iterator var="mintype" value="mintypes" status="status">
								<option value="<s:property value="#mintype.minId"/>"
									<s:if test="#mintype.minId == model.mintype.minId">selected</s:if>><s:property
										value="#mintype.minName" /></option>
							</s:iterator>
					</select></td>
				</tr>
				<tr>
					<td>--地区</td>
					<td><select name="area.areaId">
							<s:iterator var="ae" value="areas" status="status">
								<option value="<s:property value="#ae.areaId"/>"
									<s:if test="#ae.areaId == model.area.areaId">selected</s:if>><s:property
										value="#ae.areaName" /></option>
							</s:iterator>
					</select></td>
					<td>--导演</td>
					<td><input type="text" name="vidDirector"
						value="<s:property value="model.vidDirector"/>" /></td>
					<td>--明星</td>
					<td><input type="text" name="vidStar"
						value="<s:property value="model.vidStar"/>" /></td>
				</tr>
				<tr>

					<td>--年份</td>
					<td><input type="text" name="vidYear"
						value="<s:property value="model.vidYear"/>" /></td>
					<td>--影片简介</td>
					<td><input type="text" name="vidjianjie"
						value="<s:property value="model.vidjianjie"/>" /></td>
					<td>--影片内容简介</td>
					<td><input type="text" name="vidInfo"
						value="<s:property value="model.vidInfo"/>" /></td>
				</tr>
				<tr>
					<td>--封面图片</td>
					<td><input name="imageaddfiler" type="file" id="picture2">
					</td>
					<td>--状态</td>
					<td><input type="text" name="vidState"
						value="<s:property value="model.vidState"/>" /></td>

				</tr>

				<s:iterator var="vcs" value="model.videocounts" status="status">

					<input id="couId" type="hidden"
						value="<s:property value="#vcs.couId"/>" />

					<tr>

						<td>--影片序号</td>
						<td><input type="text" name="couCount" id="couCount"
							value="<s:property value="#vcs.couCount"/>" /></td>


						<td><input type="button" value="详情"
							id="but<s:property value="#vcs.couId"/>"
							onclick="showDetail(<s:property value="#vcs.couId"/>)" /></td>


					</tr>

				</s:iterator>
				<tr align="center">
					<td colspan="6"><input type="button" id="create-user"
						name="button2" value="添加视频集" /></td>
				</tr>
				<tr align="center">

					<td colspan="6"><input type="submit" name="Submit2" value="提交" id="create-user"></td>
				</tr>

			</table>

		</form>




	</div>
</body>
</html>