<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("CHECK")>
<@CommonQueryMacro.page title="第三方机构信息维护">
<table width="50%" align="left">
	<@CommonQueryMacro.CommonQuery id="McFeerateTmpList" init="true" submitMode="all">
	<tr>
      	<td align="left">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true" label="${Common_Message_after_mod}">
		<table width="100%" >
		 	<tr>
		      	<td  align="left">
						<@CommonQueryMacro.Group id="group1" label="${McFeeRateDetail_Group_group1_label}" labelwidth="10%" fieldStr="feetype,orgid,country,paytype,feemode,feerate,feemix,feemax" colNm=4 /></br>
		        </td>
		    </tr>			   
		</table>
		</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	<tr>
		<td align="left">
    		<@CommonQueryMacro.Button id= "btBack"/>
    		<@CommonQueryMacro.Button id= "btApprove"/>
    		<@CommonQueryMacro.Button id= "btReject"/>
		</td>
	</tr>
	</@CommonQueryMacro.CommonQuery>
</table>
<table width="50%" align="left">
	<@CommonQueryMacro.CommonQuery id="McFeerateDetailList" init="true" submitMode="all" >
	<tr>
      	<td align="left">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true" label="${Common_Message_before_mod}">
		<table width="100%" >
		 	<tr>
		      	<td  align="left">
						<@CommonQueryMacro.Group id="group1" label="${McFeeRateDetail_Group_group1_label}" labelwidth="10%" fieldStr="feetype,orgid,country,paytype,feemode,feerate,feemix,feemax" colNm=4 /></br>
		        </td>
		    </tr>			   
		</table>
		</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
	</@CommonQueryMacro.CommonQuery>
</table>
<script language="javascript">
var op = "${v_op}";

function initCallGetter_post(){
	if(op=="detail"){
		McFeerateTmpList_dataset.setReadOnly(true);
		McFeerateDetailList_dataset.setReadOnly(true);
		var feetypeTmp = McFeerateTmpList_dataset.getValue("feetype");
		if(feetypeTmp=="3"){
			McFeerateTmpList_dataset.setFieldRequired("orgid",false);
			McFeerateTmpList_dataset.setFieldRequired("paytype",false);
		}
		
		var feetype = McFeerateDetailList_dataset.getValue("feetype");
		if(feetype=="3"){
			McFeerateDetailList_dataset.setFieldRequired("orgid",false);
			McFeerateDetailList_dataset.setFieldRequired("paytype",false);
		}
	}
	highlight(McFeerateTmpList_dataset,McFeerateDetailList_dataset);
}

function btBack_onClick(button) {
	 closeWin();
}
function btApprove_onClickCheck() {
   	McFeerateTmpList_dataset.setParameter("op","CHECK");
   	McFeerateTmpList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	McFeerateTmpList_dataset.setParameter("op","CHECK");
   	McFeerateTmpList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateTmpList_dataset.flushData(McFeerateTmpList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin();
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateTmpList_dataset.flushData(McFeerateTmpList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin();
}

</script>
</@CommonQueryMacro.page>