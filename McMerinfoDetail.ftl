<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<#assign v_isShowAggregator = statics["com.huateng.util.CommUtils"].getAggregatorIsNotNull()?default("Y")>
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<#assign approvalflag = RequestParameters["approvelflag"]?default("1")>
<@CommonQueryMacro.page title="商户详细信息">
<table align="left" width="100%">
    <tr align="center">
        <td width="100%" colspan="6">
		<@CommonQueryMacro.CommonQuery id="McMerinfoList" init="true" navigate="false"  submitMode="all">
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
                        <#if v_country=="ID">
                           <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meridid" /></td>
                         <#else>
                         	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merid" /></td>
                         </#if>
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
                         <#if v_country=="SG">
                            <td style="display:none" align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeecycle" /></td>
                            <td style="display:none" class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeecycle" /></td>
                         <#else>
                         	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeecycle" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeecycle" /></td>
                         </#if>
                           <#if v_isShowAggregator=="Y" && v_country!="MY">
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeedate" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeedate"/></td>
                           </#if>
                        </tr>
                        
                         <tr>
                         <#if v_country=="SG">
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meracct" /></td>
                         <#else>
                         	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meracct" />
                            	<span class="labeltd icon-helphsbc" title="12 digits [3-6-3] (HUB account number)">&nbsp;&nbsp;&nbsp;</span>
                            </td>
                         </#if>
                         
                         <#if v_country=="SG">
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracctsg"/></td>
                         <#elseif v_country=="ID" || v_country=="TH" || v_country=="CN" || v_country=="VN">
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracctmq"/></td>
                         <#else>
                         	<td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracct"/></td>
                         </#if>
                         
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeeacct" /></td>
                         
                         <#if v_country=="SG">
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacctsg" /></td>
                         <#elseif v_country=="ID" || v_country=="TH" || v_country=="CN" || v_country=="VN">
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacctmq"/></td>
                         <#else>
                         	<td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacct" /></td>
                         </#if>
                        </tr>
                        <tr>
                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.acctcur" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="acctcur"/></td>
                            <#if v_country=="ID" || v_country=="TH" || v_country=="VN">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.sharedkey" /></td>
	                            <td class=""  style= "table-layout:fixed;word-break:break-all" width="35%"><@CommonQueryMacro.SingleField fId="sharedkey"/></td>
	                         <#else>
		                         <td align="right" nowrap class="labeltd" width="15%"></td>
		                        <td class="datatd" width="35%"></td>
                            </#if>
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
	                        <tr>
	                        <#if v_country=="SG">
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.dtltime" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="dtltime"/></td>
	                       	</#if>
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
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meremail" /> 
                            	<span class="labeltd icon-helphsbc" title="Please use &quot;;&quot; as separator e.g. david.wong@hsbc.com; Ella.lee@hsbc.com">&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td class="" width="35%"><@CommonQueryMacro.SingleField fId="meremail"/></td>
                        </tr>
                        <tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbcnetid" />
                            	<span class="labeltd icon-helphsbc" title="Max 18 characters [2-4-12]">&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbcnetid"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.connectid" />
                            	<span class="labeltd icon-helphsbc" title=" 11 characters [3-5-3] (Connect ABC ID setup in CAD)">&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="connectid" /></td>
                        </tr>
                       <#if v_country=="ID">
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
	                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.kid_url" /></td>
	                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="kid_url"/></td>
	                        </tr>
                        </#if>
                        <#if v_country=="HK" || v_country=="MY">
	                        <tr>
	                        	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.remarks" /></td>
	                            <td class="" width="35%"><@CommonQueryMacro.SingleField fId="remarks" /></td>
	                            <td align="right" class="labeltd" width="15%"></td>
	                            <td class="labeltd" width="35%"></td>
	                        </tr>
                        </#if>
                        <tr>
							<td colspan="2">
							<@CommonQueryMacro.FloatWindow id="floatWindowTime" label="" width="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
							<div align="center">
								<@CommonQueryMacro.Group id="group2" label="${Common_addTime}" fieldStr="{texthour[20]|'${Common_hour}'|textminute[20]|'${Common_minute}'}" colNm=2/>
						  		<br />
								<@CommonQueryMacro.Button id= "btConfirm"/>
								<@CommonQueryMacro.Button id= "btCancel"/>
							</div>
							</@CommonQueryMacro.FloatWindow>
							</td>
						</tr>
						<tr>
							<td colspan="2">
							<@CommonQueryMacro.FloatWindow id="floatWindowCur" label="" width="300" resize="true" defaultZoom="normal" minimize="false" maximize="false" closure="true" float="true" exclusive="true" position="center" show="false" >
							<div align="center">
								<@CommonQueryMacro.Group id="group2" label="${Common_addTime}" fieldStr="{texthour[20]|'${Common_hour}'|textminute[20]|'${Common_minute}'}" colNm=2/>
						  		<br />
								<@CommonQueryMacro.Button id= "btConfirm"/>
								<@CommonQueryMacro.Button id= "btCancel"/>
							</div>
							</@CommonQueryMacro.FloatWindow>
							</td>
						</tr>	
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
                    		<td align="right" nowrap class="labeltd" width="15%" rowspan="4"><@message code="McMerinfoList.Field.channel" /></td>
                            <td class="datatd" width="35%" rowspan="4"><@CommonQueryMacro.SingleField fId="channel"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posid"/></td>
                        </tr> 
                    	<tr>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.paymeid" />
                            	<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                            </td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
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
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posnamehk"/></td>
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
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" />
                    			<span class="labeltd icon-helphsbc" title="It should be initiated by https">&nbsp;&nbsp;&nbsp;</span></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpacct" /></td>
                        	<td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpacct"/></td>
                    	</tr>
                    	<tr>
                           	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merchantkid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merchantkid" /></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbckid" /></td>
	                        <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbckid"/></td>
                        </tr>
                        <tr>
	                        <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.kid_url" /></td>
		                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="kid_url"/></td>
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
                    		<td align="right" nowrap class="labeltd" width="15%" rowspan="3"><@message code="McMerinfoList.Field.channel" /></td>
                            <td class="datatd" width="35%" rowspan="3"><@CommonQueryMacro.SingleField fId="channelsg"/></td>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posid"/></td>
                        </tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpid" />
                    			<span class="labeltd icon-helphsbc" title="Billing profile ID e.g. A01B01 for two billing combination">&nbsp;&nbsp;&nbsp;</span>
                    		</td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpid"/></td>
                            
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                            <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                    	</tr>
                    	<tr>
                    		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.posname" /></td>
                            <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="posnamesg"/></td>
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
                        <tr>
	                        <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.kid_url" /></td>
		                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="kid_url"/></td>
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
                        <tr>
	                        <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.kid_url" /></td>
		                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="kid_url"/></td>
                        </tr>
                    </table>
                </FIELDSET>
              </#if>
                    
            </@CommonQueryMacro.CommonQuery>
        </td>
</table>
<table>
<!-- McFeerate -->
	<#if v_isShowAggregator=="Y">
	 <tr >
        <td width="45%" valign="top">
            <@CommonQueryMacro.CommonQuery id="McFeerateUnSelList" init="true" submitMode="selected" navigate="false">
                <table width="100%">
                    <tr>
                        <td width="100%">
						<br/>
                            <FIELDSET name='guoup3' style="padding: 6px;">
                                <LEGEND extra="groupboxtitle"><@message code="McMerinfoDetail.groupboxtitle1"/></LEGEND>
                                <table frame=void width="100%">
                                    <tr>
                                        <td valign="top">
                                            <@CommonQueryMacro.DataTable id ="datatable1"  fieldStr="feetype,orgid,country,paytype,feemode,feerate" height="350" width="100%" readonly="true" pagination="false"/>
                                        </td>
                                    </tr>
                                </table>
                            </FIELDSET>
                        </td>
                    </tr>
                </table>
            </@CommonQueryMacro.CommonQuery>
        </td>
        <td width="10%" valign="top">
        <@CommonQueryMacro.CommonQuery id="McFeerateUnSelList" init="true" submitMode="all" navigate="false">
        <table  width="100%">
        	<#if v_op!="detail">
            <tr>
               <td align="center">
                <br/>
                <@CommonQueryMacro.Button id= "btaddR" />
            </td>
            </tr> 
             <tr>
               <td align="center">
                <br/>
                <@CommonQueryMacro.Button id= "btremoveR"/>
            </td>
            </tr>
            </#if> 
        </table>
        </@CommonQueryMacro.CommonQuery>
        </td>
        <td width="45%" valign="top">
            <@CommonQueryMacro.CommonQuery id="McFeerateSelList" init="true" submitMode="selected" navigate="false">
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
            </@CommonQueryMacro.CommonQuery>
        </td>
    </tr>
    <#else>
    	<@CommonQueryMacro.CommonQuery id="McFeerateUnSelList" init="true" submitMode="selected" navigate="false">
    	 </@CommonQueryMacro.CommonQuery>
    	 <@CommonQueryMacro.CommonQuery id="McFeerateSelList" init="true" submitMode="selected" navigate="false">
    	  </@CommonQueryMacro.CommonQuery>
    </#if>
<!-- McFeerate -->
	<#if v_op=="detail">
	<tr>
		<td align="left" colspan="3">
			<table align="left">
				<tr>
					<td colspan="2" align="left">
    					<@CommonQueryMacro.Button id= "btBack"/>
    					<#if approvalflag == "2">
	    					<@CommonQueryMacro.Button id= "btApprove"/>
	    					<@CommonQueryMacro.Button id= "btReject"/>
    					</#if>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<#else>
	<tr>
		<td align="center" colspan="3">
			<table align="center">
				<tr>
					<td colspan="2" align="center">
    					<@CommonQueryMacro.Button id= "btSave"/>&nbsp;&nbsp;&nbsp;
    					<@CommonQueryMacro.Button id= "btBack"/>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</#if>
</table>
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
<script language="javascript">
var op = "${v_op}";
var brno = "${v_brno}";
var in_country = "${v_country}";
var isShowAggregator = "${v_isShowAggregator}";
var count_supmerid = 0;
var count_aggregator = 0;
function initCallGetter_post(){	

	McMerinfoList_dataset.setFieldRequired("acctcur",true);
	McMerinfoList_dataset.setFieldRequired("merfeeacct",true);
	McMerinfoList_dataset.setFieldRequired("mysrptype",false);

	if(in_country == "ID" || in_country == "TH" || in_country == "VN"){
		McMerinfoList_dataset.setFieldRequired("sharedkey",true);
	}
	if(in_country=="MY"){
		McMerinfoList_dataset.setFieldRequired("meracct",true);
		McMerinfoList_dataset.setFieldRequired("rptype",false);
		McMerinfoList_dataset.setFieldRequired("debtorname",true);
		McMerinfoList_dataset.setFieldRequired("mysrptype",true);
		McMerinfoList_dataset.setFieldRequired("myschannel",true);
		McMerinfoList_dataset.setFieldRequired("fundSrc",true);
		McMerinfoList_dataset.setFieldRequired("category",true);
		McMerinfoList_dataset.setFieldRequired("qrtype",true);
		McMerinfoList_dataset.setFieldReadOnly("posname",false);
		McMerinfoList_dataset.setFieldReadOnly("merid",true);
		McMerinfoList_dataset.setFieldRequired("merid",true);
		McMerinfoList_dataset.setFieldReadOnly("acctcur",true);
		McMerinfoList_dataset.setValue("acctcur","MYR");
	}
	if(in_country=="HK"||in_country=="SG"){
		McMerinfoList_dataset.setFieldRequired("meracct",true);
		McMerinfoList_dataset.setFieldRequired("meracctmq",false);
		McMerinfoList_dataset.setFieldRequired("meracctsg",false);
		McMerinfoList_dataset.setFieldReadOnly("merid",true);
		McMerinfoList_dataset.setFieldRequired("merid",true);
		
	}
	
	if(in_country=="HK"){
		McMerinfoList_dataset.setFieldRequired("merchantkid",false);
		McMerinfoList_dataset.setFieldReadOnly("merchantkid",true);
		McMerinfoList_dataset.setFieldRequired("hsbckid",false);
		McMerinfoList_dataset.setFieldReadOnly("hsbckid",true);
		McMerinfoList_dataset.setFieldRequired("kid_url",false);
		McMerinfoList_dataset.setFieldReadOnly("kid_url",true);
		var billpmode = McMerinfoList_dataset.getValue("billpmode");
		if(billpmode == "1"){
    		McMerinfoList_dataset.setFieldRequired("merurl",true);  
    		McMerinfoList_dataset.setFieldReadOnly("merurl",false);
    		McMerinfoList_dataset.setFieldRequired("merchantkid",true);  
    		McMerinfoList_dataset.setFieldReadOnly("merchantkid",false);
    		McMerinfoList_dataset.setFieldRequired("hsbckid",true);  
    		McMerinfoList_dataset.setFieldReadOnly("hsbckid",false);
    		McMerinfoList_dataset.setFieldRequired("kid_url",true);  
    		McMerinfoList_dataset.setFieldReadOnly("kid_url",false);
	    }else{
    		McMerinfoList_dataset.setFieldRequired("merurl",false);
    		McMerinfoList_dataset.setFieldReadOnly("merurl",true);
    		McMerinfoList_dataset.setFieldRequired("merchantkid",false);
    		McMerinfoList_dataset.setFieldReadOnly("merchantkid",true);
    		McMerinfoList_dataset.setFieldRequired("hsbckid",false);
    		McMerinfoList_dataset.setFieldReadOnly("hsbckid",true);
    		McMerinfoList_dataset.setFieldRequired("kid_url",true);  
    		McMerinfoList_dataset.setFieldReadOnly("kid_url",false);
	    }
		McMerinfoList_dataset.setFieldRequired("channel",true);
		hideCheckBox("rptype",["03","04"]);
		McMerinfoList_dataset.setFieldRequired("chlfeecycle",true);
		McMerinfoList_dataset.setFieldRequired("debtorname",true);
	}
	if(in_country=="SG"){
		McMerinfoList_dataset.setFieldRequired("channelsg",true);
		McMerinfoList_dataset.setValue("proxytype","UEN");
		McMerinfoList_dataset.setFieldReadOnly("proxytype",true);
		McMerinfoList_dataset.setFieldRequired("proxytype",true);
		McMerinfoList_dataset.setFieldRequired("proxyid",true);
		
		McMerinfoList_dataset.setFieldRequired("meracctsg",true);
		McMerinfoList_dataset.setFieldRequired("merfeeacctsg",true);
		McMerinfoList_dataset.setFieldRequired("regincr",true);
		McMerinfoList_dataset.setFieldRequired("dtltime",true);
		
		hideCheckBox("rptype",["02","03","04","05"]);
		
		var channel = McMerinfoList_dataset.getValue("channel");
		if(channel.indexOf("2")!=-1){
			McMerinfoList_dataset.setFieldRequired("posnamesg",true);
			McMerinfoList_dataset.setFieldReadOnly("posnamesg",false);
		}else{
			McMerinfoList_dataset.setFieldRequired("posnamesg",false);
			McMerinfoList_dataset.setFieldReadOnly("posnamesg",true);
		}
		
		McMerinfoList_dataset.setFieldReadOnly("merurl",false);
		McMerinfoList_dataset.setFieldRequired("merurl",true);
		McMerinfoList_dataset.setFieldRequired("merchantkid",true);
		McMerinfoList_dataset.setFieldRequired("hsbckid",true);
		McMerinfoList_dataset.setFieldRequired("kid_url",true);
	}
	if(in_country=="TH" || in_country == "VN"){
		McMerinfoList_dataset.setFieldRequired("merchantkid",false);
		McMerinfoList_dataset.setFieldRequired("hsbckid",false);
		McMerinfoList_dataset.setFieldRequired("kid_url",false);
	}
	if(in_country=="ID"){
		hideCheckBox("rptype",["05"]);		
		McMerinfoList_dataset.setFieldRequired("meracct",false);
		McMerinfoList_dataset.setFieldRequired("meracctmq",true);
		McMerinfoList_dataset.setFieldRequired("merfeeacctmq",true);
		McMerinfoList_dataset.setFieldRequired("meracctsg",false);
		McMerinfoList_dataset.setFieldReadOnly("meridid",false);
		McMerinfoList_dataset.setFieldRequired("meridid",true);
		McMerinfoList_dataset.setFieldRequired("chlfeecycle",true);
		McMerinfoList_dataset.setFieldRequired("merchantkid",false);
		McMerinfoList_dataset.setFieldRequired("hsbckid",false);
		McMerinfoList_dataset.setFieldRequired("kid_url",false);
		if(isShowAggregator == 'Y'){
			McMerinfoList_dataset.setFieldRequired("merfeetype",true);
			McMerinfoList_dataset.setFieldRequired("merfeecycle",true);
			McMerinfoList_dataset.setFieldRequired("aggregator",true);
		}
	}
	if(in_country=="TH" || in_country=="CN" || in_country == "VN"){	
		hideCheckBox("rptype",["05"]);	
		McMerinfoList_dataset.setFieldRequired("meracct",false);
		McMerinfoList_dataset.setFieldRequired("meracctmq",true);
		McMerinfoList_dataset.setFieldRequired("merfeeacctmq",true);
		McMerinfoList_dataset.setFieldRequired("meracctsg",false);
		McMerinfoList_dataset.setFieldReadOnly("merid",false);
		McMerinfoList_dataset.setFieldRequired("merid",true);
		McMerinfoList_dataset.setFieldRequired("chlfeecycle",true);
		if(isShowAggregator == 'Y'){
			McMerinfoList_dataset.setFieldRequired("merfeetype",true);
			McMerinfoList_dataset.setFieldRequired("merfeecycle",true);
			McMerinfoList_dataset.setFieldRequired("aggregator",true);
		}
	}
	if(op=="MOD"){
		if(in_country=="ID"){
			McMerinfoList_dataset.setFieldReadOnly("meridid",true);
		}else{
			McMerinfoList_dataset.setFieldReadOnly("merid",true);
		}	
	}
	if(op=="ADD"){
		McMerinfoList_dataset.setValue("mertype","1");		
		if(in_country=="HK"){
			McMerinfoList_dataset.setValue("rptype","01,02");
			McMerinfoList_dataset.setValue("rpfmt","CSV");
			McMerinfoList_dataset.setValue("chlfeecycle","2");
			McMerinfoList_dataset.setValue("debtorname","0");
		}
		
		if(in_country=="SG"){
			McMerinfoList_dataset.setValue("rptype","01");
			McMerinfoList_dataset.setValue("regincr","0");
			
			McMerinfoList_dataset.setFieldReadOnly("merurl",false);
			McMerinfoList_dataset.setFieldRequired("merurl",true);
		}
		var aggregator;
		dwr.engine.setAsync(false);
			CheckAction.getAggratorID(function(mgs){
				aggregator = mgs;
			});
		dwr.engine.setAsync(true);
		McMerinfoList_dataset.setValue("aggregator",aggregator);
		McMerinfoList_dataset.setFieldReadOnly("aggregator",true);
	}
	var deliverych = McMerinfoList_dataset.getValue("deliverych");
	if(deliverych.indexOf("RFD")!=-1){
		McMerinfoList_dataset.setFieldRequired("hsbcnetid",true);
	}else{
		McMerinfoList_dataset.setFieldRequired("hsbcnetid",false);
	}
	if(deliverych.indexOf("H2H")!=-1){
		McMerinfoList_dataset.setFieldRequired("hsbcnetid",true);
		McMerinfoList_dataset.setFieldRequired("connectid",true);
	}else{
		McMerinfoList_dataset.setFieldRequired("connectid",false);
	}
	if(deliverych.indexOf("Email")!=-1){
		McMerinfoList_dataset.setFieldRequired("meremail",true);
	}else{
		McMerinfoList_dataset.setFieldRequired("meremail",false);
	}	
	var merfeecycle = McMerinfoList_dataset.getValue("merfeecycle");
	if(merfeecycle=="2"){
		McMerinfoList_dataset.setFieldReadOnly("merfeedate",false);
		McMerinfoList_dataset.setFieldRequired("merfeedate",true);
		
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoList_dataset.setFieldRequired("merfeedate",false);
		McMerinfoList_dataset.setValue("merfeedate","");
		
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoList_dataset.setValue("chlfeedate","");
	}
	var chlfeecycle = McMerinfoList_dataset.getValue("chlfeecycle");
	if(chlfeecycle=="2"){
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",false);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoList_dataset.setValue("chlfeedate","");
	}
	if(isShowAggregator=="N"){
		McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoList_dataset.setValue("chlfeedate","");
	}
	var mertype = McMerinfoList_dataset.getValue("mertype");
	if(mertype=="2"){
		McMerinfoList_dataset.setFieldReadOnly("supmerid",false);
		McMerinfoList_dataset.setFieldRequired("supmerid",true);
		
		McMerinfoList_dataset.setFieldReadOnly("aggregator",true);
	}else{
		McMerinfoList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoList_dataset.setFieldRequired("supmerid",false);
		McMerinfoList_dataset.setValue("supmerid","");
		
		//McMerinfoList_dataset.setFieldReadOnly("aggregator",false);
	}
	var channel = McMerinfoList_dataset.getValue("channel");
	if(in_country=="HK"){
		if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("3")!=-1){
			McMerinfoList_dataset.setFieldRequired("proxytype",true);
			McMerinfoList_dataset.setFieldRequired("proxyid",true);
			McMerinfoList_dataset.setFieldReadOnly("proxytype",false);
			McMerinfoList_dataset.setFieldReadOnly("proxyid",false);
		}else{
			McMerinfoList_dataset.setFieldRequired("proxytype",false);
			McMerinfoList_dataset.setFieldRequired("proxyid",false);
			McMerinfoList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoList_dataset.setFieldReadOnly("proxyid",true);
			McMerinfoList_dataset.setValue("proxytype","");
			McMerinfoList_dataset.setValue("proxyid","");
		}
		if(channel.indexOf("2")!=-1){
			McMerinfoList_dataset.setFieldReadOnly("posnamehk",false);
			McMerinfoList_dataset.setFieldRequired("posnamehk",true);
			McMerinfoList_dataset.setFieldRequired("permnetid",true);
			McMerinfoList_dataset.setFieldReadOnly("permnetid",false);
		}else{
			McMerinfoList_dataset.setFieldReadOnly("posnamehk",true);
			McMerinfoList_dataset.setFieldRequired("posnamehk",false);
			McMerinfoList_dataset.setValue("posnamehk","");
			McMerinfoList_dataset.setFieldRequired("permnetid",false);
			McMerinfoList_dataset.setFieldReadOnly("permnetid",true);
			McMerinfoList_dataset.setValue("permnetid","");
		}
	}
	if(channel.indexOf("1")!=-1){
		if(in_country=="SG"){
			McMerinfoList_dataset.setFieldReadOnly("commerceid",false);
			McMerinfoList_dataset.setFieldRequired("commerceid",false);
		}else if(in_country!="MY"){
			McMerinfoList_dataset.setFieldReadOnly("commerceid",false);
			McMerinfoList_dataset.setFieldRequired("commerceid",true);
		}		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("commerceidexpirydate",false);
			//McMerinfoList_dataset.setFieldRequired("commerceidexpirydate",true);
			//McMerinfoList_dataset.setFieldReadOnly("commerceidnew",false);
		}
	}else{
		McMerinfoList_dataset.setFieldReadOnly("commerceid",true);
		//McMerinfoList_dataset.setFieldRequired("commerceid",false);
		McMerinfoList_dataset.setValue("commerceid","");
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("commerceidexpirydate",true);
			//McMerinfoList_dataset.setFieldRequired("commerceidexpirydate",false);
			McMerinfoList_dataset.setValue("commerceidexpirydate","");
			McMerinfoList_dataset.setFieldReadOnly("commerceidnew",true);
			McMerinfoList_dataset.setValue("commerceidnew","");
		}
	}
	if(channel.indexOf("2")!=-1){
		if(in_country=="SG"){
			McMerinfoList_dataset.setFieldReadOnly("posid",false);
			McMerinfoList_dataset.setFieldRequired("posid",false);
		}else if(in_country!="MY"){
			McMerinfoList_dataset.setFieldReadOnly("posid",false);
			McMerinfoList_dataset.setFieldRequired("posid",true);
		}	
		
		McMerinfoList_dataset.setFieldReadOnly("posname",false);
		McMerinfoList_dataset.setFieldRequired("posname",true);
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("posidexpirydate",false);
			//McMerinfoList_dataset.setFieldRequired("posidexpirydate",true);
			//McMerinfoList_dataset.setFieldReadOnly("posidnew",false);
		}
	}else{
		McMerinfoList_dataset.setFieldReadOnly("posid",true);
		McMerinfoList_dataset.setFieldRequired("posid",false);
		McMerinfoList_dataset.setValue("posid","");
		if(in_country!="MY"){
			McMerinfoList_dataset.setFieldReadOnly("posname",true);
			McMerinfoList_dataset.setFieldRequired("posname",false);
		}
		McMerinfoList_dataset.setValue("posname","");
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("posidexpirydate",true);
			//McMerinfoList_dataset.setFieldRequired("posidexpirydate",false);
			McMerinfoList_dataset.setValue("posidexpirydate","");
			McMerinfoList_dataset.setFieldReadOnly("posidnew",true);
			McMerinfoList_dataset.setValue("posidnew","");
		}
	}
	if(channel.indexOf("3")!=-1){
		McMerinfoList_dataset.setFieldReadOnly("paymeid",false);
		McMerinfoList_dataset.setFieldRequired("paymeid",true);
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("paymeidexpirydate",false);
			//McMerinfoList_dataset.setFieldRequired("paymeidexpirydate",true);
			//McMerinfoList_dataset.setFieldReadOnly("paymeidnew",false);
		}
	}else{
		McMerinfoList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoList_dataset.setFieldRequired("paymeid",false);
		McMerinfoList_dataset.setValue("paymeid","");
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("paymeidexpirydate",true);
			//McMerinfoList_dataset.setFieldRequired("paymeidexpirydate",false);
			McMerinfoList_dataset.setValue("paymeidexpirydate","");
			McMerinfoList_dataset.setFieldReadOnly("paymeidnew",true);
			McMerinfoList_dataset.setValue("paymeidnew","");
		}
	}
	if(channel.indexOf("4")!=-1){
		if(in_country=="SG"){
			McMerinfoList_dataset.setFieldReadOnly("billpid",false);
			McMerinfoList_dataset.setFieldRequired("billpid",false);
		}else if(in_country!="MY"){
			McMerinfoList_dataset.setFieldReadOnly("billpid",false);
			McMerinfoList_dataset.setFieldRequired("billpid",true);
			
			//McMerinfoList_dataset.setFieldReadOnly("merurl",false);
			//McMerinfoList_dataset.setFieldRequired("merurl",true);
		}		
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("billpidexpirydate",false);
			//McMerinfoList_dataset.setFieldRequired("billpidexpirydate",true);
			//McMerinfoList_dataset.setFieldReadOnly("billpidnew",false);
		}
		
		McMerinfoList_dataset.setFieldReadOnly("billpmode",false);
		McMerinfoList_dataset.setFieldRequired("billpmode",true);
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("billpproxytype",false);
			McMerinfoList_dataset.setFieldRequired("billpproxytype",true);
			McMerinfoList_dataset.setFieldReadOnly("billpproxyid",false);
			McMerinfoList_dataset.setFieldRequired("billpproxyid",true);
			McMerinfoList_dataset.setFieldReadOnly("billpacct",false);
			McMerinfoList_dataset.setFieldRequired("billpacct",true);
		}
	}else{
		McMerinfoList_dataset.setFieldReadOnly("billpid",true);
		McMerinfoList_dataset.setFieldRequired("billpid",false);
		McMerinfoList_dataset.setValue("billpid","");
		if(in_country !="SG"){
			McMerinfoList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoList_dataset.setFieldRequired("merurl",false);
			if(in_country !="ID"){
				McMerinfoList_dataset.setValue("merurl","");
			}
		}		
		McMerinfoList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoList_dataset.setFieldRequired("billpmode",false);
		McMerinfoList_dataset.setValue("billpmode","");
		McMerinfoList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoList_dataset.setFieldRequired("billpproxytype",false);
		McMerinfoList_dataset.setValue("billpproxytype","");
		McMerinfoList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoList_dataset.setFieldRequired("billpproxyid",false);
		McMerinfoList_dataset.setValue("billpproxyid","");
		McMerinfoList_dataset.setFieldReadOnly("billpacct",true);
		McMerinfoList_dataset.setFieldRequired("billpacct",false);
		McMerinfoList_dataset.setValue("billpacct","");
		
		if(in_country=="HK"){
			McMerinfoList_dataset.setFieldReadOnly("billpidexpirydate",true);
			McMerinfoList_dataset.setFieldRequired("billpidexpirydate",false);
			McMerinfoList_dataset.setValue("billpidexpirydate","");
			McMerinfoList_dataset.setFieldReadOnly("billpidnew",true);
			McMerinfoList_dataset.setValue("billpidnew","");
		}
	}
	var billpid = McMerinfoList_dataset.getValue("billpid");
	if(billpid==""){
		McMerinfoList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoList_dataset.setFieldReadOnly("billpacct",true);
	}
	var aggregator = McMerinfoList_dataset.getValue("aggregator");
	McFeerateUnSelList_dataset.setParameter("aggregator",aggregator);
	McFeerateUnSelList_dataset.flushData(1);
	McFeerateSelList_dataset.setParameter("aggregator",aggregator);
	McFeerateSelList_dataset.flushData(1);
	
	McMerinfoList_dataset.setValue("country",brno);
	if(op=="detail"){
		McMerinfoList_dataset.setReadOnly(true);
	}
	if(in_country == "ID"){
		McMerinfoList_dataset.setFieldRequired("merurl",false);  
    	McMerinfoList_dataset.setFieldReadOnly("merurl",false);
	}
	
}
function btBack_onClick(button) {
	 closeWin();
}

function btSave_onClickCheck(button){
	McMerinfoList_dataset.setParameter("op",op);
	if(in_country=="TH" || in_country=="ID" || in_country == "VN"){
		var sharedkey = McMerinfoList_dataset.getValue("sharedkey");
		//var shared = sharedkey.replace(/\r\n/g,"");
		//var shared = shared.replace(/\n/g,"");
		//McMerinfoList_dataset.setValue("sharedkey",shared);
		var flag = false;
		dwr.engine.setAsync(false);
		hsbcAction.checkPgp(sharedkey,function(data){
			flag = data;			
		});
		dwr.engine.setAsync(true);
		if(!flag){
			alert("Invalid shared key.");
			return false;
		}
	}
	var acctcur = McMerinfoList_dataset.getValue("acctcur");
	var meracct = McMerinfoList_dataset.getValue("meracct");
	//选择两个币种则账户需要以888或者838结尾
	if(in_country=="HK"){
		if(acctcur.length>3){
			var mera = meracct.substring(9);
			if(mera != "888" && mera != "838"){
				alert("If you choose two currencies, the account must end with 888 or 838");
				return false;
			}
		}
	}
	
	var rptype = "";
	if(in_country == "MY") {
		rptype = McMerinfoList_dataset.getValue("mysrptype");
	}else {
		rptype = McMerinfoList_dataset.getValue("rptype");
	}
	if(rptype==""){
		alert("At least one report is preferred");
		return false;
	}
	var rpfmt = McMerinfoList_dataset.getValue("rpfmt");
	if(rpfmt==""){
		alert("Report Format is mandatory");
		return false;
	}
	var deliverych = McMerinfoList_dataset.getValue("deliverych");
	if(deliverych==""){
		alert("Report Delivery Channel is mandatory");
		return false;
	}else{		
		if(deliverych.indexOf("Email")!=-1){		
			var meremail = McMerinfoList_dataset.getValue("meremail");
			if(meremail == ""){
				alert("Merchant E-mail is mandatory");
				return false;
			}
		}
	}
	
	if(in_country=="HK"||in_country=="SG"){
		var channel = McMerinfoList_dataset.getValue("channel");
		if(channel==""){
			alert("Channel Subscribed is mandatory");
			return false;
		}
	}
	var merfeedate = McMerinfoList_dataset.getValue("merfeedate");
	var chlfeedate = McMerinfoList_dataset.getValue("chlfeedate");
	if(merfeedate!=""&&chlfeedate!=""&&merfeedate!=chlfeedate){
		alert("Aggregator Charge Date and HSBC Charge Date need to be the same");
		return false;
	}
	
	var billpproxyid = McMerinfoList_dataset.getValue("billpproxyid");
	var proxyid = McMerinfoList_dataset.getValue("proxyid");
	var mername = McMerinfoList_dataset.getValue("mername");
	if(in_country=="SG"){
		if(proxyid.length>13){
			alert("Proxy ID maximum length is 13");
			return false;
		}
		if(mername.length>25){
			alert("Merchant Name maximum length is 25");
			return false;
		}	
	}
	
	if(billpproxyid!=""&&proxyid!=""&&billpproxyid==proxyid){
		alert("Bill Payment Proxy ID duplicate with Proxy ID");
		return false;
	}
	var proxyFlag = false;
	var merid = McMerinfoList_dataset.getValue("merid");
	dwr.engine.setAsync(false);
	hsbcAction.isHasProxyID(merid,billpproxyid,function(data){
		proxyFlag = data;
	});
	dwr.engine.setAsync(true);
	if(proxyFlag){
		alert("Bill Payment Proxy ID duplicate with others profile");
		return false;
	}
	
	dwr.engine.setAsync(false);
	hsbcAction.isHasProxyID(merid,proxyid,function(data){
		proxyFlag = data;
	});
	dwr.engine.setAsync(true);
	if(proxyFlag){
		alert("Proxy ID duplicate with others profile");
		return false;
	}
	
	if(op=="ADD"){
	 var merid = "";
	 var meracct = "";
	 var acctcur = "";
	 var supmerid = "";
	 acctcur = McMerinfoList_dataset.getValue("acctcur");
	 supmerid = McMerinfoList_dataset.getValue("supmerid");
	 if(in_country=="HK"||in_country=="SG" || in_country=="MY"){
	 	merid = McMerinfoList_dataset.getValue("merid");
		meracct = McMerinfoList_dataset.getValue("meracct");
		
		dwr.engine.setAsync(false);
		hsbcAction.getDefaultMerId(merid,brno,meracct,acctcur,supmerid,function(data){
			McMerinfoList_dataset.setValue("merid",data);			
		});
		dwr.engine.setAsync(true);	
	
	 }
	 if(in_country=="MY"){
		var qrId = McMerinfoList_dataset.getValue("qrId");
		dwr.engine.setAsync(false);	
		hsbcAction.getDefaultQRId(function(data){
			McMerinfoList_dataset.setValue("qrId",data);			
		});
		dwr.engine.setAsync(true);	
	}
	if(in_country=="ID"){
	 	merid = McMerinfoList_dataset.getValue("meridid");
		meracct = McMerinfoList_dataset.getValue("meracctmq");
		merfeeacct = McMerinfoList_dataset.getValue("merfeeacctmq");
		McMerinfoList_dataset.setValue("merid",merid);
		McMerinfoList_dataset.setValue("meracct",meracct);		
		McMerinfoList_dataset.setValue("merfeeacct",merfeeacct);		
 	}
	if(in_country=="TH" || in_country=="CN" || in_country == "VN"){
	 	merid = McMerinfoList_dataset.getValue("merid");
		meracct = McMerinfoList_dataset.getValue("meracctmq");
		merfeeacct = McMerinfoList_dataset.getValue("merfeeacctmq");
		McMerinfoList_dataset.setValue("meracct",meracct);		
		McMerinfoList_dataset.setValue("merfeeacct",merfeeacct);	
 	}
	
	}
	
	var proxytype = McMerinfoList_dataset.getValue("proxytype");
	if("" == proxyid){
		if(in_country=="HK"){
			if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("3")!=-1){
				alert("Proxy ID is mandatory");
			}
		}
		if(in_country=="SG"){
			if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("4")!=-1){
				alert("Proxy ID is mandatory");
			}
		}	
	}else{
		if(proxytype=="EMAL"){
			if(proxyid.search(isEmail)==-1){
				alert("Please input in  email address format when proxy type is EMAIL ADDRESS");
				return false;
			}
		}
		if(proxytype=="MOBN"){
			if(proxyid.search(isMOBN)==-1){
				alert("Please input in  '+' + country code +'-'format when proxy type is MOBILE NUMBER");
				return false;
			}
		}
		if(proxytype=="SVID"){
			if(proxyid.search(isNum)==-1){
				alert("Please input in numeric format when proxy type is FSP ID");
				return false;
			}
		}
	}
	
	var billpproxytype = McMerinfoList_dataset.getValue("billpproxytype");
	if("" == billpproxyid){
	    if(in_country=="HK"){
		    if(channel.indexOf("4")!=-1){
				alert("Bill Payment Proxy ID is mandatory");
			}
	    }				
	}else{
		if(billpproxytype=="EMAL"){
			if(billpproxyid.search(isEmail)==-1){
				alert("Please input in  email address format when Bill Payment Proxy Type is EMAIL ADDRESS");
				return false;
			}
		}
		if(billpproxytype=="MOBN"){
			if(billpproxyid.search(isMOBN)==-1){
				alert("Please input in  '+' + country code +'-'format when Bill Payment Proxy Type is MOBILE NUMBER");
				return false;
			}
		}
		if(billpproxytype=="SVID"){
			if(billpproxyid.search(isNum)==-1){
				alert("Please input in numeric format when Bill Payment Proxy Type is FSP ID");
				return false;
			}
		}
	}
	var hsbcnetid = McMerinfoList_dataset.getValue("hsbcnetid");
	if(hsbcnetid != ""){
		var flag = 1;
		var country = McMerinfoList_dataset.getValue("country");
		var meracct = McMerinfoList_dataset.getValue("meracct");
		dwr.engine.setAsync(false);
		hsbcAction.checkCustID(hsbcnetid,country,meracct,function(data){
			if(data < 0){
				alert("HSBCnet Customer ID does not match with the Settlement Account");
				flag = 2;			
			}
		});
		dwr.engine.setAsync(true);	
		if(flag == 2){
			return false;
		}
	}
}

function btSave_postSubmit(button){
	alert("${Common_Message_Success}");
	closeWin(true);
}
function btCancel_onClick(button) {
	subwindow_floatWindowTime.close();
	McMerinfoList_dataset.setValue("texthour","");
	McMerinfoList_dataset.setValue("textminute","");
}
window.onload = function(){
	var dtltimeNode = document.getElementById("editor_dtltime");
	dtltimeNode.addEventListener("dblclick",eventOne);
}
var eventOne = function(){  
    subwindow_floatWindowTime.show();
}
function btConfirm_onClickCheck(button){

}
function btConfirm_onClick(button){
	var dtltime = McMerinfoList_dataset.getValue("dtltime");
	var hour = McMerinfoList_dataset.getValue("texthour");
	var minute = McMerinfoList_dataset.getValue("textminute");
	if(dtltime==null||dtltime==""){
		McMerinfoList_dataset.setValue("dtltime",hour+":"+minute);
	}else{
		McMerinfoList_dataset.setValue("dtltime",dtltime+","+hour+":"+minute);
	}
	subwindow_floatWindowTime.close();
}

function btaddR_onClickCheck(button) {
	var currentRecord = McFeerateUnSelList_dataset.record;
	if(currentRecord != null){
	    McFeerateSelList_dataset.insertRecord();
	    currentRecord.setValue("select", true);
    	McFeerateSelList_dataset.copyRecord(currentRecord);
    	McFeerateUnSelList_dataset.deleteRecord();
	}
}

function btremoveR_onClickCheck(button) {
	var currentRecord = McFeerateSelList_dataset.record;
	if(currentRecord != null){
	    McFeerateUnSelList_dataset.insertRecord();
	    currentRecord.setValue("select", false);
    	McFeerateUnSelList_dataset.copyRecord(currentRecord);
    	McFeerateSelList_dataset.deleteRecord();
	}
}
function merfeecycle_DropDown_onSelect(dropdown,record,editor){
	var merfeecycle = record.getValue("data");
	if(merfeecycle=="2"){
		McMerinfoList_dataset.setFieldReadOnly("merfeedate",false);
		McMerinfoList_dataset.setFieldRequired("merfeedate",true);
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",false);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",true);	
	}else{
		McMerinfoList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoList_dataset.setFieldRequired("merfeedate",false);
		McMerinfoList_dataset.setValue("merfeedate","");
	}
	return true;
}
function chlfeecycle_DropDown_onSelect(dropdown,record,editor){
	var chlfeecycle = record.getValue("data");
	if(chlfeecycle=="2"){
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",false);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoList_dataset.setValue("chlfeedate","");
	}
	if(isShowAggregator=="N"){
		McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoList_dataset.setValue("chlfeedate","");
	}
	return true;
}

function mertype_DropDown_onSelect(dropdown,record,editor){
	var merid = McMerinfoList_dataset.getValue("merid");
	if(merid!=""){
		var flag = false;
		dwr.engine.setAsync(false);
		hsbcAction.isSubMerinfo(merid,function(data){
			flag = data;
		});
		if(flag){
			alert("Not allowed to modify master merchant when sub merchants exist.");
			return false;
		}
	}
	
	var mertype = record.getValue("data");
	if(mertype=="2"){
		McMerinfoList_dataset.setFieldReadOnly("supmerid",false);
		McMerinfoList_dataset.setFieldRequired("supmerid",true);
	}else{
		McMerinfoList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoList_dataset.setFieldRequired("supmerid",false);
		McMerinfoList_dataset.setValue("supmerid","");
	}
	return true;
}

function McMerinfoList_dataset_afterChange(dataset,field){

	if(field.name=="hsbcnetid"){
		var hsbcnetid = McMerinfoList_dataset.getValue("hsbcnetid").toUpperCase();	
		//var hsbcnetid = McMerinfoList_dataset.getValue("hsbcnetid");	
		//dataset.setValue("hsbcnetid",hsbcnetid);
	}
	if(field.name=="connectid"){
		var connectid = McMerinfoList_dataset.getValue("connectid");
		//dataset.setValue("connectid",connectid);
	}
    if(in_country=="ID"||in_country=="TH" || in_country=="CN" || in_country == "VN"){
	    if(field.name=="merfeecycle"){
	      	var merfeecycle = dataset.getValue("merfeecycle");
      		dataset.setValue("chlfeecycle",merfeecycle);
	      	if(merfeecycle=="2"){
				McMerinfoList_dataset.setFieldRequired("chlfeedate",true);
			}else{	
				McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);
				McMerinfoList_dataset.setFieldRequired("chlfeedate",false);
			}   
			McMerinfoList_dataset.setFieldReadOnly("chlfeecycle",true);      
	    }
		if(field.name=="merfeedate"){
			var merfeedate = dataset.getValue("merfeedate");
			dataset.setValue("chlfeedate",merfeedate);
			McMerinfoList_dataset.setFieldReadOnly("chlfeedate",true);   	            
		}
    }
    if(in_country=="HK"){
	    if(field.name=="billpmode"){
	    	var billpmode = dataset.getValue("billpmode");
	    	if(billpmode == "1"){
	    		McMerinfoList_dataset.setFieldRequired("merurl",true);  
	    		McMerinfoList_dataset.setFieldReadOnly("merurl",false);
	    		McMerinfoList_dataset.setFieldReadOnly("merchantkid",false);
				McMerinfoList_dataset.setFieldRequired("merchantkid",true);
				McMerinfoList_dataset.setFieldReadOnly("hsbckid",false);
				McMerinfoList_dataset.setFieldRequired("hsbckid",true);
				McMerinfoList_dataset.setFieldReadOnly("kid_url",false);
				McMerinfoList_dataset.setFieldRequired("kid_url",true);
	    	}else{
	    		McMerinfoList_dataset.setFieldRequired("merurl",false);
	    		McMerinfoList_dataset.setFieldReadOnly("merurl",true);
	    		McMerinfoList_dataset.setFieldReadOnly("merchantkid",true);
				McMerinfoList_dataset.setFieldReadOnly("hsbckid",true);
				McMerinfoList_dataset.setFieldReadOnly("kid_url",true);
				McMerinfoList_dataset.setFieldRequired("merchantkid",false);
				McMerinfoList_dataset.setFieldRequired("hsbckid",false);
				McMerinfoList_dataset.setFieldRequired("kid_url",false);
				McMerinfoList_dataset.setValue("merurl","");
				McMerinfoList_dataset.setValue("merchantkid","");
				McMerinfoList_dataset.setValue("hsbckid","");
				McMerinfoList_dataset.setValue("kid_url","");
	    	}
	    }
	    if(field.name=="commerceidexpirydate"){
	    	var commerceidexpirydate = dataset.getValue("commerceidexpirydate");
	    	if(commerceidexpirydate != ""){
	    		McMerinfoList_dataset.setFieldReadOnly("commerceidnew",false);
	    		McMerinfoList_dataset.setFieldRequired("commerceidnew",true);
	    	}else{
	    		McMerinfoList_dataset.setFieldReadOnly("commerceidnew",true);
	    		McMerinfoList_dataset.setFieldRequired("commerceidnew",false);
	    		McMerinfoList_dataset.setValue("commerceidnew","");
	    	}
	    }
	    if(field.name=="posidexpirydate"){
	    	var posidexpirydate = dataset.getValue("posidexpirydate");
	    	if(posidexpirydate != ""){
	    		McMerinfoList_dataset.setFieldReadOnly("posidnew",false);
	    		McMerinfoList_dataset.setFieldRequired("posidnew",true);
	    	}else{
	    		McMerinfoList_dataset.setFieldReadOnly("posidnew",true);
	    		McMerinfoList_dataset.setFieldRequired("posidnew",false);
	    		McMerinfoList_dataset.setValue("posidnew","");
	    	}
	    }
	    if(field.name=="paymeidexpirydate"){
	    	var paymeidexpirydate = dataset.getValue("paymeidexpirydate");
	    	if(paymeidexpirydate != ""){
	    		McMerinfoList_dataset.setFieldReadOnly("paymeidnew",false);
	    		McMerinfoList_dataset.setFieldRequired("paymeidnew",true);
	    	}else{
	    		McMerinfoList_dataset.setFieldReadOnly("paymeidnew",true);
	    		McMerinfoList_dataset.setFieldRequired("paymeidnew",false);
	    		McMerinfoList_dataset.setValue("paymeidnew","");
	    	}
	    }
	    if(field.name=="billpidexpirydate"){
	    	var billpidexpirydate = dataset.getValue("billpidexpirydate");
	    	if(billpidexpirydate != ""){
	    		McMerinfoList_dataset.setFieldReadOnly("billpidnew",false);
	    		McMerinfoList_dataset.setFieldRequired("billpidnew",true);
	    	}else{
	    		McMerinfoList_dataset.setFieldReadOnly("billpidnew",true);
	    		McMerinfoList_dataset.setFieldRequired("billpidnew",false);
	    		McMerinfoList_dataset.setValue("billpidnew","");
	    	}
	    }
	    
	}
	if(field.name=="channel"){
		var channel = dataset.getValue("channel");
		if(in_country=="HK"){
			if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("3")!=-1){
				McMerinfoList_dataset.setFieldRequired("proxytype",true);
				McMerinfoList_dataset.setFieldRequired("proxyid",true);
				McMerinfoList_dataset.setFieldReadOnly("proxytype",false);
				McMerinfoList_dataset.setFieldReadOnly("proxyid",false);
				var proxytype = dataset.getValue("proxytype");
				if(proxytype==""){
					McMerinfoList_dataset.setValue("proxytype","SVID");
				}
			}else{
				McMerinfoList_dataset.setFieldRequired("proxytype",false);
				McMerinfoList_dataset.setFieldRequired("proxyid",false);
				McMerinfoList_dataset.setFieldReadOnly("proxytype",true);
				McMerinfoList_dataset.setFieldReadOnly("proxyid",true);
				McMerinfoList_dataset.setValue("proxytype","");
				McMerinfoList_dataset.setValue("proxyid","");
			}
			
			if(channel.indexOf("2")!=-1){
				dataset.setFieldReadOnly("posnamehk",false);
				dataset.setFieldRequired("posnamehk",true);
				dataset.setFieldRequired("permnetid",true);
				dataset.setFieldReadOnly("permnetid",false);
			}else{
				dataset.setFieldReadOnly("posnamehk",true);
				dataset.setFieldRequired("posnamehk",false);
				dataset.setValue("posnamehk","");
				
				dataset.setFieldRequired("permnetid",false);
				dataset.setFieldReadOnly("permnetid",true);
				dataset.setValue("permnetid","");
			}
		}
		
		if(channel.indexOf("1")!=-1){//E-Commerce/M-Commerce
		    if(in_country=="SG"){
		    	dataset.setFieldReadOnly("commerceid",false);
				dataset.setFieldRequired("commerceid",false);
		    }else{
		    	dataset.setFieldReadOnly("commerceid",false);
				dataset.setFieldRequired("commerceid",true);
		    }
		    if(in_country=="HK"){
				dataset.setFieldReadOnly("commerceidexpirydate",false);
				//dataset.setFieldRequired("commerceidexpirydate",true);
				//dataset.setFieldReadOnly("commerceidnew",false);
			}
		}else{
			dataset.setFieldReadOnly("commerceid",true);
			dataset.setFieldRequired("commerceid",false);
			dataset.setValue("commerceid","");
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("commerceidexpirydate",true);
				//dataset.setFieldRequired("commerceidexpirydate",false);
				dataset.setValue("commerceidexpirydate","");
				dataset.setFieldReadOnly("commerceidnew",true);
				dataset.setValue("commerceidnew","");
			}
		}
		if(channel.indexOf("2")!=-1){//POS		
			if(in_country=="SG"){
				dataset.setFieldReadOnly("posid",false);
				dataset.setFieldRequired("posid",false);
				
				dataset.setFieldRequired("posnamesg",true);
				dataset.setFieldReadOnly("posnamesg",false);
			}else{
				dataset.setFieldReadOnly("posid",false);
				dataset.setFieldRequired("posid",true);
			}
			dataset.setFieldReadOnly("posname",false);
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("posidexpirydate",false);
				//dataset.setFieldRequired("posidexpirydate",true);
				//dataset.setFieldReadOnly("posidnew",false);
			}
		}else{
			dataset.setFieldReadOnly("posid",true);
			dataset.setFieldRequired("posid",false);
			dataset.setValue("posid","");
			
			if(in_country=="SG"){
				dataset.setFieldRequired("posnamesg",false);
				dataset.setFieldReadOnly("posnamesg",true);
			}
			dataset.setFieldReadOnly("posname",true);
			dataset.setValue("posname","");
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("posidexpirydate",true);
				//dataset.setFieldRequired("posidexpirydate",false);
				dataset.setValue("posidexpirydate","");
				dataset.setFieldReadOnly("posidnew",true);
				dataset.setValue("posidnew","");
			}
		}
		if(channel.indexOf("3")!=-1){//PayMe
			dataset.setFieldReadOnly("paymeid",false);
			dataset.setFieldRequired("paymeid",true);
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("paymeidexpirydate",false);
				//dataset.setFieldRequired("paymeidexpirydate",true);
				//dataset.setFieldReadOnly("paymeidnew",false);
			}
		}else{
			dataset.setFieldReadOnly("paymeid",true);
			dataset.setFieldRequired("paymeid",false);
			dataset.setValue("paymeid","");
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("paymeidexpirydate",true);
				//dataset.setFieldRequired("paymeidexpirydate",false);
				dataset.setValue("paymeidexpirydate","");
				dataset.setFieldReadOnly("paymeidnew",true);
				dataset.setValue("paymeidnew","");
			}
		}
		if(channel.indexOf("4")!=-1){//Bill Payment
			if(in_country=="SG"){
				dataset.setFieldReadOnly("billpid",false);
				dataset.setFieldRequired("billpid",false);
			}else{
				dataset.setFieldReadOnly("billpid",false);
				dataset.setFieldRequired("billpid",true);
				
				dataset.setFieldReadOnly("merurl",false);
				dataset.setFieldRequired("merurl",true);
			}
			dataset.setFieldReadOnly("billpmode",false);
			dataset.setFieldRequired("billpmode",true);
			if(in_country=="HK"){
				dataset.setFieldReadOnly("billpproxytype",false);
				dataset.setFieldRequired("billpproxytype",true);
				dataset.setFieldReadOnly("billpproxyid",false);
				dataset.setFieldRequired("billpproxyid",true);
				dataset.setFieldReadOnly("billpacct",false);
				dataset.setFieldRequired("billpacct",true);
				McMerinfoList_dataset.setFieldReadOnly("merchantkid",false);
				McMerinfoList_dataset.setFieldRequired("merchantkid",true);
				McMerinfoList_dataset.setFieldReadOnly("hsbckid",false);
				McMerinfoList_dataset.setFieldRequired("hsbckid",true);
				McMerinfoList_dataset.setFieldReadOnly("kid_url",false);
				McMerinfoList_dataset.setFieldRequired("kid_url",true);
			}
			
			if(in_country=="HK"){
				dataset.setFieldReadOnly("billpidexpirydate",false);
				//dataset.setFieldRequired("billpidexpirydate",true);
				//dataset.setFieldReadOnly("billpidnew",false);
			}
		}else{
			dataset.setFieldReadOnly("billpid",true);
			dataset.setFieldRequired("billpid",false);
			dataset.setValue("billpid","");
			
			dataset.setFieldReadOnly("billpmode",true);
			dataset.setFieldRequired("billpmode",false);
			dataset.setValue("billpmode","");
			if(in_country=="HK"){
				dataset.setFieldReadOnly("billpproxytype",true);
				dataset.setFieldRequired("billpproxytype",false);
				dataset.setValue("billpproxytype","");
				dataset.setFieldReadOnly("billpproxyid",true);
				dataset.setFieldRequired("billpproxyid",false);
				dataset.setValue("billpproxyid","");
				dataset.setFieldReadOnly("billpacct",true);
				dataset.setFieldRequired("billpacct",false);
				dataset.setValue("billpacct","");
				McMerinfoList_dataset.setFieldReadOnly("merchantkid",true);
				McMerinfoList_dataset.setFieldRequired("merchantkid",false);
				McMerinfoList_dataset.setFieldReadOnly("hsbckid",true);
				McMerinfoList_dataset.setFieldRequired("hsbckid",false);
				McMerinfoList_dataset.setFieldReadOnly("kid_url",true);
				McMerinfoList_dataset.setFieldRequired("kid_url",false);
				McMerinfoList_dataset.setValue("merchantkid","");
				McMerinfoList_dataset.setValue("hsbckid","");
				McMerinfoList_dataset.setValue("kid_url","");
			}
			if(in_country !="SG"){
				dataset.setFieldReadOnly("merurl",true);
				dataset.setFieldRequired("merurl",false);
				dataset.setValue("merurl","");
			}	
		}
	}
	
	if(field.name=="channelsg"){
		if(in_country=="SG"){
			var channelsg = McMerinfoList_dataset.getValue("channelsg");
			McMerinfoList_dataset.setValue("channel",channelsg);
		}
	}
	
	if(field.name=="meracctsg"){
		if(in_country=="SG"){
			var meracctsg = McMerinfoList_dataset.getValue("meracctsg");
			McMerinfoList_dataset.setValue("meracct",meracctsg);
		}
	}
	
	if(field.name=="merfeeacctsg"){
		if(in_country=="SG"){
			var merfeeacctsg = McMerinfoList_dataset.getValue("merfeeacctsg");
			McMerinfoList_dataset.setValue("merfeeacct",merfeeacctsg);
		}
	}
	
	if(field.name=="supmerid"){
		var obj;
		var supmerid = dataset.getValue("supmerid");
		if(supmerid!=""){
			dwr.engine.setAsync(false);
			hsbcAction.getMasterMerinfo(supmerid,function(data){
				obj = data;
			});
			dwr.engine.setAsync(true);
			if(obj!=""){
				dataset.setFieldReadOnly("aggregator",true);
				dataset.setValue("aggregator",obj[0]);
			}else{
				dataset.setFieldReadOnly("aggregator",true);
				dataset.setValue("aggregator","");
			}
		}else{
			if(count_supmerid>0){
				//dataset.setFieldReadOnly("aggregator",false);
				dataset.setValue("aggregator","");
			}
		}
		count_supmerid++;
	}
	if(field.name=="aggregator"){
		var aggregator = dataset.getValue("aggregator");
		var supmerid = dataset.getValue("supmerid");
		McFeerateUnSelList_dataset.setParameter("aggregator",aggregator);
		McFeerateUnSelList_dataset.setParameter("supmerid",supmerid);
		McFeerateUnSelList_dataset.flushData(1);
		McFeerateSelList_dataset.setParameter("aggregator",aggregator);
		McFeerateSelList_dataset.setParameter("supmerid",supmerid);
		McFeerateSelList_dataset.flushData(1);
	}
	
	if(field.name=="rptype"){
		var rptype = dataset.getValue("rptype");
		if(rptype.indexOf("1")!=-1){
			if(isShowAggregator=="Y"){
				dataset.setFieldRequired("dtltime",true);
			}
		}else{
			dataset.setFieldRequired("dtltime",false);
		}
	}
	if(field.name=="deliverych"){
		var deliverych = dataset.getValue("deliverych");
		if(deliverych.indexOf("RFD")!=-1){
			dataset.setFieldRequired("hsbcnetid",true);
		}else{
			dataset.setFieldRequired("hsbcnetid",false);
		}
		if(deliverych.indexOf("H2H")!=-1){
			dataset.setFieldRequired("hsbcnetid",true);
			dataset.setFieldRequired("connectid",true);
		}else{
			dataset.setFieldRequired("connectid",false);
		}
		if(deliverych.indexOf("Email")!=-1){
			dataset.setFieldRequired("meremail",true);
		}else{
			dataset.setFieldRequired("meremail",false);
		}
	}

	if(field.name=="acctcur"){
		if(in_country=="HK"){
			var acctcur = dataset.getValue("acctcur");
			//if(acctcur!=""&&acctcur!="CNY"&&acctcur!="HKD"){
			//	alert("if Country/Institution is HKHBAP,the currency can only be CNY or HKD");
			//	dataset.setValue("acctcur","");
			//}
		}
	}
}

function aggregator_DropDown_onSelect(dropdown,record,editor){
	var merid = McMerinfoList_dataset.getValue("merid");
	if(merid!=""){
		var flag = false;
		dwr.engine.setAsync(false);
		hsbcAction.isSubMerinfo(merid,function(data){
			flag = data;
		});
		if(flag){
			alert("Not allowed to modify master merchant when sub merchants exist.");
			return false;
		}
	}
	
	var aggregator = record[0];
	var num=0;
	var red = McFeerateSelList_dataset.getFirstRecord();
	while(red){
		var select = red.getValue("select");
		if(select==true){
			num++;
		}
		red = red.getNextRecord();
	}
	if(num>0){
		if(confirm("Confirm to change the aggregator?")){
			return true;
		}else{
			return false;
		}
	}else{
		return true;
	}
}
function btApprove_onClickCheck() {
   	McMerinfoList_dataset.setParameter("op","CHECK");
   	McMerinfoList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	McMerinfoList_dataset.setParameter("op","CHECK");
   	McMerinfoList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McMerinfoList_dataset.flushData(McMerinfoList_dataset.pageIndex);
	window.parent.flushPage();
    closeWin(true);
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");
	McMerinfoList_dataset.flushData(McMerinfoList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin(true);
}
</script>
</@CommonQueryMacro.page>