<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#assign st="${RequestParameters['st']}" />
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="">
<#if st=="2">
	<@CommonQueryMacro.CommonQuery id="branchManageDetail" init="true" submitMode="all" navigate="false">
	<table align="left">
	      <tr valign="top">
	  			<td valign="top">
	  			<FIELDSET name='group6' style="padding: 6px;">
					<LEGEND>Country/Institution Information</LEGEND>
					<table frame=void width="100%" class="grouptable" id="detailTable">
					<tr>
					             
		                  <td nowrap class="labeltd" colspan=2><@message code="Common.Message.before.mod"/></td>
						          
						   <td nowrap class="labeltd" colspan=2><@message code="Common.Message.after.mod"/></td>
						 
						</tr>
		            	<tr>
		                  <td nowrap class="labeltd"><@message code="branchManageDetail.CommQry.Field.old_brno"/></td>
						  <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="old_brno"/></td>
						   <td nowrap class="labeltd"><@message code="branchManageDetail.CommQry.Field.old_brno"/></td>
						  <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="brno"/></td>
						</tr>
		            	<tr>
		                  <td nowrap class="labeltd"><@message code="branchManageDetail.CommQry.Field.brname"/></td>
						  <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="old_brname"/></td>
						   <td nowrap class="labeltd"><@message code="branchManageDetail.CommQry.Field.brname"/></td>
						  <td class="datatd" nowrap ><@CommonQueryMacro.SingleField fId="brname"/></td>
						</tr>
						
						<tr>
		                  <td nowrap class="labeltd"><@message code="branchManage.Fields.Field.timezone"/></td>
						  <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="old_timezone"/></td>
						   <td nowrap class="labeltd"><@message code="branchManage.Fields.Field.timezone"/></td>
						  <td class="datatd" nowrap ><@CommonQueryMacro.SingleField fId="timezone"/></td>
						</tr>
		            <tr valign="top">
      		   <td valign="CENTER">
					<left><@CommonQueryMacro.Button id= "btClose"/></left>
					<left><@CommonQueryMacro.Button id= "btApprove"/></left>
					<left><@CommonQueryMacro.Button id= "btReject"/></left>
      			</td>
      		</tr> 
					</table>
					</FIELDSET>
	  			</td>
	  		</tr>
	</table>
	</@CommonQueryMacro.CommonQuery>
<#else>
	<@CommonQueryMacro.CommonQuery id="branchManageDetail" init="true" submitMode="all"  navigate="false">
	<table align="left">
      <tr valign="top">
  			<td valign="center">
  			<@CommonQueryMacro.Group id ="group1" label="Country/Institution" fieldStr="old_brno,old_brname,old_timezone" colNm=2/>
  			</td>
  		</tr>
  		<tr valign="top">
      		   <td valign="CENTER">
					<left><@CommonQueryMacro.Button id= "btClose"/></left>
      			</td>
      		</tr> 
	</table>
	</@CommonQueryMacro.CommonQuery>
</#if>

<script language="javascript">
	var tskId = "${RequestParameters['tskId']}";
     function btClose_onClickCheck(button){
       unloadPageWindows("partWin");
       return false;
     }
	function btApprove_onClickCheck() {
	   	branchManageDetail_dataset.setParameter("tskId",tskId);
	   	return true;
	}
	
	function btReject_onClickCheck() {
	   	branchManageDetail_dataset.setParameter("tskId",tskId);
	   	return true;
	}
	
	function btApprove_postSubmit(button){
	    alert("${Common_Message_Success}");
		unloadPageWindows("partWin");
		flushParentData();
	}
	function btReject_postSubmit(button){
	    alert("${Common_Message_Success}");
		unloadPageWindows("partWin");
		flushParentData();
	}
	    
</script>
</@CommonQueryMacro.page>
