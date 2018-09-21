<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<#--jianxue.zhang-->
<@CommonQueryMacro.page title="机构维护审核">
<table width="100%" align="left">
<tr>
<td>
<@CommonQueryMacro.CommonQuery id="Management_branchManage_Check" init="true" submitMode="selected">
	<table width="100%">
		<tr>
   			<td valign="top" colspan="2">
   			<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}" colNm=4 showButton="true" />
        	</td>
        </tr>
		<tr>
   			<td colspan="2">
   				<@CommonQueryMacro.PagePilot id="PagePilot"/>
   			</td>

  		</tr>
  		<tr>
      		<td colspan="2">
          		<@CommonQueryMacro.DataTable id ="datatable1" paginationbar="btBatchApprove,btBatchReject" fieldStr="select,id[220],adtRcdPk,updTransCd,insCd[250],creid,cretimeShow[150],modid,modtimeShow[150]"  width="100%"  readonly="true"/><br />
        	</td>
        </tr>

   </table>
</@CommonQueryMacro.CommonQuery>

</td>
</tr>
</table>

<script language="javascript" src="${contextPath}/js/topTsk.js"></script>
 <script language="javascript">
function initCallGetter_post() {
	 var intInsId = "${RequestParameters["intInsId"]?default('')}";
	 if(intInsId!=null && intInsId.length>0){
	 	Management_branchManage_Check_interface_dataset.setValue("intInsId", intInsId);
	 	Management_branchManage_Check_dataset.flushData(UndoConfirm_dataset.pageIndex);
	 }
 }

//定位一条记录
function locate(id) {
	var record = Management_branchManage_Check_dataset.find(["id"],[id]);
	if (record) {
		Management_branchManage_Check_dataset.setRecord(record);
	}
}
//将id列变成超链接,需要记录类型,操作说明,原纪录主键,记录本身
//TODO
 function datatable1_id_onRefresh(cell, value, record){
	if(record){
		var type = record.getValue("intInsId");
		var sta = record.getValue("updTransCd");
		var rcdpk = record.getValue("adtRcdPk");
		var tskId = record.getValue("id");
		//cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:detail.showUodoTaskDetail('"+type+"','"+sta+"','"+rcdpk+"')\">"+value+"</a>";
		cell.innerHTML = "<a href=\"Javascript:void(0);\" onClick=\"Javascript:Compdetail.showCompTaskDetail('"+type+"','"+sta+"','"+rcdpk+"','"+tskId+"')\">"+value+"</a>";
	}else{
		cell.innerHTML = "";
	}
}

function btBatchApprove_onClickCheck() {
    if (!isRecordSelected(Management_branchManage_Check_dataset)) {
        alert("${PLEASE_SELECT_RECORD}");
        return false;
    }
    return true;
}

function isRecordSelected(dataset) {
    var record = dataset.getFirstRecord();
    var hasSelected = false;
    while (record) {
        var v_selected = record.getValue("select");
        if (v_selected == true) {
            hasSelected = true;
        }
        record = record.getNextRecord();
    }
    if (!hasSelected) {
        return false;
    }
    return true;
}
function btBatchApprove_postSubmit() {
    alert("${AUDIT_THROUGH_SUCCESS}")
    Management_branchManage_Check_dataset.flushData(1);
    return false;
}

function btBatchReject_postSubmit() {
    alert("${REVIEW_REJECTS_SUCCESS}")
    Management_branchManage_Check_dataset.flushData(1);
    return false;
}
function btBatchReject_onClickCheck() {
    if (!isRecordSelected(Management_branchManage_Check_dataset)) {
        alert("请选择一条记录！");
        return false;
    }
    return true;
}
function flushParentData(){
	Management_branchManage_Check_dataset.flushData(1);
}
</script>

</@CommonQueryMacro.page>