<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="入账审核列表">
<@CommonQueryMacro.CommonQuery id="McHubamtCheckList" init="false" submitMode="selected">
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
				<@CommonQueryMacro.DataTable id ="datatable"  paginationbar="btApprove,-,btReject" fieldStr="select,traceno[200],action,status[140],vdate,merid[120],payerbank,payeracct,payername,payeeacct,payeename,amt,curcd,nar1[250]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	//详细信息
	function datatable_traceno_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
		var traceno = record.getValue("traceno");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+traceno+"')\">" + traceno + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function doDetail(id){
		locate(id);
		var record = McHubamtCheckList_dataset.find(["id"], [id]);
		showWin("${McHubamtList_btMod}","/fpages/hsbc/ftl/McHubamtDetail.ftl?traceno=" + id + "&op=detail","window","flushPage()",window);
	}
	//定位一条记录
	function locate(id){
	    var record = McHubamtCheckList_dataset.find(["id"], [id]);
	    if (record) {
	        McHubamtCheckList_dataset.setRecord(record);
	    }
	}
	
	function btApprove_onClickCheck() {
		var hasSelected = false;	
		var record =McHubamtCheckList_dataset.getFirstRecord();
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
	   	McHubamtCheckList_dataset.setParameter("op","CHECK");
	   	McHubamtCheckList_dataset.setParameter("approveStatusChoose","01");
	   	return true;
	}
	
	function btReject_onClickCheck() {
		var hasSelected = false;		
		var record =McHubamtCheckList_dataset.getFirstRecord();
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
	   	McHubamtCheckList_dataset.setParameter("op","CHECK");
	   	McHubamtCheckList_dataset.setParameter("approveStatusChoose","02");
	   	return true;
	}
	
	function btApprove_postSubmit(button){
	    alert("${Common_Message_Success}");
		McHubamtCheckList_dataset.flushData(McHubamtCheckList_dataset.pageIndex);
	}
	function btReject_postSubmit(button){
	    alert("${Common_Message_Success}");
		McHubamtCheckList_dataset.flushData(McHubamtCheckList_dataset.pageIndex);
	}
	//刷新数据
	function flushPage(){
		McHubamtCheckList_dataset.flushData(McHubamtCheckList_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>