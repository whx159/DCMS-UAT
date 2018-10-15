<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html >
<%@page import="com.huateng.ebank.business.common.MessageResourceUtil"%>
<%@page import="com.huateng.ebank.business.common.GlobalInfo"%>
<%@page language="java" import="java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/blue/easyui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/templets/ui/themes/icon.css">
<script type='text/javascript'
	src='<%=request.getContextPath()%>/templets/ui/js/jquery.js'></script>
<script type="text/javascript" src="../js/date.js"></script>
<script type="text/javascript" src="../js/timer.js"></script>
<script type="text/javascript" src="../js/public.js"></script>
<script type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'> </script>
<script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/CheckAction.js'> </script>
<title>证书导入</title>
</head>
<style>
body {
	font: normal 11px auto "Trebuchet MS", Verdana, Arial, Helvetica,
		sans-serif;
	color: #4f6b72;
}

#mytable {
	width: 100%;
	padding: 0;
	margin: 0;
	border-collapse:collapse;
	border:0px solid blue;
}

td {
	padding: 10px;
	margin: 0;
/* 	height: 20px; */
	border: 0px solid #ccc;
 	table-layout:fixed;
}

tr {
	padding: 0;
	margin: 0;
}

.mytxt {
    color:#333;
    line-height:normal;
    font-family:"Microsoft YaHei",Tahoma,Verdana,SimSun;
    font-style:normal;
    font-variant:normal;
    font-size-adjust:none;
    font-stretch:normal;
    font-weight:normal;
    margin-top:0px;
    margin-bottom:0px;
    margin-left:0px;
   /*  padding-top:4px;
    padding-right:4px;
    padding-bottom:4px;
    padding-left:4px; */
    font-size:12px;
    outline-width:medium;
    outline-style:none;
    outline-color:invert;
    border-top-left-radius:3px;
    border-top-right-radius:3px;
    border-bottom-left-radius:3px;
    border-bottom-right-radius:3px;
    text-shadow:0px 1px 2px #fff;
    background-attachment:scroll;
    background-repeat:no-repeat;
    background-position-x:right;
    background-position-y:top;
    background-size:auto;
    background-origin:padding-box;
    background-clip:border-box;
    background-color:rgb(255,255,255);
    margin-right:0px;
    border-top-color:#ccc;
    border-right-color:#ccc;
    border-bottom-color:#ccc;
    border-left-color:#ccc;
    border-top-width:1px;
    border-right-width:1px;
    border-bottom-width:1px;
    border-left-width:1px;
    border-top-style:solid;
    border-right-style:solid;
    border-bottom-style:solid;
    border-left-style:solid;
}

.mytxt:focus {
     border: 1px solid #fafafa;
    -webkit-box-shadow: 0px 0px 6px #007eff;
     -moz-box-shadow: 0px 0px 5px #007eff;
     box-shadow: 0px 0px 5px #007eff;   
    
}

#mybutton{ 
    border:1px solid #ccc; 
    background:#18b3cf; 
    color:#000; 
    padding:1px 14px;
    height:25px;
    position:relative;
}

</style>
<script language="javascript">
		$(function(){
			if($("input[id='posName']").val() != ""){
				$("#posSelect").attr("checked",'true');
				$("input[id='posName']").removeAttr("disabled");
				$("input[id='posName']").css('background-color','#FFFFFF');
				//$("input[id='posName']").removeAttr("unselectable");
			}else{
				$("input[id='posName']").css('background-color','#EBEBE4');
			}
			$("input[name=clientid]").attr("readonly","readonly");
			$("input[name=clientid]").attr("unselectable","on");
			$("input[name=uptlr]").attr("readonly","readonly");
			$("input[name=uptlr]").attr("unselectable","on");
			$("input[name=clientid]").css('background-color','#EBEBE4');
			$("input[name=uptlr]").css('background-color','#EBEBE4');
			$("#modUpcer").hide();
		});

		function check(){	
			var countryID = "<%=GlobalInfo.getCurrentInstance().getBrno() %>";
			if(countryID == "HKHBAP" || countryID.substr(0,2) == "SG"){
				$("#pos").show();
			}else{
				$("#pos").hide();
			}
		}
		
		function setPosName(){
			if($("#posSelect").is(':checked')){
				$("#posName").removeAttr("disabled");
				$("input[id=posName]").css('background-color','#FFFFFF');
				$("input[id='posName']").removeAttr("unselectable");
				$("#star").css("display","");
			}else {
				$("#posName").attr("disabled","disabled");
				$("input[id=posName]").css('background-color','#EBEBE4');
				$("#posName").val("");
				$("#star").css("display","none");
			}
		}
		
		function isUpcer(){
			if($("#upcer").is(':checked')){
				$("#modUpcer").show();
			}else{
				$("#modUpcer").hide();
			}
		}
		
		function selectDate(){
			$("#datetimepicker").datetimepicker();
		}
		
		function uploadFile1() {
			var flag = true;
			var form = document.forms[0];
			if (form.clientid.value == "") {
				alert("<%=MessageResourceUtil.getMessage("UploadCertificate.CLIENTID.NULL")%>");
				return false;
			}
			if(form.uptlr.value == "") {
				alert("<%=MessageResourceUtil.getMessage("UploadCertificate.Version.NULL")%>");
				return false;
			}
			
			if(form.uptlr.value.length != 4){
				alert(" Version must be 4 digits!");
				return false;
			}
			
			if(form.uptime1.value == "") {
				alert("<%=MessageResourceUtil.getMessage("UploadCertificate.EffectiveDate.NULL")%>");
				return false;
			}
			var pname = $("#posName").val();
			if(pname == "" && $("#posSelect").is(':checked')){
				alert("posName cannot be empty!");
				return false;
			}
			if(form.uptime2.value == "") {
				alert("<%=MessageResourceUtil.getMessage("EffectiveTime cannot be empty!")%>");
				return false;
			}
			<%-- if (form.uploadFile.value == "") {
				alert("<%=MessageResourceUtil.getMessage("UploadCertificate.UploadFile.NULL")%>");
				return false;
			}

			var regex = /\.cer$/gi;
			if (!regex.test(document.getElementById("uploadFile").value)) {
				alert("<%=MessageResourceUtil.getMessage("UploadCertificate.FileFormat.NULL")%>");
				return false;
			} --%>
			
			if (confirm('<%=MessageResourceUtil.getMessage("UploadCertificate.Import.MODIFY")%>')) {
//				document.getElementById("inputform1").submit();
				document.inputform1.submit();
				document.getElementById("fileUpLoad").disabled = "disabled";
				document.getElementById("downLoad").disabled = "disabled";
				document.getElementById("upload1").disabled = "disabled";
				document.getElementById("back").disabled = "disabled";
				document.getElementById("msg").style.display = "";
				return true;
			} else {
				return false;
			}
		}
function closeWindow(){
	window.parent.closeSubWin("pageWinId");
}
function doChange(file){
    var upload_file = $.trim($("#uploadFile").val());    //获取上传文件
    $('#photoCover').val(upload_file);     //赋值给自定义input框
}
window.onbeforeunload = function(){
	window.parent.flushPage();
}

</script>

<body id="body" onload="check()" >
	<%
		String fileflag = "cer";
		String cmd = "MOD";
		String clientid = request.getParameter("clientid");
		String version = request.getParameter("version");
		String cername = request.getParameter("cername");
		String posname = request.getParameter("posname");
		String headerinfo = request.getParameter("headerinfo");
		String time = request.getParameter("time");
		//对传过来的毫秒时间进行格式化
		Date date = new Date(Long.valueOf(time));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String formatTime = sdf.format(date);
        String edate = formatTime.substring(0,10);
        String etime = formatTime.substring(11, 19);
	%>
	<form
		action="<%=request.getContextPath()%>/batchImport/upload.spring"
		enctype="multipart/form-data" name="inputform1" id="inputform1"
		method="post" accept-charset="UTF-8">
		<input type="hidden" name="fileflag" id="fileflag"
			value="<%=fileflag%>">
		<input type="hidden" name="cmd" id="cmd"
			value="<%=cmd%>">
		<table id="mytable" class="grouptable" width="100%" cellspacing="0">
			<tr>
				<td class="labeltd" align="right">API Client ID:</td>
				<td align="left" class="datatd">
					<input type="text" value="<%=clientid %>" name="clientid" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" class="mytxt" />
				</td>
				<td align="right" class="labeltd"><%=MessageResourceUtil.getMessage("UploadCertificate.VERSION")%></td>
				<td align="left" class="datatd">
					<input type="text" name="uptlr" value="<%=version %>" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" class="mytxt" />
				</td>
				<td align="right" nowrap class="labeltd"  width="3%"></td>
			</tr>
			<tr>
				<td align="right" class="labeltd"><%=MessageResourceUtil.getMessage("UploadCertificate.EffectiveDate")%></td>
				<td align="left" class="datatd">
					<input name="uptime1" class="mytxt Wdate" value="<%=edate %>" type="text" onClick="WdatePicker({lang:'en'})" readonly="readonly" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" /><span style="color:red;">*</span>
				</td>
				<td align="right" class="labeltd"><%=MessageResourceUtil.getMessage("UploadCertificate.EffectiveTime")%></td>
				<td align="left" class="datatd">
					<input name="uptime2" type="text" value="<%=etime %>" class="mytxt" onClick="WdatePicker({dateFmt: 'HH:mm:ss',lang:'en'})" readonly="readonly" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" /><span style="color:red;">*</span>
				</td>
				<td align="right" nowrap class="labeltd" width="3%"></td>
			</tr>
			<tr>
				<td class="labeltd" align="right">Header Info:</td>
				<td align="left" class="datatd" colspan="3">
					<input type="text" required="true" name="headerInfo" value="<%=headerinfo %>" maxlength="2048" style="width: 100%;border: 1px solid #E5E5E5; height: 17px" class="mytxt" />
				</td>
			</tr>
			<tr id="pos">
				<td align="right" class="labeltd">
					<input type="checkbox"  onclick="setPosName()" id="posSelect" name="posSelect" />
				</td>
				<td align="left" class="labeltd">POS</td>
				<td align="right" class="labeltd">POS Vendor Name:</td>
				<td align="left" class="datatd"><input type="text" id="posName" value="<%=posname %>" class="mytxt" disabled="disabled" name="posName" style="width: 100%;border: 1px solid #E5E5E5; height: 17px;background:#EBEBE4"  /><span id="star" style="color:red;">*</span></td>
				<td align="right" nowrap class="labeltd" width="3%"></td>
			</tr>
			
			<tr>
				<td align="right" class="labeltd">
					<input type="checkbox"  onclick="isUpcer()" id="upcer" name="upcer" />
				</td>
				<td align="left" class="labeltd">Update Certificate?</td>
				<td align="right" class="labeltd"></td>
				<td align="left" class="labeltd"></td>
				<td align="right" nowrap class="labeltd" width="3%"></td>
			</tr>
			
			<tr id="modUpcer">
				<td id="uploadFile.title" align="right" class="labeltd"><%=MessageResourceUtil.getMessage("UploadCertificate.UploadFile")%></td>
				<td colspan='3' id="fileUpLoad">
					<%-- <input type="file" class="" name="uploadFile" id="uploadFile" size="50" value="<%=MessageResourceUtil.getMessage("UploadCertificate.Browse")%>" />&nbsp;&nbsp;&nbsp; --%>
					<input type="file" name="uploadFile" id="uploadFile" onchange="doChange(this)" style="display:none;"/>
					<input id="photoCover" value="<%=cername %>" type="text" class="mytxt" style="height:17px;width:400px;margin-left:-8px;border:1px solid #E5E5E5 "><span id="filestar" style="color:red;">*</span>
					<%-- <input type="button" onclick="$('input[id=uploadFile]').click();" id="mybutton" value="<%=MessageResourceUtil.getMessage("UploadCertificate.Browse")%>"/> --%>
					<a extra="button" type="button" id="btSave" resultdataset="" plain="false" href="javascript:void(0)" iconcls="" onclick="$('input[id=uploadFile]').click();" submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text "><%=MessageResourceUtil.getMessage("UploadCertificate.Browse")%></span></span></a>
					<font color="red"><%=MessageResourceUtil.getMessage("UploadCertificate.FileFormat")%></font>
				</td>
				<td align="right" nowrap class="labeltd" width="3%"></td>
			</tr>
			<tr>
				<td colspan="4" align="center" class="labeltd">
					<a extra="button" type="button" id="upload1" name="upload1" resultdataset="" plain="false" href="javascript:void(0)" iconcls="" onClick="return uploadFile1();" submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text "><%=MessageResourceUtil.getMessage("UploadCertificate.Save")%></span></span></a>
					<%-- <input value="<%=MessageResourceUtil.getMessage("UploadCertificate.Import")%>" class="l-btn" type="button" onClick="return uploadFile1();" name="upload1" id="upload1"> --%> 
					&nbsp;&nbsp;&nbsp;
					<a extra="button" type="button" id="btSave" resultdataset="" plain="false" href="javascript:void(0)"  onclick="closeWindow()" iconcls="" onClick="return uploadFile1();" submitmanager="_submitmanager_default" autoform="dtResult" class="l-btn" noextra="true"><span class="l-btn-left"><span class="l-btn-text "><%=MessageResourceUtil.getMessage("UploadCertificate.Return")%></span></span></a>
				 	<%-- <input id="returnBt" value="<%=MessageResourceUtil.getMessage("UploadCertificate.Return")%>" onclick="closeWindow()" type="button" id="back">&nbsp; --%> 	
					<font id="msg" style="display: none" color="blue"><%=MessageResourceUtil.getMessage("UploadCertificate.Importing")%></font>
				</td>
				<td align="right" nowrap class="labeltd" width="3%"></td>
			</tr>
		</table>
	</form>
</body>
</html>