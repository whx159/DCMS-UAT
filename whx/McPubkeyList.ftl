<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="证书列表">
<@CommonQueryMacro.CommonQuery id="McPubkeyList" init="true" submitMode="current">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
	<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.Interface id="interface" label="${COMMON_QUERY_SELECT}" colNm="6"/>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd" fieldStr="opr[180],clientid[150],status[120],prostatus,uptlr[200],headerinfo[200],uptime[200],expirytime[200],creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]" width="100%"   hasFrame="true"/>
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
	var country = "${v_brno}";
	var tlrno = "${v_tlrno}";
	//新增
	function btAdd_onClick(){
		if(country == "HKHBAP"){
			var currentSubWin = openSubWin("pageWinId", "${ADD_CERTIFICATE}", "/fpages/hsbc/jsp/UploadCertificate.jsp?fileflag=cer","800","260");
		}else{
			var currentSubWin = openSubWin("pageWinId", "${ADD_CERTIFICATE}", "/fpages/hsbc/jsp/UploadCertificate.jsp?fileflag=cer","800","220");
		}
		
	}

	//刷新数据
	function flushPage(){
		McPubkeyList_dataset.flushData(McPubkeyList_dataset.pageIndex);
	}
	
	//定位一条记录
function locate(id){
    var record = McPubkeyList_dataset.find(["clientid"], [id]);
    if (record) {
        McPubkeyList_dataset.setRecord(record);
    }
}
//修改
function doModify(id){
	locate(id);
	var url = getUrl(id);
    if(country == "HKHBAP"){
		var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_MODIFY}", "/fpages/hsbc/jsp/CertificateModify.jsp?clientid="+id+url,"800","260");
	}else{
		var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_MODIFY}", "/fpages/hsbc/jsp/CertificateModify.jsp?clientid="+id+url,"800","220");
	}
}
//删除
function doDelete(id){
    locate(id);
    if(confirm("${Common_Message_Delete_Yes_Or_No}")){
    	McPubkeyList_dataset.setParameter("op","DEL");
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
    	McPubkeyList_dataset.setParameter("op","CANCEL");
        btDel.click();
    }
}

//获取拼接字符串的url
function getUrl(id){
	locate(id);
	var vid = McPubkeyList_dataset.getValue("uptlr");
	var effectime = McPubkeyList_dataset.getValue("uptime");
	var date = new Date(effectime);
	var time = date.getTime();
	var posname = McPubkeyList_dataset.getValue("posname");
	var cername = McPubkeyList_dataset.getValue("cername");
	var headerinfo = McPubkeyList_dataset.getValue("headerinfo");
	return "&version="+vid+"&time="+time+"&posname="+posname+"&cername="+cername+"&headerinfo="+headerinfo;
}
function doDetail(id){
	locate(id);
	var url = getUrl(id);
	if(country == "HKHBAP"){
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateDetail.jsp?clientid="+id+url,"800","260");
		}else{
			var currentSubWin = openSubWin("pageWinId", "${CERTIFICATE_DETAIL}", "/fpages/hsbc/jsp/CertificateDetail.jsp?clientid="+id+url,"800","220");
		}
}
function datatable_clientid_onRefresh(cell,value,record) {
	if (record) {
		var id = record.getValue("clientid");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+id+"')\">" + id + "</a>"
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
        var id = record.getValue("clientid");
        var vid = record.getValue("uptlr");
        var innerText = "<center>";
        if("05"==status){
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        }else if("01"==status){
        	if(("01"==action&&tlrno==creid)||tlrno==modid){
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doCancel('" + id +"')\">${Cancel}</a> &nbsp;";
        	}else{
        		innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        	}
        }else if("04"==status){
        	if(tlrno==creid){
        		innerText = innerText + "<a href=\"JavaScript:doModify('" + id +"')\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id +"')\">${Delete}</a> &nbsp;";
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
    			innerText = innerText + "<a href=\"JavaScript:doModify('" + id +"')\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id +"')\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
    		}
    	}else{
        	innerText = innerText + "<a href=\"JavaScript:doModify('" + id +"')\">${Amend}</a> &nbsp;";
        	innerText = innerText + "<a href=\"JavaScript:doDelete('" + id +"')\">${Delete}</a> &nbsp;";
        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
        }
    	cell.innerHTML = innerText;
    } else {//当不存在记录时
        cell.innerHTML = "&nbsp;";
    }
}
	
</script>
</@CommonQueryMacro.page>