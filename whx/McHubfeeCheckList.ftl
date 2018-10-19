<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="计费信息复核列表">
<@CommonQueryMacro.CommonQuery id="McHubfeeCheckList" init="false" submitMode="selected">
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
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove,-,btReject" fieldStr="select,tranno[140],mername,merid,merfeeacct,trandate,acctcur,feeamtshow,feetype,status,remarks"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	//详细信息
	function datatable_tranno_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
		var tranno = record.getValue("tranno");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+tranno+"')\">" + tranno + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function doDetail(id){
		locate(id);
		var record = McHubfeeCheckList_dataset.find(["id"], [id]);
		showWin("${McHubamtList_btMod}","/fpages/hsbc/ftl/McHubfeeDetail.ftl?tranno=" + id + "&op=detail","window","flushPage()",window);
	}
	//定位一条记录
	function locate(tranno){
	    var record = McHubfeeCheckList_dataset.find(["tranno"], [tranno]);
	    if (record) {
	        McHubfeeCheckList_dataset.setRecord(record);
	    }
	}
	function btApprove_onClickCheck() {
		var hasSelected = false;	
		var record =McHubfeeCheckList_dataset.getFirstRecord();
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
	   	McHubfeeCheckList_dataset.setParameter("op","CHECK");
	   	McHubfeeCheckList_dataset.setParameter("approveStatusChoose","01");
	   	return true;
	}
	
	function btReject_onClickCheck() {
		var hasSelected = false;		
		var record =McHubfeeCheckList_dataset.getFirstRecord();
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
	   	McHubfeeCheckList_dataset.setParameter("op","CHECK");
	   	McHubfeeCheckList_dataset.setParameter("approveStatusChoose","02");
	   	return true;
	}
	
	function btApprove_postSubmit(button){
	    alert("${Common_Message_Success}");
		McHubfeeCheckList_dataset.flushData(McHubfeeCheckList_dataset.pageIndex);
	}
	function btReject_postSubmit(button){
	    alert("${Common_Message_Success}");
		McHubfeeCheckList_dataset.flushData(McHubfeeCheckList_dataset.pageIndex);
	}
	//刷新数据
	function flushPage(){
		McHubfeeCheckList_dataset.flushData(McHubfeeCheckList_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>