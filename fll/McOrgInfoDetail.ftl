<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<#assign approvelflag = RequestParameters["approvelflag"]?default("1")>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<@CommonQueryMacro.page title="第三方机构信息维护">
<table width="100%">
	<tr>
      	<td>
		<@CommonQueryMacro.CommonQuery id="mcOrgInfoList" init="true" submitMode="all">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true">
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
			<@CommonQueryMacro.CommonQuery id="mcPayTypeList" init="true" submitMode="all" navigate="false" >
				<@CommonQueryMacro.GroupBox id="guoup2" label="${McOrgInfoDetail_GroupBox_guoup2_label}" expand="true">
  					<table  width="100%">
		  				<tr>
							<td align="right" id="finaButton">
								<#if (v_op!="detail")>
								<@CommonQueryMacro.Button id= "btAdd"/>&nbsp;&nbsp;
								<@CommonQueryMacro.Button id= "btDel"/>&nbsp;&nbsp;
								</#if>
							</td>
						</tr>

						<tr>
							<td>
								<@CommonQueryMacro.DataTable id ="datatable2" fieldStr="paytypename[220],country[220]" width="100%" hasFrame="true"  readonly="false"  height="300" pagination="false"/>
							</td>
						</tr>
					</table>
				</@CommonQueryMacro.GroupBox>
			</@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<#if (v_op=="detail")>
	<tr>
		<td align="left">
			<table align="left">
				<tr>
					<td colspan="2" align="left">
    					<@CommonQueryMacro.Button id= "btBack"/>
    					<#if approvelflag == "2">
	    					<@CommonQueryMacro.Button id= "btApprove"/>
	    					<@CommonQueryMacro.Button id= "btReject"/>
    					</#if>
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
</table>
<script language="javascript">
var op = "${v_op}";
var brno = "${v_brno}";
function initCallGetter_post(){
	if(op=="detail"){
		mcOrgInfoList_dataset.setReadOnly(true);
		mcPayTypeList_dataset.setReadOnly(true);
	}
	var orgname = mcOrgInfoList_dataset.getValue("orgname");
	dwr.engine.setAsync(false);
	hsbcAction.setCustm(orgname,function(data){
		obj = data;
	});
	dwr.engine.setAsync(true);
}
function btBack_onClick(button) {
	 closeWin();
}

function btSave_onClickCheck(button){
	mcOrgInfoList_dataset.setParameter("op",op);
}

function btSave_postSubmit(button){
	alert("${Common_Message_Success}");
	closeWin(true);
}
function btAdd_onClick(button){
	var record = mcPayTypeList_dataset.record;
	record.setValue("country",brno);
}
function orgname_DropDown_onSelect(dropdown,record,editor){
	var orgname = record.getValue("data");
	dwr.engine.setAsync(false);
	hsbcAction.setCustm(orgname,function(data){
		obj = data;
	});
	dwr.engine.setAsync(true);
	return true;
}
function paytypename_DropDown_beforeOpen(dropdown){
	paytypename_DropDown.cached=false;
}

function paytypename_DropDown_onSelect(dropdown,record,editor){
	var change_record = mcPayTypeList_dataset.record;
	var paytypename = record.getValue("minpaytypeName");
	var flag = false;
	var payType_record = mcPayTypeList_dataset.getFirstRecord();
	while(payType_record){
		if(change_record!=payType_record){
			var name = payType_record.getValue("paytypename");
			if(name==paytypename){
				flag = true;
			}
		}
		payType_record = payType_record.getNextRecord();
	}
	if(flag){
		alert("Can not choose duplicate payment type");
		change_record.setValue("paytypename","");
		return false;
	}else{
		return true;
	}
}

function writeObj(obj){ 
 var description = ""; 
 for(var i in obj){ 
 var property=obj[i]; 
 description+=i+" = "+property+"\n"; 
 } 
 alert(description); 
}

function btApprove_onClickCheck() {
   	mcOrgInfoList_dataset.setParameter("op","CHECK");
   	mcOrgInfoList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	mcOrgInfoList_dataset.setParameter("op","CHECK");
   	mcOrgInfoList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoList_dataset.flushData(mcOrgInfoList_dataset.pageIndex);
	closeWin(true);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	mcOrgInfoList_dataset.flushData(mcOrgInfoList_dataset.pageIndex);
	closeWin(true);
}
</script>
</@CommonQueryMacro.page>