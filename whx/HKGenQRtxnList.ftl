<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<@CommonQueryMacro.page title="交易信息列表">
<#include "/templets/ui18nAdd.ftl">
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.CommonQuery id="HKGenQRtxnList" init="false" submitMode="selected">
<table align="left"  width="100%">
		<tr>
			<td colspan="2">
				<#if v_country=="HK">
					<@CommonQueryMacro.Interface id="interface" fieldStr="tstartdate,tenddate,sstartdate,senddate,tmerId,ttxnId,tamount,tstatus,samount,tcurrency,sfpstxid,qsettlaccount" label="${COMMON_QUERY_SELECT}" colNm="4"/>
				<#else>
					<@CommonQueryMacro.Interface id="interface" fieldStr="tstartdate,tenddate,sstartdate,senddate,tmerId,ttxnId,tamount,tstatus,samount,tcurrency,sfpstxid" label="${COMMON_QUERY_SELECT}" colNm="4"/>
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
				<@CommonQueryMacro.DataTable id ="datatable"   fieldStr="txnid[150],workdate,fpsTxnTime,txndate,merid[150],mername,paytype,fpstxid[200],currency[150],amount[150],bamount[150],status[150],posseroalno,posstaffid,proxyid"  width="100%"   hasFrame="true"/>
			</td>
		</tr>
	</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">
	function initCallGetter_post(){
		HKGenQRtxnList_interface_dataset.setValue("tstartdate",new Date());
		HKGenQRtxnList_interface_dataset.setValue("tenddate",new Date());
		
	}
	
	
	function HKGenQRtxnList_interface_dataset_afterChange(dataset,field){
		var date="";					
		if(field.name=="tenddate"){
			var beginDate=dataset.getValue("tstartdate");
			
			var endDate=dataset.getValue("tenddate");
			if(endDate !== "" && beginDate !== "") {
					
  					var sDate = new Date(beginDate);
		    		var eDate = new Date(endDate);
		   
				if (eDate.getFullYear() - sDate.getFullYear() <= 1) {//先比较年
						
		    		 if (eDate.getMonth() - sDate.getMonth() == 1) {//再比较月
		    		 	
		    		  	 if (eDate.getDate() - sDate.getDate() >0 ) {
			    		  	 	alert("The time interval should not exceed one month")
			    		  	 
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("tenddate",date);
				            	return false;
			        		}else{
				        		 return true;
			        		}
			         }else if(eDate.getMonth() - sDate.getMonth() == 0){
			         	 if (eDate.getDate() - sDate.getDate() >=0 ) {
			         			 return true;
			    		  	 	
			        		}else{
				        		alert("The end date should be greater than the start date!")
				        		
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("tenddate",date);
				            	return false;
			        		}
				   		
			   		 } else if(eDate.getMonth() - sDate.getMonth() > 1){
			   		 			alert("The time interval should not exceed one month")
			   		 			
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("tenddate",date);
				            	return false;
			   		 }else if(eDate.getMonth() - sDate.getMonth() < 0){
			   		 			alert("The end date should be greater than the start date!")
			   		 			HKGenQRtxnList_interface_dataset.setValue("tenddate",date);
				            	return false;
			   		 }
			   		 
			    		
				        return false;
			   	 }else{
			   	 	alert("The time interval should not exceed one month")
			   	 	
			    	HKGenQRtxnList_interface_dataset.setValue("tenddate",date);
				   	return false;
			   		
			   	 }
			}
			
		}
		if(field.name=="tstartdate"){
			var beginDate=dataset.getValue("tstartdate");
			var endDate=dataset.getValue("tenddate");
			if(endDate !== "" && beginDate !== "") {
					
  					var sDate = new Date(beginDate);
		    		var eDate = new Date(endDate);
		   
				if (eDate.getFullYear() - sDate.getFullYear() <= 1) {//先比较年
						
		    		 if (eDate.getMonth() - sDate.getMonth() == 1) {//再比较月
		    		 	
		    		  	 if (eDate.getDate() - sDate.getDate() >0 ) {
			    		  	 	alert("The time interval should not exceed one month")
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("tstartdate",date);
			    		  	 	
				            	return false;
			        		}else{
				        		 return true;
			        		}
			         }else if(eDate.getMonth() - sDate.getMonth() == 0){
			         	 if (eDate.getDate() - sDate.getDate() >=0 ) {
			         			 return true;
			    		  	 	
			        		}else{
				        		alert("The end date should be greater than the start date!")
				        		HKGenQRtxnList_interface_dataset.setValue("tstartdate",date);
			    		  	 	
				            	return false;
			        		}
				   		
			   		 } else if(eDate.getMonth() - sDate.getMonth() > 1){
			   		 			alert("The time interval should not exceed one month")
			   		 			HKGenQRtxnList_interface_dataset.setValue("tstartdate",date);
			    		  	 	
				            	return false;
			   		 }else if(eDate.getMonth() - sDate.getMonth() < 0){
			   		 			alert("The end date should be greater than the start date!")
			   		 			HKGenQRtxnList_interface_dataset.setValue("tstartdate",date);
				            	return false;
			   		 }
			   		 
			    		
				        return false;
			   	 }else{
			   	 	alert("The time interval should not exceed one month")
			   	 	HKGenQRtxnList_interface_dataset.setValue("tstartdate",date);
			    	
				   	return false;
			   		
			   	 }
			}
			
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
			if(endDate !== "" && beginDate !== "") {
					
  					var sDate = new Date(beginDate);
		    		var eDate = new Date(endDate);
		   			
				if (eDate.getFullYear() - sDate.getFullYear() <= 1) {//先比较年
						
		    		 if (eDate.getMonth() - sDate.getMonth() == 1) {//再比较月
		    		 	
		    		  	 if (eDate.getDate() - sDate.getDate() >0 ) {
			    		  	 	alert("The time interval should not exceed one month")
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("sstartdate",date);
			    				
				            	return false;
			        		}else{
				        		 return true;
			        		}
			         }else if(eDate.getMonth() - sDate.getMonth() == 0){
			         	 if (eDate.getDate() - sDate.getDate() >=0 ) {
			         			 return true;
			    		  	 	
			        		}else{
				        		alert("The end date should be greater than the start date!")
				        		HKGenQRtxnList_interface_dataset.setValue("sstartdate",date);
			    		  	 	
				            	return false;
			        		}
				   		
			   		 } else if(eDate.getMonth() - sDate.getMonth() > 1){
			   		 			alert("The time interval should not exceed one month")
			   		 			HKGenQRtxnList_interface_dataset.setValue("sstartdate",date);
			    				
				            	return false;
			   		 }else if(eDate.getMonth() - sDate.getMonth() < 0){
			   		 			alert("The end date should be greater than the start date!")
			   		 			HKGenQRtxnList_interface_dataset.setValue("sstartdate",date);
				            	return false;
			   		 }
			   		 
			    		
				        return false;
			   	 }else{
			   	 	alert("The time interval should not exceed one month")
			   	 	HKGenQRtxnList_interface_dataset.setValue("sstartdate",date);
			    	
				   	return false;
			   		
			   	 }
			}
			
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
			if(endDate !== "" && beginDate !== "") {
				var sDate = new Date(beginDate);
			    var eDate = new Date(endDate);
		   		
				if (eDate.getFullYear() - sDate.getFullYear() <= 1) {//先比较年
						
		    		 if (eDate.getMonth() - sDate.getMonth() == 1) {//再比较月
		    		 	
		    		  	 if (eDate.getDate() - sDate.getDate() >0 ) {
			    		  	 	alert("The time interval should not exceed one month")
			    		  	 	
			    				HKGenQRtxnList_interface_dataset.setValue("senddate",date);
				            	return false;
			        		}else{
				        		 return true;
			        		}
			         }else if(eDate.getMonth() - sDate.getMonth() == 0){
			         	 if (eDate.getDate() - sDate.getDate() >=0 ) {
			         			 return true;
			    		  	 	
			        		}else{
				        		alert("The end date should be greater than the start date!")
				        		
			    		  	 	HKGenQRtxnList_interface_dataset.setValue("senddate",date);
				            	return false;
			        		}
				   		
			   		 } else if(eDate.getMonth() - sDate.getMonth() > 1){
			   		 			alert("The time interval should not exceed one month")
			   		 			
			    				HKGenQRtxnList_interface_dataset.setValue("senddate",date);
				            	return false;
			   		 }else if(eDate.getMonth() - sDate.getMonth() < 0){
			   		 			alert("The end date should be greater than the start date!")
			   		 			HKGenQRtxnList_interface_dataset.setValue("senddate",date);
				            	return false;
			   		 }
			   		 
			    		
				        return false;
			   	 }else{
			   	 	alert("The time interval should not exceed one month")
			   	 	
			    	HKGenQRtxnList_interface_dataset.setValue("senddate",date);
				   	return false;
			   		
			   	 }
			}
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
	


function flushPage(){
	McMerinfoSelectTwoList_dataset.flushData(1);
}
</script>
</@CommonQueryMacro.page>