<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="入账交易信息">
<#assign v_tlrno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getTlrno()?default('')>
<@CommonQueryMacro.CommonQuery id="McHubamtList" init="false" submitMode="current">
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
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="btAdd"  fieldStr="opr[180],traceno,status[140],vdate,merid,payerbank,payeracct,payername,payeeacct,payeename,amt,curcd,creid,cretimeShow[150],modid,modtimeShow[150],chkid,chktimeShow[150],nar1"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
		<tr align="center">
            <td>
                <div style="display:none">
				<@CommonQueryMacro.Button id= "btCancel"/>
                </div>
            </td>
        </tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
var tlrno = "${v_tlrno}";
	//新增
	function btAdd_onClick(){
	  showWin("${McHubamtList_btAdd}","/fpages/hsbc/ftl/McHubamtDetail.ftl?op=ADD","window","flushPage()",window);
	}
	//刷新数据
	function flushPage(){
		McHubamtList_dataset.flushData(McHubamtList_dataset.pageIndex);
	}
	//详细信息
	function datatable_traceno_onRefresh(cell,value,record) {
		if (record) {//当存在记录时
		var traceno = record.getValue("traceno");
		cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+traceno+"')\">" + traceno + "</a>"
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function doDetail(id){
		locate(id);
		var record = McHubamtList_dataset.find(["id"], [id]);
		showWin("${McHubamtList_btMod}","/fpages/hsbc/ftl/McHubamtDetail.ftl?traceno=" + id + "&op=seedetail","window","flushPage()",window);
	}
	//定位一条记录
	function locate(traceno){
	    var record = McHubamtList_dataset.find(["traceno"], [traceno]);
	    if (record) {
	        McHubamtList_dataset.setRecord(record);
	    }
	}
	//修改
	function doModify(traceno){
		showWin("${McHubamtList_btMod}","/fpages/hsbc/ftl/McHubamtDetail.ftl?traceno=" + traceno + "&op=MOD","window","flushPage()",window);
	}
	//取消
	function doCancel(traceno){
	    locate(traceno);
	    if(confirm("${Common_Message_Cancel_Yes_Or_No}")){
	    	McHubamtList_dataset.setParameter("op","CANCEL");
	        btCancel.click();
	    }
	}
	function btCancel_needCheck(button){
		return false;
	}
	function btCancel_postSubmit(button){
		alert("${Common_Message_Success}");
		flushPage();
	}
	function datatable_opr_onRefresh(cell, value, record){
	    if (record) {//当存在记录时
	    	var status = record.getValue("status");
	    	var action = record.getValue("action");
	    	var prostatus = record.getValue("prostatus");
	    	var creid = record.getValue("creid");
	    	var modid = record.getValue("modid");
	        var id = record.getValue("traceno");
	        var innerText = "<center>";
	        if("05"==status){
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Delete}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	        }else if("01"==status){
	        	if(("01"==action&&tlrno==creid)||tlrno==modid){
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"JavaScript:doCancel('"+ id + "')\">${Cancel}</a> &nbsp;";
	        	}else{
	        		innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	        	}
	        }else if("04"==status){
	        	if(tlrno==creid){
	        		innerText = innerText + "<a href=\"JavaScript:doModify('" + id + "')\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	        	}else{
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	    		}
	    	}else if("03"==status){
	    		if("01"==action&&"0"==prostatus){
	    			innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	    		}else{
	    			innerText = innerText + "<a href=\"JavaScript:doModify('" + id + "')\">${Amend}</a> &nbsp;";
		        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	    		}
	    	}else{
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Amend}</a> &nbsp;";
	        	innerText = innerText + "<a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">${Cancel}</a> &nbsp;";
	        }
	    	cell.innerHTML = innerText + "</center>";
	    } else {//当不存在记录时
	        cell.innerHTML = "&nbsp;";
	    }
	}	

</script>
</@CommonQueryMacro.page>