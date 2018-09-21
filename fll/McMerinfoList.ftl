<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.page title="商户列表">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.CommonQuery id="McMerinfoList" init="true" submitMode="current">
	<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}" colNm="4"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
		<#if v_country=="HK" || v_country=="SG" >
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd,-,btnUpload,-,btnDownload" fieldStr="opr[180],merid[150],status[140],prostatus,custid,mername,mertype[130],supmerid,aggregator,credate,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%" hasFrame="true"/>
			</td>
		 <#elseif v_country=="ID" || v_country=="TH" || v_country=="CN">
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd" fieldStr="opr[180],merid[150],status[140],prostatus,custid,mername,mertype[130],supmerid,aggregator,credate,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%" hasFrame="true"/>
			</td>
		</#if>
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
var country = "${v_country}";

//刷新数据
function flushPage(){
	McMerinfoList_dataset.flushData(1);
}
//新增
function btAdd_onClick(){
	showWin("${McMerinfoList_btAdd_1}","/fpages/hsbc/ftl/McMerinfoDetail.ftl?op=ADD","window","flushPage()",window);
}
//定位一条记录
function locate(id){
    var record = McMerinfoList_dataset.find(["id"], [id]);
    if (record) {
        McMerinfoList_dataset.setRecord(record);
    }
}
//修改
function doModify(id){
    showWin("${McMerinfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McMerinfoDetail.ftl?qid=" + id + "&op=MOD","window","flushPage()",window);
}
//删除
function doDelete(id){
    locate(id);
    if(confirm("${Common_Message_Delete_Yes_Or_No}")){
    	McMerinfoList_dataset.setParameter("op","DEL");
        btDel.click();
    }
}
function btDel_postSubmit(button){
	alert("${Common_Message_Success}");
	flushPage();
}
// 批量导入
function btnUpload_onClick(){
	var currentSubWin = openSubWin("pageWinIdDownload", "${Common_Button_upload}", "/fpages/hsbc/jsp/download.jsp?fileflag=McMerinfoList","600","180");
}
function btnDownload_onClick(){
	window.location.href ="${contextPath}/batchImport/download.spring?fileflag=McMerinfoList";
}
function doCancel(id){
    locate(id);
    if(confirm("${Common_Message_Cancel_Yes_Or_No}")){
    	McMerinfoList_dataset.setParameter("op","CANCEL");
        btDel.click();
    }
}
function doDetail(id){
	locate(id);
	showWin("${McMerinfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McMerinfoDetail.ftl?qid=" + id + "&op=detail"+"&approvelflag=1","window","flushPage()",window);
}
function datatable_merid_onRefresh(cell,value,record) {
	if (record) {
		var id = record.getValue("id");
		var merid = record.getValue("merid");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + merid + "</a>"
	} else {
		cell.innerHTML="&nbsp;";
	}
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