<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="第三方机构信息维护">
<@CommonQueryMacro.CommonQuery id="mcOrgInfoCheckList" init="true" submitMode="selected">
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove,-,btReject" fieldStr="select,id,action,status[120],orgname,orgnm,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%"   hasFrame="true" readonly="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
function flushPage(){
	mcOrgInfoCheckList_dataset.flushData(1);
}

function datatable_id_onRefresh(cell,value,record) {
	if (record) {
		var id = record.getValue("id");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + id + "</a>"
	} else {
		cell.innerHTML="&nbsp;";
	}
}
function doDetail(id){
	locate(id);
	var record = mcOrgInfoCheckList_dataset.find(["id"], [id]);
	var action = record.getValue("action");
	if("02"==action){
		showWin("${McOrgInfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McOrgInfoCheckDetail.ftl?qid=" + id + "&op=detail","window","flushPage()",window);
	}else{
		showWin("${McOrgInfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McOrgInfoDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=2","window","flushPage()",window);
	}
}
function btApprove_onClickCheck() {
	var hasSelected = false;	
	var record =mcOrgInfoCheckList_dataset.getFirstRecord();
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
   	mcOrgInfoCheckList_dataset.setParameter("op","CHECK");
   	mcOrgInfoCheckList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
	var hasSelected = false;		
	var record =mcOrgInfoCheckList_dataset.getFirstRecord();
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
   	mcOrgInfoCheckList_dataset.setParameter("op","CHECK");
   	mcOrgInfoCheckList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoCheckList_dataset.flushData(mcOrgInfoCheckList_dataset.pageIndex);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoCheckList_dataset.flushData(mcOrgInfoCheckList_dataset.pageIndex);
}
//定位一条记录
function locate(id){
    var record = mcOrgInfoCheckList_dataset.find(["id"], [id]);
    if (record) {
        mcOrgInfoCheckList_dataset.setRecord(record);
    }
}
</script>
</@CommonQueryMacro.page>