<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.page title="商户列表">
<@CommonQueryMacro.CommonQuery id="McMerinfoSelectTwoList" init="false" submitMode="current">
	<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<#if v_country=="HK" || v_country == "MY">
					<@CommonQueryMacro.Interface id="interface" fieldStr="qmerid,qcustid,qmertype,qmername,qstatus,qsupmerid,qsettlaccount" label="${COMMON_QUERY_SELECT}" colNm="4"/>
				<#else>
					<@CommonQueryMacro.Interface id="interface" fieldStr="qmerid,qcustid,qmertype,qmername,qstatus,qsupmerid" label="${COMMON_QUERY_SELECT}" colNm="4"/>
				</#if>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btExport" fieldStr="merid[160],status[140],prostatus,custid,mername,mertype,supmerid,credate,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
//刷新数据
function flushPage(){
	McMerinfoSelectTwoList_dataset.flushData(1);
}
function datatable_merid_onRefresh(cell, value, record){
    if (record) {//当存在记录时
        var id = record.getValue("id");
        
        var merid = record.getValue("merid");
		cell.innerHTML = "<center><a style='text-decoration:none' href=\"JavaScript:doSelectDetail('" + id + "')\">"+ merid +"</a>";
    } else {//当不存在记录时
        cell.innerHTML = "&nbsp;";
    }
}
//定位一条记录
function locate(id){
    var record = McMerinfoSelectTwoList_dataset.find(["id"], [id]);
    if (record) {
        McMerinfoSelectTwoList_dataset.setRecord(record);
    }
}
//查询详细信息
function doSelectDetail(id){
    showWin("${McMerinfoDetail_Group_group1_label}","/fpages/hsbc/ftl/McMerinfoSelectDetail.ftl?qid=" + id + "&op=detail","window","flushPage()",window);
}

function btExport_onClick(button){
    exportQuery("McMerinfoSelectTwoList");
}
</script>
</@CommonQueryMacro.page>