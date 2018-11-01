<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="证书列表">
<@CommonQueryMacro.CommonQuery id="McPubkeyCheckList" init="true" submitMode="selected">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
	<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}" colNm="6"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove,-,btReject" fieldStr="select,clientid[150],action,status[120],uptlr[200],headerinfo,uptime[200],expirytime[200],creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]" width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<div style="display:none">
	<@CommonQueryMacro.CommonQuery id="McPubkeyList" init="true">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="select,clientid[150],action,status[120],uptlr[200],uptime[200],expirytime[200],creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]" width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</@CommonQueryMacro.CommonQuery>
</div>
<script language="javascript">
	var country = "${v_brno}";
	var tlrno = "${v_tlrno}";
	//刷新数据
function initCallGetter_post(){
	McPubkeyCheckList_dataset.flushData(1);
	McPubkeyList_dataset.flushData(1);
}
function flushPage(){
	McPubkeyCheckList_dataset.flushData(1);
	McPubkeyList_dataset.flushData(1);
}
function datatable_clientid_onRefresh(cell,value,record) {
	if (record) {
		var id = record.getValue("clientid");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + id + "</a>"
	} else {
		cell.innerHTML="&nbsp;";
	}
}
//获取拼接字符串的url
function getUrl(id){
	locate(id);
	var vid = McPubkeyCheckList_dataset.getValue("uptlr");
	var effectime = McPubkeyCheckList_dataset.getValue("uptime");
	var date = new Date(effectime);
	var time = date.getTime();
	var posname = McPubkeyCheckList_dataset.getValue("posname");
	var cername = McPubkeyCheckList_dataset.getValue("cername");
	var headerinfo = McPubkeyCheckList_dataset.getValue("headerinfo");
	headerinfo = encodeURIComponent(encodeURIComponent(headerinfo));
	return "&version="+vid+"&time="+time+"&posname="+posname+"&cername="+cername+"&headerinfo="+headerinfo;
}
function getPubkeyDetailUrl(id){
	locate(id);
	var bvid = McPubkeyCheckList_dataset.getValue("uptlr");
	dwr.engine.setAsync(false);
	return CheckAction.getPubkeyBeforeApprovalDetail(id,bvid,function(data){
		if(data != ""){
			return data;
		}
	});
}
function doDetail(id){
	locate(id);
	var url = getUrl(id);
	var record = McPubkeyCheckList_dataset.find(["clientid"], [id]);
	var action = record.getValue("action");
	if("02"==action){
		var burl = getPubkeyDetailUrl(id);
		url = url+burl;
		if(country == "HKHBAP"){
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateCheck2Detail.jsp?clientid="+id+url+"&approveflag=2","800","260");
		}else{
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateCheck2Detail.jsp?clientid="+id+url+"&approveflag=2","800","220");
		}
	}else{
		if(country == "HKHBAP"){
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateDetail.jsp?clientid="+id+url+"&approveflag=2","800","260");
		}else{
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateDetail.jsp?clientid="+id+url+"&approveflag=2","800","220");
		}
	}
}
function btApprove_onClickCheck() {
	var hasSelected = false;	
	var record =McPubkeyCheckList_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("select");			
		if( v_selected == true ){
			hasSelected=true;
		}
		record=record.getNextRecord();
	}
   	if (!hasSelected) {
   		alert("${PLEASE_SELECT_RECORD}");
   		return false;
   	}
   	McPubkeyCheckList_dataset.setParameter("op","CHECK");
   	McPubkeyCheckList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btApprove_onClick2(clientid,version) {
	var record =McPubkeyCheckList_dataset.getFirstRecord();
	while(record){
		if(record.getValue("clientid") == clientid && record.getValue("uptlr") == version){
			McPubkeyCheckList_dataset.setValue("select",true);
			break;
		}
		record=record.getNextRecord();
	}
	btApprove.click();
	closeSubWin("pageWinId");
	
}
function reject_onClick(clientid,version) {
	var record =McPubkeyCheckList_dataset.getFirstRecord();
	while(record){
		if(record.getValue("clientid") == clientid && record.getValue("uptlr") == version){
			McPubkeyCheckList_dataset.setValue("select",true);
			break;
		}
		record=record.getNextRecord();
	}
	btReject.click();
	closeSubWin("pageWinId");
}
function btClick(callback){
	btReject.click();
	callback();
}
function callback(){
	closeSubWin("pageWinId");
}
function btReject_onClickCheck() {
	var hasSelected = false;		
	var record =McPubkeyCheckList_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("select");			
		if( v_selected == true ){
			hasSelected=true;
		}
		record=record.getNextRecord();
	}
   	if (!hasSelected) {
   		alert("${Common_Message_Approve_alert_1}");
   		return false;
   	}
   	McPubkeyCheckList_dataset.setParameter("op","CHECK");
   	McPubkeyCheckList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McPubkeyCheckList_dataset.flushData(McPubkeyCheckList_dataset.pageIndex);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McPubkeyCheckList_dataset.flushData(McPubkeyCheckList_dataset.pageIndex);
}
//定位一条记录
function locate(id){
    var record = McPubkeyCheckList_dataset.find(["clientid"], [id]);
    var record2 = McPubkeyList_dataset.find(["clientid"], [id]);
    if (record) {
        McPubkeyCheckList_dataset.setRecord(record);
    }
     if (record2) {
        McPubkeyList_dataset.setRecord(record);
    }
}
function blocate(id){
        McPubkeyCheckList_dataset.setRecord(record);
    if (record) {
        McPubkeyList_dataset.setRecord(record);
    }
}
</script>
</@CommonQueryMacro.page>