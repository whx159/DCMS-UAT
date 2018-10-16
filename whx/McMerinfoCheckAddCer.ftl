<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="绑定证书">
<table align="left"  width="100%">
	<@CommonQueryMacro.CommonQuery id="mcMerinfoListCheckCer" init="true" submitMode="current">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}" colNm="4"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btApprove,btReject" fieldStr="select,merid[200],mertype[200],apiclientid[200],cerbindstatus[100],mername[200],supmerid[120],meracct[120],merfeeacct[160],chlfeecycle[120]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</@CommonQueryMacro.CommonQuery>
	
	
	
</table>

<script language="javascript">
	function initCallGetter_post(){
	
	}
	
	
	function btApprove_onClickCheck() {
		var hasSelected = false;	
		var record = mcMerinfoListCheckCer_dataset.getFirstRecord();
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
	   	mcMerinfoListCheckCer_dataset.setParameter("op","CHECK");
	   	mcMerinfoListCheckCer_dataset.setParameter("approveStatusChoose","01");
	   	return true;
	}
	
	function btReject_onClickCheck() {
		var hasSelected = false;		
		var record =mcMerinfoListCheckCer_dataset.getFirstRecord();
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
	   	mcMerinfoListCheckCer_dataset.setParameter("op","CHECK");
	   	mcMerinfoListCheckCer_dataset.setParameter("approveStatusChoose","02");
	   	return true;
	}
	
	function locate(id){
	    var record = mcMerinfoListCer_dataset.find(["id"], [id]);
	    if (record) {
	        mcMerinfoListCheckCer_dataset.setRecord(record);
	        mcMerinfoListCheckCer_dataset.setValue("select",false);
	    }
	}
	
	function btApprove_postSubmit(button){
	    alert("${Common_Message_Success}");
		mcMerinfoListCheckCer_dataset.flushData(mcMerinfoListCheckCer_dataset.pageIndex);
	}
	function btReject_postSubmit(button){
	    alert("${Common_Message_Success}");
		mcMerinfoListCheckCer_dataset.flushData(mcMerinfoListCheckCer_dataset.pageIndex);
	}
	
	
</script>
</@CommonQueryMacro.page>