<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="日志查询">
<@CommonQueryMacro.CommonQuery id="tblCsBizLogQuery" init="false" submitMode="current" navigate="false">
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
	<table align="left" width="100%">
     <tr valign="center">
       			<td valign="top">
					<@CommonQueryMacro.Interface id="intface" label="${COMMON_QUERY_SELECT}" colNm=4 />
				</td>
     </tr>
     <tr>
      		<td valign="top">
      			 <@CommonQueryMacro.PagePilot id="pagePilot1" maxpagelink="9" showArrow="true" pageCache="false"/>
      		</td>
	 </tr>
     <tr>
      		<td>
      			<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="pdfDownload" fieldStr="id[200],oprCode[80],brCode[150],txnDate[100],txnStartTime[150],oprTxnCd[240],txnBizLog1[800]" readonly="true" width="100%"/>
      		</td>
     </tr>
</table>
</@CommonQueryMacro.CommonQuery>
<span style="display:none">

</span>

<script language="JavaScript">
	function initCallGetter_post(){
		tblCsBizLogQuery_interface_dataset.setValue("startDate",new Date());
		tblCsBizLogQuery_interface_dataset.setValue("endDate",new Date());
	}
	
	// 批量导入
	function pdfDownload_onClick(){
		var sdate = tblCsBizLogQuery_interface_dataset.getValue("startDate");
		var edate = tblCsBizLogQuery_interface_dataset.getValue("endDate");
		var user = tblCsBizLogQuery_interface_dataset.getValue("oprcode1");
		var opreation= tblCsBizLogQuery_interface_dataset.getValue("oprTxnCd");
		dwr.engine.setAsync(false);
		CheckAction.exportPDF(sdate,edate,user,opreation,function(data){
			if(data != ""){
				window.location.href = "${contextPath}/report/DownFileAction.do?filename="+data+"&flag=1";
			//	alert("Success!");
			}
		});
	}

</script>
</@CommonQueryMacro.page>
