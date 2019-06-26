<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<#assign v_isShowAggregator = statics["com.huateng.util.CommUtils"].getAggregatorIsNotNull()?default("Y")>
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.page title="商户审核详细信息">
<table align="left" width="100%">
    <tr align="center">
        <td width="100%" colspan="6">
		<@CommonQueryMacro.CommonQuery id="McMerinfoSelectTwoList" init="true" navigate="false"  submitMode="all">
                <FIELDSET name='guoup1' style="padding: 6px;">
                    <LEGEND extra="groupboxtitle">${McMerinfoDetail_Group_group1_label}</LEGEND>
                    <table frame=void class="grouptable" width="100%">
                        <tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.custid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="custid"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.country" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="country" /></td>
                        </tr>
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merid" /></td>
                         	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mername" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mername" /></td>
                        </tr>
                        <tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mertype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mertype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.supmerid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="supmerid"/></td>
                        </tr>
                        <#if v_isShowAggregator=="Y" && v_country!="MY">
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.aggregator" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="aggregator"/></td>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeetype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeetype"/></td>
                        </tr>
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeecycle" /></td>
                            <td class="datatd" width="35%" ><@CommonQueryMacro.SingleField fId="merfeecycle" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeedate" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeedate"/></td>
                        </tr>
                     	</#if>
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeecycle" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeecycle" /></td>
                            <#if v_isShowAggregator=="Y" && v_country!="MY">
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeedate" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeedate"/></td>
                           </#if>
                        </tr>
                         <tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meracct" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracct"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeeacct" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacct" /></td>
                        </tr>
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.acctcur" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="acctcur"/></td>
                        	 <#if v_country=="ID" || v_country=="TH">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.sharedkey" /></td>
	                            <td class="" width="35%"><@CommonQueryMacro.SingleField fId="sharedkey"/></td>
	                         <#else>
	                        	<td align="right" nowrap class="labeltd" width="15%"></td>
	                            <td class="datatd" width="35%"></td>
                            </#if>
                        </tr>
                        <tr>
                            <td align="right" nowrap class="labeltd" width="15%"></td>
                            <td class="datatd" width="35%"></td>
                        </tr>
                        <tr>
                            <#if v_country=="MY">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mysrptype" /></td>
	                            <td class="datatd1" width="35%"><@CommonQueryMacro.SingleField fId="mysrptype"/></td>
                        	<#else>
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rptype" /></td>
	                            <td class="datatd1" width="35%"><@CommonQueryMacro.SingleField fId="rptype"/></td>
                            </#if>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rpfmt" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rpfmt" /></td>
                        </tr>
                        <#if v_country!="MY">
	                        <#if v_country=="SG">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.dtltime" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="dtltime"/></td>
	                       	</#if>
	                         <tr>
	                        <#if v_isShowAggregator=="Y">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.dtltime" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="dtltime"/></td>
	                       	</#if>
	                            <td align="right" nowrap class="labeltd" width="15%"></td>
	                            <td class="datatd" width="35%"></td>
	                        </tr>
	                    </#if>
                       	<tr>
                       		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.deliverych" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="deliverych"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meremail" /></td>
                            <td class="" width="35%"><@CommonQueryMacro.SingleField fId="meremail"/></td>
                        </tr>
                        <tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbcnetid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbcnetid"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.connectid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="connectid" /></td>
                        </tr>
                        <#if v_country=="ID" || v_country=="TH">
	                        <tr>
	                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merchantkid" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merchantkid" /></td>
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbckid" /></td>
		                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbckid"/></td>
	                        </tr>
                        </#if>
                        <#if v_country=="ID">
	                        <tr>
	                        	<td align="right" nowrap class="labeltd" width="15%">VA Url
	                    			<span class="labeltd icon-helphsbc" title="It should be initiated by https">&nbsp;&nbsp;&nbsp;</span></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
	                            <td align="right" nowrap class="labeltd" width="15%"></td>
	                            <td class="datatd" width="35%"></td>
	                        </tr>
                        </#if>
                        <#if v_country=="HK"  || v_country=="MY">
	                        <tr>
	                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.remarks" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="remarks" /></td>
	                            <td align="right" class="labeltd" width="15%"></td>
	                            <td class="labeltd" width="35%"></td>
	                        </tr>
                        </#if> 	
                    </table>
                </FIELDSET>
             <#if v_country=="HK">
                <br/>
                 <FIELDSET name='guoup2' style="padding: 6px;" id="grouphk" >
                    <LEGEND extra="groupboxtitle">${McMerinfoDetail_Group_group1_label_HK}</LEGEND>
                    <table frame=void class="grouptable" width="100%">
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%" rowspan="4"><@message code="McMerinfoList.Field.channel" /></td>
                            <td class="datatd" width="35%" rowspan="4"><@CommonQueryMacro.SingleField fId="channel"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posid"/></td>
                        </tr> 
                    	<tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.paymeid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpid"/></td>
                            
                    	</tr>
                    	
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%">Expiry Date of Billing Profile ID for e/m-commerce</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceidexpirydate"/></td>
                            <td align="right" nowrap class="labeltd" width="15%">New Billing Profile ID for e/m-commerce</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceidnew"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%">Expiry Date of Billing Profile ID for POS</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posidexpirydate"/></td>
                            <td align="right" nowrap class="labeltd" width="15%">New Billing Profile ID for POS</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posidnew"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%">Expiry Date of Billing Profile ID for PayMe</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeidexpirydate"/></td>
                            <td align="right" nowrap class="labeltd" width="15%">New Billing Profile ID for PayMe</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeidnew"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%">Expiry Date of Billing Profile ID for Bill Payment</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpidexpirydate"/></td>
                            <td align="right" nowrap class="labeltd" width="15%">New Billing Profile ID for Bill Payment</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpidnew"/></td>
                    	</tr>
                    	
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posname"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.permnetid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="permnetid"/></td>
                    	</tr>
                    	<tr>
                    	    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.editableflag" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="editableflag"/></td>
                    		<!-- <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.permnetid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="permnetid"/></td> -->
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.debtorname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="debtorname"/></td> 
                    	</tr>
                    	<tr>
                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merchantkid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merchantkid" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbckid" /></td>
	                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbckid"/></td>
                        </tr>
                    </table>
                </FIELDSET>
              </#if>
              
              <#if v_country=="SG">
                <br/>
                 <FIELDSET name='guoup2' style="padding: 6px;" id="grouphk" >
                    <LEGEND extra="groupboxtitle">${McMerinfoDetail_Group_group1_label_SG}</LEGEND>
                    <table frame=void class="grouptable" width="100%">
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%" rowspan="3"><@message code="McMerinfoList.Field.channel" /></td>
                            <td class="datatd" width="35%" rowspan="3"><@CommonQueryMacro.SingleField fId="channelsg"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posid"/></td>
                        </tr> 
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpid"/></td>                           
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posname"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                    	</tr>
                    	<tr>         		
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.regincr" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="regincr"/></td>
                    	</tr>
                    	<tr>
                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merchantkid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merchantkid" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbckid" /></td>
	                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbckid"/></td>
                        </tr>
                    </table>
                </FIELDSET>
              </#if>
              
              <#if v_country=="MY">
                <br/>
                 <FIELDSET name='guoup2' style="padding: 6px;" id="grouphk" >
                    <LEGEND extra="groupboxtitle">${McMerinfoDetail_Group_group1_label_MY}</LEGEND>
                    <table frame=void class="grouptable" width="100%">
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.myschannel" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="myschannel"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.fundSrc" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="fundSrc"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.qrId" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="qrId"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.category" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="category"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"></td>
                            <td class="datatd" width="35%"></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.qrtype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="qrtype"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.debtorname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="debtorname"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posname"/></td>
                    		<!-- <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.permnetid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="permnetid"/></td> -->
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpacct" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpacct"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" />
                    			<span class="labeltd icon-helphsbc" title="It should be initiated by https">&nbsp;&nbsp;&nbsp;</span></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"></td>
                        	<td class="datatd" width="35%"></td>
                    	</tr>
                    	<tr>
                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rrn" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rrn" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rrn2" /></td>
	                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rrn2"/></td>
                        </tr>
                    	<tr>
                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merchantkid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merchantkid" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbckid" /></td>
	                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbckid"/></td>
                        </tr>
                    </table>
                </FIELDSET>
              </#if>      
            </@CommonQueryMacro.CommonQuery>
        </td>
</table>
<@CommonQueryMacro.CommonQuery id="McFeerateSelQueryList" init="true" submitMode="selected" navigate="false">
<table>
<#if v_country!="HK"&&v_country!="SG">
	<tr>
	<td width="45%" valign="top">
            <table width="100%">
                <tr>
                    <td width="100%">
					<br/>
                    <FIELDSET name='guoup4' style="padding: 6px;">
                        <LEGEND extra="groupboxtitle"><@message code="McMerinfoDetail.groupboxtitle2"/></LEGEND>
                        <table frame=void width="100%">
                            <tr>
                                <td valign="top">
                                    <@CommonQueryMacro.DataTable id ="datatable2"  fieldStr="feetype,orgid,country,paytype,feemode,feerate" height="350" width="100%" pagination="false" readonly="false"/>
                                </td>
                            </tr>
                        </table>
                    </FIELDSET>
                    </td>
                </tr>
            </table>  
    	</td>
    </tr>
    </#if>
    <tr>
		<td align="left">
			<@CommonQueryMacro.Button id= "btBack"/>
		</td>
	</tr>
</table>
 </@CommonQueryMacro.CommonQuery>
<script language="javascript">
var brno = "${v_brno}";
var v_country = "${v_country}";
var isShowAggregator = "${v_isShowAggregator}";
var op = "${v_op}";
function initCallGetter_post(){
	if(op=="detail"){
		McMerinfoSelectTwoList_dataset.setReadOnly(true);		
	}
	McMerinfoSelectTwoList_dataset.setFieldReadOnly("merid",true);
	McMerinfoSelectTwoList_dataset.setFieldRequired("merid",true);
	
	McMerinfoSelectTwoList_dataset.setFieldReadOnly("meracct",true);
	McMerinfoSelectTwoList_dataset.setFieldRequired("meracct",true);
	
	McMerinfoSelectTwoList_dataset.setFieldReadOnly("merfeeacct",true);
	McMerinfoSelectTwoList_dataset.setFieldRequired("merfeeacct",true);
	
	McMerinfoSelectTwoList_dataset.setFieldReadOnly("acctcur",true);
	McMerinfoSelectTwoList_dataset.setFieldRequired("acctcur",true);
		
	McMerinfoSelectTwoList_dataset.setFieldReadOnly("mername",true);
	McMerinfoSelectTwoList_dataset.setFieldRequired("mername",true);
	if(v_country == "MY"){
		McMerinfoSelectTwoList_dataset.setFieldRequired("meracct",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("rptype",false);
		McMerinfoSelectTwoList_dataset.setFieldRequired("debtorname",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("mysrptype",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("posname",false);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merid",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("acctcur",true);
		McMerinfoSelectTwoList_dataset.setValue("acctcur","MYR");
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeecycle",false);
	}
	if(v_country == "HK"){
		hideCheckBox("rptype",["03","04"]);
		McMerinfoSelectTwoList_dataset.getValue("rptype");
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("channel",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeecycle",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("debtorname",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("debtorname",true);
	}
	if(v_country == "SG"){
		hideCheckBox("rptype",["02","03","04","05"]);
		McMerinfoSelectTwoList_dataset.getValue("rptype");
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("channelsg",true);
		
		McMerinfoSelectTwoList_dataset.getValue("proxytype");
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxytype",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("proxytype",true);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxyid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("proxyid",true);	
		McMerinfoSelectTwoList_dataset.setFieldRequired("regincr",true);		
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merurl",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merurl",true);
	}
	
	if(v_country == "HK" || v_country == "SG"){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merid",true);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("meracct",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("meracct",true);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merfeeacct",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merfeeacct",true);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("acctcur",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("acctcur",true);
	}
	if(v_country == "ID" || v_country == "TH"){
		hideCheckBox("rptype",["05"]);		
		if(isShowAggregator == 'Y'){
			McMerinfoSelectTwoList_dataset.setFieldRequired("merfeetype",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("merfeecycle",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("aggregator",true);		
		}
	}
	var merfeecycle = McMerinfoSelectTwoList_dataset.getValue("merfeecycle");
	if(merfeecycle=="2"){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merfeedate",true);	
			
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeedate",true);	
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("merfeedate",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeedate",false);
	}		
	var deliverych = McMerinfoSelectTwoList_dataset.getValue("deliverych");
	if(deliverych.indexOf("RFD")!=-1){
		McMerinfoSelectTwoList_dataset.setFieldRequired("hsbcnetid",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldRequired("hsbcnetid",false);
	}
	if(deliverych.indexOf("H2H")!=-1){
		McMerinfoSelectTwoList_dataset.setFieldRequired("hsbcnetid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("connectid",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldRequired("connectid",false);
	}
	if(deliverych.indexOf("Email")!=-1){
		McMerinfoSelectTwoList_dataset.setFieldRequired("meremail",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldRequired("meremail",false);
	}
		
	var chlfeecycle = McMerinfoSelectTwoList_dataset.getValue("chlfeecycle");
	if(chlfeecycle=="2"){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoSelectTwoList_dataset.setValue("chlfeedate","");
	}

	var mertype = McMerinfoSelectTwoList_dataset.getValue("mertype");
	if(mertype=="2"){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("supmerid",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("supmerid",false);
	}
	var channel = McMerinfoSelectTwoList_dataset.getValue("channel");
	if(v_country=="HK"){
		if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("3")!=-1){
			McMerinfoSelectTwoList_dataset.setFieldRequired("proxytype",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("proxyid",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxyid",true);
		}else{
			McMerinfoSelectTwoList_dataset.setFieldRequired("proxytype",false);
			McMerinfoSelectTwoList_dataset.setFieldRequired("proxyid",false);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("proxyid",true);
		}
		if(channel.indexOf("2")!=-1){
			McMerinfoSelectTwoList_dataset.setFieldRequired("permnetid",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("permnetid",false);
		}else{
			McMerinfoSelectTwoList_dataset.setFieldRequired("permnetid",false);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("permnetid",true);
		}
	}
	if(channel.indexOf("1")!=-1){
		if(v_country=="SG"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("commerceid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("commerceid",false);
		}else{
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("commerceid",false);
			McMerinfoSelectTwoList_dataset.setFieldRequired("commerceid",true);
		}
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("commerceid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("commerceid",false);
	}
	if(channel.indexOf("2")!=-1){
		if(v_country=="HK"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("permnetid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("permnetid",true);
		}
		if(v_country=="SG"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("posid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("posid",false);
		}else{
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("posid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("posid",true);
		}
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("posname",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("posname",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("permnetid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("permnetid",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("posid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("posid",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("posname",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("posname",false);
		
	}
	if(channel.indexOf("3")!=-1){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("paymeid",true);
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("paymeid",false);
		
	}
	if(channel.indexOf("4")!=-1){
		if(v_country=="SG"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("billpid",false);
		}else{
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("billpid",true);
			
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("merurl",true);
		}
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpmode",true);
		
		if(v_country=="HK"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxytype",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("billpproxytype",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxyid",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("billpproxyid",true);
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpacct",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("billpacct",true);
		}
	}else{
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpid",false);
		if(v_country !="SG"){
			McMerinfoSelectTwoList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoSelectTwoList_dataset.setFieldRequired("merurl",false);
		}		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpmode",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpproxytype",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpproxyid",false);
		
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpacct",true);
		McMerinfoSelectTwoList_dataset.setFieldRequired("billpacct",false);
	}
	var billpid = McMerinfoSelectTwoList_dataset.getValue("billpid");
	if(billpid==""){
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoSelectTwoList_dataset.setFieldReadOnly("billpacct",true);
	}
	
}
function btBack_onClick(button) {
	 closeWin();
}
</script>
</@CommonQueryMacro.page>