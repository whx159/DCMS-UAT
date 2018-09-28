<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<@CommonQueryMacro.page title="费率详细信息">
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
	<@CommonQueryMacro.CommonQuery id="McHubfeeDetail" init="true" insertOnEmpty="true" navigate="false">
	<table width="90%" cellpadding="2">
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.traceno" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="tranno"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.workdate" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="trandate"/></td>		
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.merid" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="merid"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.mername" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="mername"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.acctno" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="merfeeacct"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.feeamt" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="feeamt"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.curcd" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="acctcur"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.feetype" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="feetype"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubfeeCheckList.Field.status" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="status"/></td>
		</tr>
		<#if v_op=="detail">
		<tr>
		    <td colspan="4" align="left">
		    <@CommonQueryMacro.Button id="btBack"/>
		    <@CommonQueryMacro.Button id="btOver"/>&nbsp; &nbsp;
		    <@CommonQueryMacro.Button id="btRefuse"/>&nbsp; &nbsp;
		    </td>
		</tr>
		<#else>
		<tr>
			<td colspan="4" align="center">
		    <@CommonQueryMacro.Button id="btBack"/>
		    </td>
		</tr>
		</#if>
	</table>	
	</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var op = "${v_op}";
	function initCallGetter_post(){
		if(op=="detail" || op=="seedetail"){
			McHubfeeDetail_dataset.setReadOnly(true);
		}
	}
	
	function btOver_needCheck() {
        return false;
    }

    function btRefuse_needCheck() {
        return false;
    }

	function btOver_onClickCheck() {
	   	McHubfeeDetail_dataset.setParameter("op","CHECK");
	   	McHubfeeDetail_dataset.setParameter("approveStatusChoose","01");
	   	return true;
	}
	
	function btRefuse_onClickCheck() {
	   	McHubfeeDetail_dataset.setParameter("op","CHECK");
	   	McHubfeeDetail_dataset.setParameter("approveStatusChoose","02");
	   	return true;
	}

    function btOver_postSubmit() {
       	alert("${AUDIT_THROUGH_SUCCESS}")
        closeWin(true);
        return false;
    }

    function btRefuse_postSubmit() {
        alert("${REVIEW_REJECTS_SUCCESS}")
        closeWin(true);
        return false;
    }
	function btBack_onClick() {
		closeWin();
	}
</script>
</@CommonQueryMacro.page>