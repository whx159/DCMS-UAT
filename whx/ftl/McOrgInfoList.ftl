<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="第三方机构信息维护">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.CommonQuery id="mcOrgInfoList" init="true" submitMode="current">
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd" fieldStr="opr[180],id,status[120],prostatus,orgname,orgnm,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%"   hasFrame="true" readonly="true"/>
			</td>
		</tr>
		<tr align="center">
            <td>
                <div style="display:none">
				<@CommonQueryMacro.Button id= "btDel"/>
                </div>
            </td>
        </tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
var tlrno = "${v_tlrno}";
function flushPage(){
	mcOrgInfoList_dataset.flushData(1);
}
function btAdd_onClick(){
	showWin("${McOrgInfoList_btAdd_1}","/fpages/hsbc/ftl/McOrgInfoDetail.ftl?op=ADD","window","flushPage()",window);
}
//定位一条记录
function locate(id){
    var record = mcOrgInfoList_dataset.find(["id"], [id]);
    if (record) {
        mcOrgInfoList_dataset.setRecord(record);
    }
}
//修改
function doModify(id){
	locate(id);
    showWin("${McOrgInfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McOrgInfoDetail.ftl?qid=" + id + "&op=MOD","window","flushPage()",window);
}
//删除
function doDelete(id){
    locate(id);
    if(confirm("${Common_Message_Delete_Yes_Or_No}")){
   		mcOrgInfoList_dataset.setParameter("op","DEL");
        btDel.click();
    }
}
function btDel_postSubmit(button){
	alert("${Common_Message_Success}");
	flushPage();
}

function doCancel(id){
    locate(id);
    if(confirm("${Common_Message_Cancel_Yes_Or_No}")){
    	mcOrgInfoList_dataset.setParameter("op","CANCEL");
        btDel.click();
    }
}

function datatable_id_onRefresh(cell,value,record) {
	if (record) {
		var id = record.getValue("id");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + id + "</a>"
	} else {
		cell.innerHTML="&nbsp;";
	}
}
function doDetail(id){
	locate(id);
	showWin("${McOrgInfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McOrgInfoDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=1","window","flushPage()",window);
}
function datatable_opr_onRefresh(cell, value, record){
    if (record) {//当存在记录时
    	var status = record.getValue("status");
    	var action = record.getValue("action");
    	var prostatus = record.getValue("prostatus");
    	var creid = record.getValue("creid");
    	var modid = record.getValue("modid");
        var id = record.getValue("id");
        var innerText = "<center>";
        if("05"==status){
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        }else if("01"==status){
        	if(("01"==action&&tlrno==creid)||tlrno==modid){
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doCancel('"+ id + "')\">${Cancel}</a> &nbsp;";
        	}else{
        		innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        	}
        }else if("04"==status){
        	if(tlrno==creid){
        		innerText = innerText + "<a href=\"JavaScript:doModify('" + id + "')\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id + "')\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        	}else{
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
    		}
    	}else if("03"==status){
    		if("01"==action&&"0"==prostatus){
    			innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
    		}else{
    			innerText = innerText + "<a href=\"JavaScript:doModify('" + id + "')\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id + "')\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
    		}
    	}else{
        	innerText = innerText + "<a href=\"JavaScript:doModify('" + id + "')\">${Amend}</a> &nbsp;";
        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id + "')\">${Delete}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        }
    	cell.innerHTML = innerText + "</center>";
    } else {//当不存在记录时
        cell.innerHTML = "&nbsp;";
    }
}
</script>
</@CommonQueryMacro.page>