<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<@CommonQueryMacro.page title="入账交易详细信息">
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
	<@CommonQueryMacro.CommonQuery id="McHubamtDetail" init="true" insertOnEmpty="true" navigate="false" submitMode="current" >
	<table width="90%" cellpadding="2">
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtList.Field.traceno" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="traceno"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.vdate" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="vdate"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.merid" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="merid"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.payerbank" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="payerbank"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.payeracct" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="payeracct"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.payername" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="payername"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.payeeacct" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="payeeacct"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.payeename" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="payeename"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.amt" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="amt"/></td>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.curcd" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="curcd"/></td>
		</tr>
		<tr>
			<td width="25%" colspan="1" align="right" nowrap class="labeltd"><@message code="McHubamtDetail.Field.nar1" /></td>
			<td width="25%" class="datatd"><@CommonQueryMacro.SingleField fId="nar1"/></td>
		</tr>
		<#if v_op=="detail">
		<tr>
		    <td colspan="4" align="left">
		    <@CommonQueryMacro.Button id="btBack"/>
		    <@CommonQueryMacro.Button id="btOneApprove"/>&nbsp; &nbsp;
		    <@CommonQueryMacro.Button id="btOneReject"/>&nbsp; &nbsp;
		    </td>
		</tr>
		<#elseif v_op=="seedetail">	
		<tr>
			<td colspan="4" align="center">
		    <@CommonQueryMacro.Button id="btBack"/>
		    </td>
		</tr>
		<#else>
		<tr>
		    <td colspan="4" align="center">
		    <@CommonQueryMacro.Button id="btSave"/>&nbsp; &nbsp;
		    <@CommonQueryMacro.Button id="btBack"/>
		    </td>
		</tr>
		</#if>
	</table>	
	</@CommonQueryMacro.CommonQuery>
	<script language="javascript">
	var op = "${v_op}";
	function initCallGetter_post(){
	/*
		if(op=="MOD"){
			McHubamtDetail_dataset.setFieldReadOnly("traceno", true);
			McHubamtDetail_dataset.setFieldReadOnly("vdate", true);
		}
	*/	
		if(op=="detail" || op=="seedetail"){
			McHubamtDetail_dataset.setReadOnly(true);
		}
	}
	function btOneApprove_needCheck() {
        return false;
    }

    function btOneReject_needCheck() {
        return false;
    }

	function btOneApprove_onClickCheck() {
	   	McHubamtDetail_dataset.setParameter("op","CHECK");
	   	McHubamtDetail_dataset.setParameter("approveStatusChoose","01");
	   	return true;
	}
	
	function btOneReject_onClickCheck() {
	   	McHubamtDetail_dataset.setParameter("op","CHECK");
	   	McHubamtDetail_dataset.setParameter("approveStatusChoose","02");
	   	return true;
	}

    function btOneApprove_postSubmit() {
       	alert("${AUDIT_THROUGH_SUCCESS}")
        closeWin(true);
        return false;
    }

    function btOneReject_postSubmit() {
        alert("${REVIEW_REJECTS_SUCCESS}")
        closeWin(true);
        return false;
    }
	
	function btSave_onClickCheck(button){
		McHubamtDetail_dataset.setParameter("op",op);
	    var result=0;
	    var flag = 0;
		if(op=="ADD"){
		  	var traceno=McHubamtDetail_dataset.getValue("traceno");
		    dwr.engine.setAsync(false);
			CheckAction.checkTraceno(traceno,function(mgs){
			alert(mgs);
				if(mgs != 0){
					alert("Hub Ref No already exists");
				}else{
					flag = 1;
				}
			});
			dwr.engine.setAsync(true);
			//McHubamtDetail_dataset.setValue("traceno",result);
		}
		if(flag == 0){
			return false;
		}
	}
	
	function btSave_postSubmit(button){
		alert("Save success!");
		closeWin(true);
	}
	
	function btBack_onClick() {
		closeWin();
	}
	</script>
</@CommonQueryMacro.page>