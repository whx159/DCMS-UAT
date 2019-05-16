<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="交易信息列表">
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.CommonQuery id="HKGenQRtxnList" init="false" submitMode="selected">
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<#if v_country=="HK">
					<tr>
						 <td align="right" nowrap class="labeltd" width="15%"><@message code="HKGenQRtxn.Where.TextBox.trantype" /></td>
	                     <td class="labeltd" width="35%"><@CommonQueryMacro.SingleField fId="trantype"/></td>
					</tr>
					<tr>
						 <@CommonQueryMacro.Interface id="interface" fieldStr="tstartdate,tenddate,sstartdate,senddate,tmerId,ttxnId,tamount,tstatus,samount,tcurrency,sfpstxid,qsettlaccount" label="${COMMON_QUERY_SELECT}" showButton="true" colNm="4"/>
					</tr>
				<#else>
					<@CommonQueryMacro.Interface id="interface" fieldStr="tstartdate,tenddate,sstartdate,senddate,tmerId,ttxnId,tamount,tstatus,samount,tcurrency,sfpstxid" label="${COMMON_QUERY_SELECT}" colNm="4"/>
				</#if>
			</td>
		</tr>
		<tr>
			<!-- <td><@CommonQueryMacro.InterfaceButton desc="btQuery" /></td> -->
			<td valign="top">
				<@CommonQueryMacro.PagePilot id="pagequery" maxpagelink="10" showArrow="true" />
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<@CommonQueryMacro.DataTable id ="datatable"   fieldStr="txnid[150],workdate,txntime,txndate,fpsTxnTime,merid[150],mername,paytype,fpstxid[200],currency[150],amount[150],bamount[150],status[150],amtrefunded,amtpendingrefund,amtrejectedrefund,posseroalno,posstaffid,proxyid"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	var refunded_html = $("#l_WebSite_amtrefunded").html();
	var pendrefund_html = $("#l_WebSite_amtpendingrefund").html();
	var rejectrefund_html = $("#l_WebSite_amtrejectedrefund").html();
	var html = refunded_html + pendrefund_html + rejectrefund_html;
	var count = 0;
	//$("#l_WebSite_amtrefunded").remove();
	//$("#l_WebSite_amtpendingrefund").remove();
	//$("#l_WebSite_amtrejectedrefund").remove();
	function initCallGetter_post(){
		//$('.exp-mulselect').append(html);
		HKGenQRtxnList_interface_dataset.setValue("tstartdate",new Date());
		HKGenQRtxnList_interface_dataset.setValue("tenddate",new Date());
		HKGenQRtxnList_interface_dataset.setValue("trantype","01");	
		HKGenQRtxnList_dataset.setValue("trantype","01");
	}
	function setInitValue(ts){
		if(ts == 1){
			HKGenQRtxnList_interface_dataset.setValue("tstartdate","");
			HKGenQRtxnList_interface_dataset.setValue("tenddate","");
		}else{
			HKGenQRtxnList_interface_dataset.setValue("sstartdate","");
			HKGenQRtxnList_interface_dataset.setValue("senddate","");
		}
	}
	function comparedate(beginDate,endDate,ts){
		if(endDate !== "" && beginDate !== "") {
			var sDate = new Date(beginDate);
    		var eDate = new Date(endDate);
    		dwr.engine.setAsync(false);
			CheckAction.compareDate(sDate,eDate,function(data){
					if(data == 1){
						alert("The time interval should not exceed one month");
						setInitValue(ts);
					}else if(data == 2){
						alert("The end date should be greater than the start date!");
						setInitValue(ts);
					}
			});
			dwr.engine.setAsync(true);
		}
	}
	function HKGenQRtxnList_interface_dataset_afterChange(dataset,field){
		var date="";
		if(field.name=="trantype"){	
			//动态添加删除导出报表的列
			var trantype  = dataset.getValue("trantype");
			if("01" == trantype && count == -1){
				$('.exp-mulselect').append(html);
				count = count + 1;
			}else if("02" == trantype && count == 0){
				$("#l_WebSite_amtrefunded").remove();
				$("#l_WebSite_amtpendingrefund").remove();
				$("#l_WebSite_amtrejectedrefund").remove();
				count = count -1;
			}
		}
		if(field.name=="tenddate"){
			var beginDate=dataset.getValue("tstartdate");
			var endDate=dataset.getValue("tenddate");
			comparedate(beginDate,endDate,1);//1代表交易查询
			
		}
		if(field.name=="tstartdate"){
			var beginDate=dataset.getValue("tstartdate");
			var endDate=dataset.getValue("tenddate");
			comparedate(beginDate,endDate,1);
		}
		if(field.name=="sstartdate"){
			var beginDate=dataset.getValue("sstartdate");
			var endDate=dataset.getValue("senddate");
			var samount = dataset.getValue("samount");
			var sfpstxid= dataset.getValue("sfpstxid");
			var status=HKGenQRtxnList_interface_dataset.getValue("tstatus");
			var value1="PAID";
			if(beginDate !=""){
				HKGenQRtxnList_interface_dataset.setValue("tstatus",value1);
				HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",true);
			}else if(samount =="" && sfpstxid=="" && beginDate=="" && endDate==""){
				HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",false);
			}
			comparedate(beginDate,endDate,2);//2代表结算日期
		}
		if(field.name=="senddate"){
			var beginDate=dataset.getValue("sstartdate");
			var endDate=dataset.getValue("senddate");
			var samount = dataset.getValue("samount");
			var sfpstxid= dataset.getValue("sfpstxid");
			var status=HKGenQRtxnList_interface_dataset.getValue("tstatus");
			var value1="PAID";
			if(endDate !=""){
				HKGenQRtxnList_interface_dataset.setValue("tstatus",value1);
				HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",true);
			}else if(samount =="" && sfpstxid=="" && beginDate=="" && endDate==""){
				HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",false);
			}
			comparedate(beginDate,endDate,2);
		}
			
		if(field.name=="samount"){
				var sstartdate=dataset.getValue("sstartdate");
				var senddate=dataset.getValue("senddate"); 
				var samount = dataset.getValue("samount");
				var sfpstxid= dataset.getValue("sfpstxid"); 
				if(samount!=""){
					HKGenQRtxnList_interface_dataset.setValue("tstatus","PAID");
					HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",true);
				}else if(samount =="" && sfpstxid=="" && sstartdate=="" && senddate==""){
					HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",false);
				}
		}
		if(field.name=="sfpstxid"){
				var sstartdate=dataset.getValue("sstartdate");
				var senddate=dataset.getValue("senddate"); 
				var samount = dataset.getValue("samount");
				var sfpstxid= dataset.getValue("sfpstxid"); 
				if(sfpstxid!=""){
					HKGenQRtxnList_interface_dataset.setValue("tstatus","PAID");
					HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",true);
				}else if(samount =="" && sfpstxid=="" && sstartdate=="" && senddate==""){
					HKGenQRtxnList_interface_dataset.setFieldReadOnly("tstatus",false);
				}
		}
		
	}
	
	function HKGenQRtxnList_interface_dataset_btnSubmit_onClickCheck(button){
		var trantype = HKGenQRtxnList_dataset.getValue("trantype");
		HKGenQRtxnList_interface_dataset.setValue("trantype",trantype);
	}
	function flushPage(){
		McMerinfoSelectTwoList_dataset.flushData(1);
	}
	function datatable_amtrefunded_onRefresh(cell,value,record) {
		if (record) {
			var fpstxid = record.getValue("fpstxid");
			var amtrefunded = record.getValue("amtrefunded");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+fpstxid+"','SUCCESS')\">" + amtrefunded + "</a>";
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function datatable_amtpendingrefund_onRefresh(cell,value,record) {
		if (record) {
			var fpstxid = record.getValue("fpstxid");
			var amtpendingrefund = record.getValue("amtpendingrefund");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+fpstxid+"','PENDING')\">" + amtpendingrefund + "</a>";
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function datatable_amtrejectedrefund_onRefresh(cell,value,record) {
		if (record) {
			var fpstxid = record.getValue("fpstxid");
			var amtrejectedrefund = record.getValue("amtrejectedrefund");
			cell.innerHTML = "<a style='text-decoration:none' href=\"JavaScript:doDetail('"+fpstxid+"','REJECTED')\">" + amtrejectedrefund + "</a>";
		} else {
			cell.innerHTML="&nbsp;";
		}
	}
	function doDetail(fpstxid,flag){
		var record = HKGenQRtxnList_dataset.find(["fpstxid"], [fpstxid]);
	    if (record) {
	        HKGenQRtxnList_dataset.setRecord(record);
	    }
	    var txnid = record.getValue("txnid");
		var merid = record.getValue("merid");
		showWin("Refund Detail","/fpages/hsbc/ftl/RefundDetail.ftl?fpstxid=" + fpstxid + "&txnid=" +txnid+"&merid="+merid+"&flag="+flag,"window","flushPage()",window);
	}

</script>
</@CommonQueryMacro.page>