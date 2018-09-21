<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("QUERY")>
<@CommonQueryMacro.page title="">
<@CommonQueryMacro.CommonQuery id="McFeerateCheckList" init="true" submitMode="selected">
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label=""/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove,-,btReject"  fieldStr="select,id,action,status[140],feetype[120],orgid,paytype,feemode,feerate,feemix,feemax,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
//刷新数据
function initCallGetter_post(){
	McFeerateCheckList_dataset.flushData(1);
}
function flushPage(){
	McFeerateCheckList_dataset.flushData(1);
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
	var record = McFeerateCheckList_dataset.find(["id"], [id]);
	var action = record.getValue("action");
	if("02"==action){
		showWin("${McFeeRateDetail_Group_group1_label}","/fpages/hsbc/ftl/McFeerateCheckDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=2","window","flushPage()",window);
	}else{
		showWin("${McFeeRateDetail_Group_group1_label}","/fpages/hsbc/ftl/McFeerateDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=2","window","flushPage()",window);
	}
}
function btApprove_onClickCheck() {
	var hasSelected = false;	
	var record =McFeerateCheckList_dataset.getFirstRecord();
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
   	McFeerateCheckList_dataset.setParameter("op","CHECK");
   	McFeerateCheckList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
	var hasSelected = false;		
	var record =McFeerateCheckList_dataset.getFirstRecord();
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
   	McFeerateCheckList_dataset.setParameter("op","CHECK");
   	McFeerateCheckList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateCheckList_dataset.flushData(McFeerateCheckList_dataset.pageIndex);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateCheckList_dataset.flushData(McFeerateCheckList_dataset.pageIndex);
}
//定位一条记录
function locate(id){
    var record = McFeerateCheckList_dataset.find(["id"], [id]);
    if (record) {
        McFeerateCheckList_dataset.setRecord(record);
    }
}
</script>
</@CommonQueryMacro.page>