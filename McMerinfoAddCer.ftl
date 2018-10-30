<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="绑定证书">
<table align="left"  width="100%">
	<@CommonQueryMacro.CommonQuery id="mcMerinfoListCer" init="true" submitMode="current">
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
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="opr,merid,mertype[200],apiclientid,cerbindstatus[100],mername[200],supmerid[120],meracct[120],merfeeacct[160],chlfeecycle[120]"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</@CommonQueryMacro.CommonQuery>
	
	
	
</table>
<table>
	<@CommonQueryMacro.CommonQuery id="mcMerinfoListCer" init="true" submitMode="current">
	<tr>
        <td>
            <@CommonQueryMacro.FloatWindow id="signWindow" label="" height="" width="750" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
            	<FIELDSET name='guoup1' style="padding: 6px;">
               	<LEGEND extra="groupboxtitle">${Please_Select_Sertificate}</LEGEND>
                    <table frame=void class="grouptable" width="100%">
                        <tr>
                           <td align="right" nowrap class="labeltd" width="15%">API Client ID</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="apiclientid"/></td>
                            <td class="datatd" width="10%"><@CommonQueryMacro.SingleField fId="select" /></td>
                            <td align="left" nowrap class="labeltd" width="35%">${McPubkeyList_Select}</td>
                        </tr>
                        <tr>
	            			<td align="center" colspan="4">
		  						<@CommonQueryMacro.Button id= "btConfirm"/>
	            			</td>
	            		</tr>
                    </table>
              	</FIELDSET>
 		   </@CommonQueryMacro.FloatWindow>
        </td>
	 </tr>
	 </@CommonQueryMacro.CommonQuery>
</table>
<script language="javascript">
	function datatable_opr_onRefresh(cell, value, record){
	    if (record) {//当存在记录时
	        var id = record.getValue("id");
	        var cerstatus = record.getValue("cerbindstatus");
	        if(cerstatus != "1"){
				cell.innerHTML = "<center><a href=\"JavaScript:bindCertificate('" + id + "')\">Bind Certificate</a>";
	        }else{
				//cell.innerHTML = "<center><a href=\"JavaScript:void(0);\">Bind Certificate</a>";
				cell.innerHTML = "<center><a href=\"Javascript:void(0);\" style=\"color:#666666;text-decoration:none\" title=\"${LOCKED}\">Bind Certificate</a>";
	        }
	    } else {//当不存在记录时
	        cell.innerHTML = "&nbsp;";
	    }
	}
	
	function initCallGetter_post(){
	
	}
	
	//显示浮窗
	function bindCertificate(id){
		locate(id);
		var mertype = mcMerinfoListCer_dataset.getValue("mertype");
		if(mertype == "2"){
			mcMerinfoListCer_dataset.setFieldReadOnly("select",true);
		} else {
			mcMerinfoListCer_dataset.setFieldReadOnly("select",false);
			mcMerinfoListCer_dataset.setValue("select",false);
		}
		//McPubkeyList_dataset.setValue("clientidsel","");
		subwindow_signWindow.show();
	}
	
	function locate(id){
	    var record = mcMerinfoListCer_dataset.find(["id"], [id]);
	    if (record) {
	        mcMerinfoListCer_dataset.setRecord(record);
	        mcMerinfoListCer_dataset.setValue("select",false);
	    }
	}
	function signWindow_floatWindow_beforeClose(subwindow){
		mcMerinfoListCer_dataset.cancelRecord();
		return true;
	}
	
	function signWindow_floatWindow_beforeHide(subwindow){
		return false;
	}

    //绑定证书
	function btAddCer_onClick(){
		subwindow_signWindow.show();
	}
	
	//确认
	function btConfirm1_onClickCheck(button){
		var selectCerno = mcMerinfoListCer_dataset.getValue("selectCerno");
	   	if (!selectCerno) {
	   		alert("请选择需要需要绑定的证书！");
	   		return false;
		}else{
			McMerinfoList_dataset.setParameter("selectCerno",selectCerno);
			var flag=McMerinfoList_dataset.getValue("flag");
			if("yes"==flag){
				mcMerinfoListCer_dataset.setParameter("flag","0");
			}else{
				mcMerinfoListCer_dataset.setParameter("flag","1");
			}
			return true;
		}
	}	
	
	function btConfirm_postSubmit(button){
    	alert("Success");
    	subwindow_signWindow.close();
    	mcMerinfoListCer_dataset.flushData(mcMerinfoListCer_dataset.pageIndex);
    }
</script>
</@CommonQueryMacro.page>