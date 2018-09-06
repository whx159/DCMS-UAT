<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<#assign v_isShowBtn = statics["com.huateng.util.CommUtils"].getProductionEnv()?default("Y")>
<@CommonQueryMacro.page title="手工生成报表">
<@CommonQueryMacro.CommonQuery id="ReportFile" init="false" submitMode="selected">
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<script type='text/javascript' src='${contextPath}/dwr/interface/ExportReportAction.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
<table align="center"  width="100%">
		<tr>
			<td>
				<#if (v_brno?substring(0,2)=="HK")>
					<@CommonQueryMacro.Group id="group1" label="${Report_Manual_Generation}" fieldStr="hkfiletype,type,merid,createdate,enddate" colNm="2"/>
				</#if>
				<#if (v_brno?substring(0,2)!="HK")>
					<#if (v_brno?substring(0,2) ="SG")>
					<@CommonQueryMacro.Group id="group1" label="${Report_Manual_Generation}" fieldStr="sgfiletype,type,merid,createdate1" colNm="1"/>
					<#else>
					<@CommonQueryMacro.Group id="group1" label="${Report_Manual_Generation}" fieldStr="filetype,type,merid,createdate1" colNm="1"/>
					</#if>
				</#if>
			</td>
		</tr>
		<tr>
		<#if v_isShowBtn=="Y">
			<td colspan="1" align="center">
				<@CommonQueryMacro.Button id= "btAdd"/>&nbsp;&nbsp;			
				<div style="display:none">
				<@CommonQueryMacro.Button id= "btSend"/>&nbsp;&nbsp;
                </div>
			</td>
		<#else>
		<td colspan="1" align="center">
				<@CommonQueryMacro.Button id= "btAdd"/>&nbsp;&nbsp;
				<@CommonQueryMacro.Button id= "btSend"/>&nbsp;&nbsp;
			</td>
		</#if>
		</tr>
	</table>
	
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var brno = "${v_brno}";
	var path = "${contextPath}";
    //下拉事件触发
    function hkfiletype_DropDown_onSelect(dropdown,record,editor){
    	filetype_DropDown_onSelect(dropdown,record,editor);
    	return true;
    }
    function sgfiletype_DropDown_onSelect(dropdown,record,editor){
    	filetype_DropDown_onSelect(dropdown,record,editor);
    	return true;
    }
    function filetype_DropDown_onSelect(dropdown,record,editor){
    	var fileType = record.getValue("data");
    	if(fileType == "05"){
    		ReportFile_dataset.setFieldReadOnly("merid",true);
    		ReportFile_dataset.setFieldRequired("merid",false);
    		ReportFile_dataset.setFieldReadOnly("createdate1",true);
    		ReportFile_dataset.setFieldRequired("createdate1",false);
    		ReportFile_dataset.setFieldReadOnly("createdate",true);
    		ReportFile_dataset.setFieldRequired("createdate",false);
    		ReportFile_dataset.setFieldReadOnly("enddate",true);
    		ReportFile_dataset.setFieldRequired("enddate",false);
    		ReportFile_dataset.setValue("merid","");
    		ReportFile_dataset.setValue("createdate1","");
    		ReportFile_dataset.setValue("createdate","");
    		ReportFile_dataset.setValue("enddate","");
    		ReportFile_dataset.setValue("type","XLS");
    		ReportFile_dataset.setFieldReadOnly("type",true);
		}else if(fileType == "03"){
			ReportFile_dataset.setFieldReadOnly("merid",false);
    		ReportFile_dataset.setFieldRequired("merid",true);
    		ReportFile_dataset.setValue("type","");
    		ReportFile_dataset.setFieldReadOnly("type",false);
    		ReportFile_dataset.setFieldReadOnly("createdate1",false);
    		ReportFile_dataset.setFieldRequired("createdate1",true);
    		ReportFile_dataset.setFieldReadOnly("createdate",false);
    		ReportFile_dataset.setFieldRequired("createdate",true);
    		ReportFile_dataset.setFieldRequired("enddate",true);
		}else if(fileType == "02" || fileType == "08"){
    		ReportFile_dataset.setFieldReadOnly("merid",false);
    		ReportFile_dataset.setFieldRequired("merid",true);
    		ReportFile_dataset.setValue("type","");
    		ReportFile_dataset.setFieldReadOnly("type",false);
    		ReportFile_dataset.setFieldReadOnly("createdate1",false);
    		ReportFile_dataset.setFieldRequired("createdate1",true);
    		ReportFile_dataset.setFieldReadOnly("createdate",false);
    		ReportFile_dataset.setFieldRequired("createdate",true);
    		ReportFile_dataset.setFieldReadOnly("enddate",false);
    		ReportFile_dataset.setFieldRequired("enddate",true);
		}else if(fileType == "01"){
			ReportFile_dataset.setFieldReadOnly("merid",false);
			if(brno == "HKHBAP"){
    			ReportFile_dataset.setFieldRequired("merid",false);
			}else {
				ReportFile_dataset.setFieldRequired("merid",true);
			}
    		ReportFile_dataset.setValue("type","");
    		ReportFile_dataset.setFieldReadOnly("type",false);
    		ReportFile_dataset.setFieldReadOnly("createdate1",false);
    		ReportFile_dataset.setFieldRequired("createdate1",true);
    		ReportFile_dataset.setFieldReadOnly("createdate",false);
    		ReportFile_dataset.setFieldRequired("createdate",true);
    		ReportFile_dataset.setFieldReadOnly("enddate",false);
    		ReportFile_dataset.setFieldRequired("enddate",true);
		}else if(fileType == "06" || fileType == "07"){
			ReportFile_dataset.setFieldReadOnly("merid",true);
    		ReportFile_dataset.setFieldRequired("merid",false);
    		ReportFile_dataset.setValue("merid","");
    		ReportFile_dataset.setValue("type","");
    		ReportFile_dataset.setFieldReadOnly("type",false);
    		ReportFile_dataset.setFieldReadOnly("createdate1",false);
    		ReportFile_dataset.setFieldRequired("createdate1",true);
    		ReportFile_dataset.setFieldReadOnly("createdate",false);
    		ReportFile_dataset.setFieldRequired("createdate",true);
    		ReportFile_dataset.setFieldReadOnly("enddate",true);
    		ReportFile_dataset.setValue("enddate","");
		}
    	return true;
    }
    
	
	function btAdd_onClick() {
		var flag = "";
		var flag2 = true;
		var dateFlag = true;
		var fileType=ReportFile_dataset.getValue("filetype");
		if(fileType == ""){
			var fileType = ReportFile_dataset.getValue("hkfiletype");
		}
		if(fileType == ""){
			var fileType = ReportFile_dataset.getValue("sgfiletype");
		}
		var type=ReportFile_dataset.getValue("type");
		var merid=ReportFile_dataset.getValue("merid");
		var createDate=ReportFile_dataset.getValue("createdate");
		if(brno != "HKHBAP"){
			var createDate = ReportFile_dataset.getValue("createdate1");
		}
		var endDate=ReportFile_dataset.getValue("enddate");
		if(fileType == ""){
			alert("Report Type is empty!");
			return;
		}else if(type == ""){
			alert("File Type is empty!");
			return;
		}
		
		if(brno == "HKHBAP"){
			if(fileType == "01" || fileType == "02" || fileType == "08"){
				if(createDate == "" || endDate == ""){
					alert("Date is empty!");
					return;
				}
			}
			if(fileType == "07"){
				if(createDate == ""){
					alert("Date is empty!");
					return;
				}
			}
			if(fileType == "02" || fileType == "08"){
				if(merid == ""){
					alert("Merchant ID is empty!");
					return;
				}
			}
		}else{
			if(fileType == "01" || fileType == "02" || fileType == "03"){
				if(merid == ""){
					alert("Merchant ID is empty!");
					return;
				}
				if(createDate == ""){
					alert("Date is empty!");
					return;
				}
			}
			if(fileType == "06" || fileType == "07" ){
				if(createDate == ""){
					alert("Date is empty!");
					return;
				}
			}
		}
		//对merid进行校验是否存在
		if(merid != ""){
			dwr.engine.setAsync(false);
			CheckAction.checkMerID(merid,fileType,createDate,function(data){
				if(data != "Exists"){
					alert(data);
					dateFlag = false;
					return dateFlag;
				}
			});
			if(dateFlag == false){
				return dateFlag;
			}
		}
		//对导出日期进行判断 例如：只能导出两年内的报表
		if(createDate != ""){
		dwr.engine.setAsync(false);
			CheckAction.checkReportDate(createDate,function(data){
				if(data != "success"){
					alert(data);
					flag2 = false;
					return flag2;
				}
			});
			if(flag2 == false){
				return flag2;
			}
		}
		
		dwr.engine.setAsync(false);
		ExportReportAction.exportReports(fileType,type,merid,createDate,endDate,function(data){
				flag = data;
		});
		dwr.engine.setAsync(true);
		
		if(flag=="Success"){
			alert("Success");
		}else{
			alert("Failed");
		}
	} 
	function btSend_onClick() {
		var fileType=ReportFile_dataset.getValue("filetype");
		if(fileType == ""){
		 	fileType=ReportFile_dataset.getValue("hkfiletype");
		}
		if(fileType == ""){
		 	fileType=ReportFile_dataset.getValue("sgfiletype");
		}
		var type=ReportFile_dataset.getValue("type");
		var merid=ReportFile_dataset.getValue("merid");
		var createDate=ReportFile_dataset.getValue("createdate");
		var endDate=ReportFile_dataset.getValue("enddate");
		if(brno != "HKHBAP"){
			var createDate = ReportFile_dataset.getValue("createdate1");
		}
		dwr.engine.setAsync(false);
		ExportReportAction.sendEmail(fileType,type,merid,createDate,endDate,function(data){
			alert(data);
		});
		dwr.engine.setAsync(true);
	}
	function btSendMq_onClick() {
		dwr.engine.setAsync(false);
		ExportReportAction.sendMq(function(data){
			alert(data);
		});
		dwr.engine.setAsync(true);
	}
	
	function btEmailRecon_onClick(){
		dwr.engine.setAsync(false);
		ExportReportAction.emaliRecon(function(data){
			alert(data);
		});
		dwr.engine.setAsync(true);
	}
	
</script>
</@CommonQueryMacro.page>