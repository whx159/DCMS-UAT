<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="Refund Detail">
<table width="100%" align="center">
	<@CommonQueryMacro.CommonQuery id="HKRefund" init="true" submitMode="all">
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