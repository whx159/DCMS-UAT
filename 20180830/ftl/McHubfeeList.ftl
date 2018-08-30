<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="计费信息列表">
<@CommonQueryMacro.CommonQuery id="McHubfeeList" init="false" submitMode="selected">
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
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btMod" fieldStr="select,mername,merid,merfeeacct,trandate,acctcur,feeamt,feetype,status"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	function btMod_onClickCheck() {
		var hasSelected = false;	
		var record =McHubfeeList_dataset.getFirstRecord();
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
	   	McHubfeeList_dataset.setParameter("op","charge");
	   	return true;
	}
	
	function btMod_postSubmit(button){
    	alert("${Common_Message_Success}");
		McHubfeeList_dataset.flushData(McHubfeeList_dataset.pageIndex);
	}
</script>
</@CommonQueryMacro.page>