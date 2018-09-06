<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="证书列表">
<@CommonQueryMacro.CommonQuery id="McPubkeyQueryList" init="true" submitMode="current">
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
			<#if (v_brno?substring(0,2) =="SG") || (v_brno?substring(0,2) =="HK")>
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="clientid[150],status[120],prostatus,uptlr[200],uptime[200],expirytime[200],posname[150],creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]" width="100%"   hasFrame="true"/>
			<#else>
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="clientid[150],status[120],prostatus,uptlr[200],uptime[200],expirytime[200],creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]" width="100%"   hasFrame="true"/>
			</#if>	
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
		McPubkeyQueryList_dataset.flushData(McPubkeyList_dataset.pageIndex);
	}
	
	//定位一条记录
function locate(id){
    var record = McPubkeyQueryList_dataset.find(["clientid"], [id]);
    if (record) {
        McPubkeyQueryList_dataset.setRecord(record);
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
    	McPubkeyQueryList_dataset.setParameter("op","DEL");
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
    	McPubkeyQueryList_dataset.setParameter("op","CANCEL");
        btDel.click();
    }
}

//获取拼接字符串的url
function getUrl(id){
	locate(id);
	var vid = McPubkeyQueryList_dataset.getValue("uptlr");
	var effectime = McPubkeyQueryList_dataset.getValue("uptime");
	var date = new Date(effectime);
	var time = date.getTime();
	var posname = McPubkeyQueryList_dataset.getValue("posname");
	var cername = McPubkeyQueryList_dataset.getValue("cername");
	return "&version="+vid+"&time="+time+"&posname="+posname+"&cername="+cername;
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
	
</script>
</@CommonQueryMacro.page>