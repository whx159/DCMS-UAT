<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<@CommonQueryMacro.page title="第三方机构信息维护">
<table width="60%">
	<@CommonQueryMacro.CommonQuery id="McFeerateList" init="true" submitMode="all">
	<tr>
      	<td align="left">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true">
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
	<#if v_op=="detail">
	<tr>
		<td align="left">
			<table align="left">
				<tr>
					<td colspan="2" align="left">
    					<@CommonQueryMacro.Button id= "btBack"/>
    					<@CommonQueryMacro.Button id= "btApprove"/>
    					<@CommonQueryMacro.Button id= "btReject"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<#else>
	<tr>
		<td align="center">
			<table align="center">
				<tr>
					<td colspan="2" align="center">
    					<@CommonQueryMacro.Button id= "btSave"/>&nbsp;&nbsp;
    					<@CommonQueryMacro.Button id= "btBack"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</#if>
	</@CommonQueryMacro.CommonQuery>
</table>
<script language="javascript">
var op = "${v_op}";
var brno = "${v_brno}";
function initCallGetter_post(){
	var feetype = McFeerateList_dataset.getValue("feetype");
	if(feetype=="3"){
		McFeerateList_dataset.setFieldReadOnly("orgid",true);
		McFeerateList_dataset.setFieldRequired("orgid",false);
		McFeerateList_dataset.setFieldReadOnly("country",false);
		McFeerateList_dataset.setFieldRequired("country",true);
		McFeerateList_dataset.setFieldReadOnly("paytype",true);
		McFeerateList_dataset.setFieldRequired("paytype",false);
	}else{
		McFeerateList_dataset.setFieldReadOnly("orgid",false);
		McFeerateList_dataset.setFieldRequired("orgid",true);
		McFeerateList_dataset.setFieldReadOnly("country",true);
		McFeerateList_dataset.setFieldRequired("country",true);
		McFeerateList_dataset.setFieldRequired("paytype",true);
		McFeerateList_dataset.setFieldReadOnly("paytype",true);
	}
	var feemode = McFeerateList_dataset.getValue("feemode");
	if(feemode=="2"){
		McFeerateList_dataset.setFieldReadOnly("feemix",true);
		McFeerateList_dataset.setFieldReadOnly("feemax",true);
		var showZqq = document.getElementById("showZqq");
		if(showZqq!=null){
			showZqq.innerText = "";
		}
	}else{
		McFeerateList_dataset.setFieldReadOnly("feemix",false);
		McFeerateList_dataset.setFieldReadOnly("feemax",false);
		var showZqq = document.getElementById("showZqq");
		if(showZqq!=null){
			showZqq.innerText = "(%)";
		}else{
			var span = "<span id='showZqq'>(%)</span>";
			$('#fldlabel_feerate').append(span);
		}
	}
	if(op=="detail"){
		McFeerateList_dataset.setReadOnly(true);
	}
}

function btBack_onClick(button) {
	 closeWin();
}

function btSave_onClickCheck(button){
	McFeerateList_dataset.setParameter("op",op);
}

function btSave_postSubmit(button){
	alert("${Common_Message_Success}");
	closeWin(true);
}

function feetype_DropDown_onSelect(dropdown,record,editor){
	McFeerateList_dataset.setValue("orgid","");
	McFeerateList_dataset.setValue("country","");
	McFeerateList_dataset.setValue("paytype","");
	var feetype = record.getValue("data");
	if(feetype=="3"){
		McFeerateList_dataset.setFieldReadOnly("orgid",true);
		McFeerateList_dataset.setFieldRequired("orgid",false);
		McFeerateList_dataset.setFieldRequired("country",true);
		McFeerateList_dataset.setFieldReadOnly("paytype",true);
		McFeerateList_dataset.setFieldRequired("paytype",false);
		McFeerateList_dataset.setValue("country",brno);
		McFeerateList_dataset.setValue("feemode","1");
		McFeerateList_dataset.setFieldReadOnly("feemode",true);
	}else{
		McFeerateList_dataset.setFieldReadOnly("orgid",false);
		McFeerateList_dataset.setFieldRequired("orgid",true);
		McFeerateList_dataset.setFieldRequired("country",true);
		McFeerateList_dataset.setFieldRequired("paytype",true);
		McFeerateList_dataset.setFieldReadOnly("paytype",true);
		McFeerateList_dataset.setValue("country",brno);
		McFeerateList_dataset.setFieldReadOnly("feemode",false);
	}
	return true;
}
function feemode_DropDown_onSelect(dropdown,record,editor){
	McFeerateList_dataset.setValue("feemix","");
	McFeerateList_dataset.setValue("feemax","");
	var feemode = record.getValue("data");
	if(feemode=="2"){
		McFeerateList_dataset.setFieldReadOnly("feemix",true);
		McFeerateList_dataset.setFieldReadOnly("feemax",true);
		var showZqq = document.getElementById("showZqq");
		if(showZqq!=null){
			showZqq.innerText = "";
		}
	}else{
		McFeerateList_dataset.setFieldReadOnly("feemix",false);
		McFeerateList_dataset.setFieldReadOnly("feemax",false);
		var showZqq = document.getElementById("showZqq");
		if(showZqq!=null){
			showZqq.innerText = "(%)";
		}else{
			var span = "<span id='showZqq'>(%)</span>";
			$('#fldlabel_feerate').append(span);
		}
	}
	return true;
}
function btApprove_onClickCheck() {
   	McFeerateList_dataset.setParameter("op","CHECK");
   	McFeerateList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	McFeerateList_dataset.setParameter("op","CHECK");
   	McFeerateList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateList_dataset.flushData(McFeerateList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin(true);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McFeerateList_dataset.flushData(McFeerateList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin(true);
}
</script>
</@CommonQueryMacro.page>