<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="Refund Detail">
<table width="100%" align="center">
	<@CommonQueryMacro.CommonQuery id="HKRefund" init="true" submitMode="all">
		<!--
		 <table frame=void class="grouptable" width="100%" align="center">
            <tr>
                <td align="right" nowrap class="labeltd" width="15%">Merchant ID</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merid"/></td>
                <td align="right" nowrap class="labeltd" width="15%">Transaction Reference</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="txnref" /></td>
            </tr>
            <tr>
                <td align="right" nowrap class="labeltd" width="15%">Bank ID</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="banktxnid"/></td>
                <td align="right" nowrap class="labeltd" width="15%">Refund Amt</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="refundamt" /></td>
            </tr>
            <tr>
                <td align="right" nowrap class="labeltd" width="15%">Refund Date</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="refundtxndate"/></td>
                <td align="right" nowrap class="labeltd" width="15%">Refund Time</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="refundtxntime" /></td>
            </tr>
            <tr>
                <td align="right" nowrap class="labeltd" width="15%">Refund ID</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="refundtxnid"/></td>
                <td align="right" nowrap class="labeltd" width="15%">Status</td>
                <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="status" /></td>
            </tr>
          </table>
            -->
            <tr>
				<td colspan="2">
					<@CommonQueryMacro.DataTable id ="datatable"  paginationbar="btClose"   width="100%"   hasFrame="true"/>
				</td>
			</tr>
            
          
          
	</@CommonQueryMacro.CommonQuery>
</table>
<script language="javascript">

function initCallGetter_post(){
	
}

function btClose_onClick(button) {
	 closeWin();
}

</script>
</@CommonQueryMacro.page>