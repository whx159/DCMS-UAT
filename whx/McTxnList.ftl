<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="交易信息列表">
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.CommonQuery id="McTxnList" init="false" submitMode="selected">
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
		 <#if v_country=="TH" >
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable"   fieldStr="orderno,txndate[140],revtime,merid,mernm,pmtchan[140],txnamt[150],agtfee[170],hsbcfee[150],status[170],pmtstatus[150]"  width="100%"   hasFrame="true"/>
			</td>
		  <#elseif v_country=="ID" >
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable"   fieldStr="orderno,txndate[140],revtime,merid,mernm,pmtchan[140],txnamt[150],agtfee[170],hsbcfee[150],status[170],pmtstatus[150]"  width="100%"   hasFrame="true"/>
			</td>
		 </#if>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	function initCallGetter_post(){
		McTxnList_interface_dataset.setValue("qstartdate",new Date());
		McTxnList_interface_dataset.setValue("qenddate",new Date());
	}
function flushPage(){
	McMerinfoSelectTwoList_dataset.flushData(1);
}
</script>
</@CommonQueryMacro.page>