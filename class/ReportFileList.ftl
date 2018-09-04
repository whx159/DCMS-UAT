<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="手工生成报表">
<@CommonQueryMacro.CommonQuery id="ReportFileList" init="true" submitMode="selected">
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<script type='text/javascript' src='${contextPath}/dwr/interface/ExportReportAction.js'> </script>
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				 <#if (v_brno?substring(0,2)=="HK")>
					<@CommonQueryMacro.Interface id="interface" label="${Report_Query}" fieldStr="qhkfileType,qmerid,qcreateDate" colNm="4"/>
				 </#if>
				 <#if (v_brno?substring(0,2)!="HK")>
				 	<#if (v_brno?substring(0,2) =="SG")>
						<@CommonQueryMacro.Interface id="interface" label="${Report_Query}" fieldStr="qsgfileType,qmerid,qcreateDate" colNm="4"/>
				 	<#else>
						<@CommonQueryMacro.Interface id="interface" label="${Report_Query}" fieldStr="qfileType,qmerid,qcreateDate" colNm="4"/>
					</#if>
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
			 	<#if (v_brno?substring(0,2)=="HK")>
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="filename[400],hkfileType[200],merid[200],createTime[200]"  width="100%"   hasFrame="true"/>
				 </#if>
				  <#if (v_brno?substring(0,2)!="HK")>
					<@CommonQueryMacro.DataTable id ="datatable" paginationbar="" fieldStr="filename[400],fileType[200],merid[200],createTime[200]"  width="100%"   hasFrame="true"/>
				  </#if>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">

	
    function initCallGetter_post(){
    	
    }
    
    function datatable_filename_onRefresh(cell, value, record){
	    if (record) {//当存在记录时
	        var filename = record.getValue("filename");
	        var genedate = record.getValue("createTime");
	        genedate = genedate.replace(/\-/g,"");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:download('" + filename + "','" + genedate +"')\">"+ filename +"</a>";
			//href=\"JavaScript:download('" + filename + "')\">"+ filename +"</a>";
	    } else {//当不存在记录时
	        cell.innerHTML = "&nbsp;";
    	}
	}
	
	function download(filename,genedate){
		window.location.href = "${contextPath}/report/DownFileAction.do?filename="+filename+"&genedate="+genedate+"&flag=2";
	}

	function qfileType_DropDown_onSelect(dropDown,record,editor){
	  if(record[0]=="A"){
		  ReportFileList_interface_dataset.setFieldReadOnly("qcreateDate", true);
		  ReportFileList_interface_dataset.setValue("qcreateDate","");
		  ReportFileList_interface_dataset.setFieldReadOnly("qmerid", true);
		  ReportFileList_interface_dataset.setValue("qmerid","");
	  }else if(record[0]=="D"){
		  ReportFileList_interface_dataset.setFieldReadOnly("qcreateDate", false);
		  ReportFileList_interface_dataset.setFieldReadOnly("qmerid", false);
	  }else if(record[0]=="E"){
	  	  ReportFileList_interface_dataset.setFieldReadOnly("qmerid", true);
		  ReportFileList_interface_dataset.setValue("qmerid","");
	  }else{
		  ReportFileList_interface_dataset.setFieldReadOnly("qcreateDate", false);
		  ReportFileList_interface_dataset.setFieldReadOnly("qmerid", false);
	  }
	  return true;
	}
	
	function btAdd_onClick() { 
		var fileType=ReportFileList_interface_dataset.getValue("qfileType");
		var merid=ReportFileList_interface_dataset.getValue("qmerid");
		var createDate=ReportFileList_interface_dataset.getValue("qcreateDate");
		
		
		ExportReportAction.exportReports(fileType,merid,createDate,function(mgs){
				alert(mgs);
		});
	} 
</script>
</@CommonQueryMacro.page>