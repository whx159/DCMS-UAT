<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<@CommonQueryMacro.page title="">
<table width="50%" align="left">
	<tr>
      	<td>
		<@CommonQueryMacro.CommonQuery id="mcOrgInfoTmpList" init="true" submitMode="all">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true" label="${Common_Message_after_mod}">
		<table width="100%" >
		 	<tr>
		      	<td  align="left">
						<@CommonQueryMacro.Group id="group1" label="${McOrgInfoDetail_Group_group1_label}" labelwidth="10%" fieldStr="orgname,orgnm" colNm=6 /></br>
		        </td>
		    </tr>			   
		</table>
		</@CommonQueryMacro.GroupBox>
		</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td width="100%">
			<@CommonQueryMacro.CommonQuery id="mcPayTypeTmpList" init="true" submitMode="all" navigate="false" >
				<@CommonQueryMacro.GroupBox id="guoup2" label="${McOrgInfoDetail_GroupBox_guoup2_label}" expand="true">
  					<table  width="100%">
						<tr>
							<td>
								<@CommonQueryMacro.DataTable id ="datatable1" fieldStr="paytype[300],country[200]" width="100%" hasFrame="true" height="300" pagination="false"/>
							</td>
						</tr>
					</table>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td align="left">
			<@CommonQueryMacro.Button id= "btBack"/>
			<@CommonQueryMacro.Button id= "btApprove"/>
			<@CommonQueryMacro.Button id= "btReject"/>
		</td>
	</tr>
</table>
<table width="50%" align="left">
	<tr>
      	<td>
		<@CommonQueryMacro.CommonQuery id="mcOrgInfoDetailList" init="true" submitMode="all">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true" label="${Common_Message_before_mod}">
		<table width="100%" >
		 	<tr>
		      	<td  align="left">
						<@CommonQueryMacro.Group id="group1" label="${McOrgInfoDetail_Group_group1_label}" labelwidth="10%" fieldStr="orgname,orgnm" colNm=6 /></br>
		        </td>
		    </tr>			   
		</table>
		</@CommonQueryMacro.GroupBox>
		</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<tr>
		<td width="100%">
			<@CommonQueryMacro.CommonQuery id="mcPayTypeDetailList" init="true" submitMode="all" navigate="false" >
				<@CommonQueryMacro.GroupBox id="guoup2" label="${McOrgInfoDetail_GroupBox_guoup2_label}" expand="true">
  					<table  width="100%">
						<tr>
							<td>
								<@CommonQueryMacro.DataTable id ="datatable2" fieldStr="paytype[300],country[200]" width="100%" hasFrame="true" height="300" pagination="false"/>
							</td>
						</tr>
					</table>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
</table>

<script language="javascript">
var op = "${v_op}";
function initCallGetter_post(){
	if(op=="detail"){
		mcOrgInfoDetailList_dataset.setReadOnly(true);
		mcPayTypeDetailList_dataset.setReadOnly(true);
		mcOrgInfoTmpList_dataset.setReadOnly(true);
		mcPayTypeTmpList_dataset.setReadOnly(true);
	}
	highlight(mcOrgInfoTmpList_dataset,mcOrgInfoDetailList_dataset);
	highlightTable(mcPayTypeTmpList_dataset,mcPayTypeDetailList_dataset,"paytype");
}
function btBack_onClick(button) {
	 closeWin();
}
function btApprove_onClickCheck() {
   	mcOrgInfoTmpList_dataset.setParameter("op","CHECK");
   	mcOrgInfoTmpList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	mcOrgInfoTmpList_dataset.setParameter("op","CHECK");
   	mcOrgInfoTmpList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoTmpList_dataset.flushData(mcOrgInfoTmpList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin(true);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoTmpList_dataset.flushData(mcOrgInfoTmpList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin(true);
}
</script>
</@CommonQueryMacro.page>