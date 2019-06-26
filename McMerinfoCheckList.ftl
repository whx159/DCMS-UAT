<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.page title="商户审核列表">
<@CommonQueryMacro.CommonQuery id="McMerinfoCheckList" init="false" submitMode="selected">
	<table align="left"  width="100%">
		<tr>
			<td colspan="2">
			<#if v_country=="HK" || v_country == "MY">
					<@CommonQueryMacro.Interface id="interface" label="" fieldStr="qmerid,qcustid,qmertype,qmername,qsupmerid,qsettlaccount" colNm="4"/>
				<#else>
					<@CommonQueryMacro.Interface id="interface" label="" fieldStr="qmerid,qcustid,qmertype,qmername,qsupmerid" colNm="4"/>
				</#if>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable"  paginationbar="btApprove,-,btReject" fieldStr="select,merid[150],action,status[140],prostatus,custid,mername,mertype[120],supmerid[120],creid,cretimeShow[150],modid,modtimeShow[150]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">

function initCallGetter_post(){
	flushPage();
}

//详细信息
function datatable_merid_onRefresh(cell,value,record) {
	if (record) {//当存在记录时
		var id = record.getValue("id");
		var merid = record.getValue("merid");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + merid + "</a>"
	} else {
		cell.innerHTML="&nbsp;";
	}
}
function doDetail(id){
	locate(id);
	var record = McMerinfoCheckList_dataset.find(["id"], [id]);
	var action = record.getValue("action");
	if("02"==action){
		showWin("${McMerinfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McMerinfoCheckDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=2","window","flushPage()",window);
	}else{
		showWin("${McMerinfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McMerinfoDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=2","window","flushPage()",window);
	}
}
function btApprove_onClickCheck() {
	var hasSelected = false;	
	var record =McMerinfoCheckList_dataset.getFirstRecord();
	while(record){
		var v_selected = record.getValue("select");
		var sharedkey = record.getValue("sharedkey");
		var shared = sharedkey.replace(/\r\n/g,"");
		var shared = shared.replace(/\n/g,"");
		record.setValue("sharedkey",shared);			
		if( v_selected == true ){
			hasSelected=true;
		}
		record=record.getNextRecord();
	}
   	if (!hasSelected) {
   		alert("${PLEASE_SELECT_RECORD}");
   		return false;
   	}
   	McMerinfoCheckList_dataset.setParameter("op","CHECK");
   	McMerinfoCheckList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
	var hasSelected = false;		
	var record =McMerinfoCheckList_dataset.getFirstRecord();
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
   	McMerinfoCheckList_dataset.setParameter("op","CHECK");
   	McMerinfoCheckList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McMerinfoCheckList_dataset.flushData(McMerinfoCheckList_dataset.pageIndex);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McMerinfoCheckList_dataset.flushData(McMerinfoCheckList_dataset.pageIndex);
}	
//刷新数据
function flushPage(){
	McMerinfoCheckList_dataset.flushData(McMerinfoCheckList_dataset.pageIndex);
}
//定位一条记录
function locate(id){
    var record = McMerinfoCheckList_dataset.find(["id"], [id]);
    if (record) {
        McMerinfoCheckList_dataset.setRecord(record);
    }
}
</script>
</@CommonQueryMacro.page>