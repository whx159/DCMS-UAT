<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="交易信息列表">
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.CommonQuery id="SGPaymenttxnList" init="false" submitMode="selected">
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
<table align="left"  width="100%">
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
				<@CommonQueryMacro.DataTable id ="datatable"   fieldStr="endToEndId[150],settDate[150],settTime,merid[120],mername[120],sysref[150],payeeCur[150],payeeAmt[150],proxyid,meracct[150]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	function initCallGetter_post(){
		SGPaymenttxnList_interface_dataset.setValue("tstartdate",new Date());
		SGPaymenttxnList_interface_dataset.setValue("tenddate",new Date());
	}
	function comparedate(beginDate,endDate){
		if(endDate !== "" && beginDate !== "") {
			var sDate = new Date(beginDate);
    		var eDate = new Date(endDate);
    		dwr.engine.setAsync(false);
			CheckAction.compareDate(sDate,eDate,function(data){
					if(data == 1){
						alert("The time interval should not exceed one month");
						SGPaymenttxnList_interface_dataset.setValue("tstartdate","");
						SGPaymenttxnList_interface_dataset.setValue("tenddate","");
					}else if(data == 2){
						alert("The end date should be greater than the start date!");
						SGPaymenttxnList_interface_dataset.setValue("tstartdate","");
						SGPaymenttxnList_interface_dataset.setValue("tenddate","");
					}
			});
			dwr.engine.setAsync(true);
		}
	}
	function SGPaymenttxnList_interface_dataset_afterChange(dataset,field){
		var date="";					
		if(field.name=="tenddate"){
			var beginDate=dataset.getValue("tstartdate");
			var endDate=dataset.getValue("tenddate");
			if(endDate !== "" && beginDate !== "") {
				var sDate = new Date(beginDate);
	    		var eDate = new Date(endDate);
	    		comparedate(beginDate,endDate);
			}
		}
		if(field.name=="tstartdate"){
			var beginDate=dataset.getValue("tstartdate");
			var endDate=dataset.getValue("tenddate");
			if(endDate !== "" && beginDate !== "") {
				var sDate = new Date(beginDate);
	    		var eDate = new Date(endDate);
	    		comparedate(beginDate,endDate);
			}
		}
	}

function flushPage(){
	McMerinfoSelectTwoList_dataset.flushData(1);
}
</script>
</@CommonQueryMacro.page>