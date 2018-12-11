<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#include "/templets/ui18nAdd.ftl">
<#assign v_op = RequestParameters["op"]?default("ADD")>
<#assign approvalflag ="${RequestParameters['approvelflag']}">
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<#assign v_isShowAggregator = statics["com.huateng.util.CommUtils"].getAggregatorIsNotNull()?default("Y")>
<#assign v_country = statics["com.huateng.util.CommUtils"].getCountry()?default("")>
<@CommonQueryMacro.page title="商户审核详细信息">
<table width="49%" align="left">
	
	<tr>
        <td>
		<@CommonQueryMacro.CommonQuery id="McMerinfoTmpList" init="true" navigate="false"  submitMode="all">
        	<FIELDSET name='guoup1' style="padding: 4px;">
            <LEGEND extra="groupboxtitle">${Common_Message_after_mod}</LEGEND>
            <table>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.custid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="custid"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.country" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="country" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merid"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mername" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mername" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mertype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mertype"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.supmerid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="supmerid"/></td>
                </tr>
                <#if v_isShowAggregator=="Y">
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.aggregator" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="aggregator"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeetype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeetype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeecycle" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeecycle" /></td>
                </tr>
                <tr>
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
                </tr>
                <#if v_isShowAggregator=="Y">
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeedate" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeedate"/></td>
                </tr>
                </#if>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meracct" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracct"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeeacct" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacct" /></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.acctcur" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="acctcur"/></td>
                </tr>
                <#if v_country=="ID" || v_country=="TH">
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.sharedkey" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="sharedkey"/></td>
                </tr>
                </#if>
               
                <#if v_isShowAggregator=="Y">
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.dtltime" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="dtltime"/></td>
                </tr>
                </#if>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rptype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rptype"/></td>
                    </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rpfmt" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rpfmt" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.deliverych" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="deliverych"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meremail" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meremail"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbcnetid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbcnetid"/></td>
                    </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.connectid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="connectid" /></td>
                </tr>
                 <#if v_country=="HK">
                  <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.remarks" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="remarks" /></td>
                </tr>
                 </#if>
                <#if v_country=="HK">
                <tr>
            		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                </tr>
                <tr>
               		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.channel" /></td>
                    <td class="datatd" width="35%" ><@CommonQueryMacro.SingleField fId="channel"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.paymeid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeid"/></td>
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
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.debtorname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="debtorname"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.permnetid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="permnetid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpacct" /></td>
                	<td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpacct"/></td>
                </tr>
                </#if>
                
                <#if v_country=="SG">
                <tr>
            		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                </tr>
                <tr>
               		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.channel" /></td>
                    <td class="datatd" width="35%" ><@CommonQueryMacro.SingleField fId="channelsg"/></td>
                </tr>
                <tr>
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
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.regincr" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="regincr"/></td>
                </tr>
                </#if>	
            </table>
        	</FIELDSET>
            </@CommonQueryMacro.CommonQuery>
        </td>
	</tr>
	<#if v_isShowAggregator=="Y">
	<tr>
		<td>
		<@CommonQueryMacro.CommonQuery id="McFeerateSelTmpList" init="true" submitMode="selected" navigate="false">
	   	 	<FIELDSET name='guoup2' style="padding: 6px;">
	        <LEGEND extra="groupboxtitle"><@message code="McMerinfoDetail.groupboxtitle2"/></LEGEND>
	        <table frame=void width="100%">
	            <tr>
	                <td valign="top">
	                    <@CommonQueryMacro.DataTable id ="datatable2"  fieldStr="id[66],feetype[110],orgid,country,paytype,feemode,feerate[50]" height="350" width="100%" pagination="false" readonly="false"/>
	                </td>
	            </tr>
	        </table>      
	        </@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<#else>
	<@CommonQueryMacro.CommonQuery id="McFeerateSelTmpList" init="true" submitMode="selected" navigate="false">
    </@CommonQueryMacro.CommonQuery>
    </#if>
	<tr>
		<td align="left">
			<@CommonQueryMacro.Button id= "btBack"/>
			<#if approvalflag == "2">
				<@CommonQueryMacro.Button id= "btApprove"/>
				<@CommonQueryMacro.Button id= "btReject"/>
			</#if>
		</td>
	</tr>
</table>
<table width="49%" align="left">
	<tr>
        <td>
		<@CommonQueryMacro.CommonQuery id="McMerinfoDetailList" init="true" navigate="false"  submitMode="all">
        	<FIELDSET name='guoup3' style="padding: 4px;">
            <LEGEND extra="groupboxtitle">${Common_Message_before_mod}</LEGEND>
            <table>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.custid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="custid"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.country" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="country" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merid"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mername" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mername" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.mertype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="mertype"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.supmerid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="supmerid"/></td>
                </tr>
                <#if v_isShowAggregator=="Y">
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.aggregator" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="aggregator"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeetype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeetype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeecycle" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeecycle" /></td>
                </tr>
                <tr>
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
                </tr>
                <#if v_isShowAggregator=="Y">
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.chlfeedate" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="chlfeedate"/></td>
                </tr>
                </#if>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meracct" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meracct"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merfeeacct" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merfeeacct" /></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.acctcur" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="acctcur"/></td>
                </tr>
                <#if v_country=="ID" || v_country=="TH">
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.sharedkey" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="sharedkey"/></td>
                </tr>
                </#if>
                <#if v_isShowAggregator=="Y">
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.dtltime" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="dtltime"/></td>
                </tr>
                </#if>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rptype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rptype"/></td>
                    </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.rpfmt" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="rpfmt" /></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.deliverych" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="deliverych"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.meremail" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="meremail"/></td>
                </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.hsbcnetid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="hsbcnetid"/></td>
                    </tr>
                <tr>
                    <td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.connectid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="connectid" /></td>
                </tr>
                 <#if v_country=="HK">
                  <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.remarks" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="remarks" /></td>
                </tr>
                </#if>
                <#if v_country=="HK">
                <tr>
            		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                </tr>
                <tr>
               		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.channel" /></td>
                    <td class="datatd" width="35%" ><@CommonQueryMacro.SingleField fId="channel"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.commerceid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="commerceid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.paymeid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="paymeid"/></td>
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
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpproxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpproxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.debtorname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="debtorname"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.permnetid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="permnetid"/></td>
                </tr>
             	<tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpacct" /></td>
                	<td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpacct"/></td>
                </tr>
                </#if>
                
                <#if v_country=="SG">
                <tr>
            		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactname" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactname"/></td>
                </tr>
                <tr>
               		<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.contactinfo" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="contactinfo"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxytype" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxytype"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.proxyid" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="proxyid"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.channel" /></td>
                    <td class="datatd" width="35%" ><@CommonQueryMacro.SingleField fId="channelsg"/></td>
                </tr>
                <tr>
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
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.billpmode" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="billpmode"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.merurl" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="merurl"/></td>
                </tr>
                <tr>
                	<td align="right" nowrap class="labeltd" width="15%"><@message code="McMerinfoList.Field.regincr" /></td>
                    <td class="datatd" width="35%"><@CommonQueryMacro.SingleField fId="regincr"/></td>
                </tr>
                </#if>
            </table>
        	</FIELDSET>
            </@CommonQueryMacro.CommonQuery>
        </td>
	</tr>
	<#if v_isShowAggregator=="Y">
	<tr>
		<td>
		<@CommonQueryMacro.CommonQuery id="McFeerateSelDetailList" init="true" submitMode="selected" navigate="false">
	   	 	<FIELDSET name='guoup4' style="padding: 6px;">
	        <LEGEND extra="groupboxtitle"><@message code="McMerinfoDetail.groupboxtitle2"/></LEGEND>
	        <table frame=void width="100%">
	            <tr>
	                <td valign="top">
	                    <@CommonQueryMacro.DataTable id ="datatable2"  fieldStr="id[66],feetype[110],orgid,country,paytype,feemode,feerate[50]" height="350" width="100%" pagination="false" readonly="false"/>
	                </td>
	            </tr>
	        </table>      
	        </@CommonQueryMacro.CommonQuery>
		</td>
	</tr>
	<#else>
	<@CommonQueryMacro.CommonQuery id="McFeerateSelDetailList" init="true" submitMode="selected" navigate="false">
   	</@CommonQueryMacro.CommonQuery>
	</#if>
</table>
<script language="javascript">
var op = "${v_op}";
var v_country = "${v_country}";
var isShowAggregator = "${v_isShowAggregator}";
function initCallGetter_post(){
	if(op=="detail"){
		McMerinfoTmpList_dataset.setReadOnly(true);
		McFeerateSelTmpList_dataset.setReadOnly(true);
		McMerinfoDetailList_dataset.setReadOnly(true);
		McFeerateSelDetailList_dataset.setReadOnly(true);
		
	if(v_country == "ID" || v_country == "TH"){
		McMerinfoTmpList_dataset.setFieldRequired("sharedkey",true);
	}	
	
	if(v_country == "HK"){
		McMerinfoTmpList_dataset.getValue("rptype");
		McMerinfoTmpList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoTmpList_dataset.setFieldRequired("channel",true);
		McMerinfoTmpList_dataset.setFieldRequired("chlfeecycle",true);
		
		McMerinfoDetailList_dataset.getValue("rptype");
		McMerinfoDetailList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoDetailList_dataset.setFieldRequired("channel",true);
		McMerinfoDetailList_dataset.setFieldRequired("chlfeecycle",true);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("debtorname",true);
		McMerinfoTmpList_dataset.setFieldRequired("debtorname",true);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("debtorname",true);
		McMerinfoDetailList_dataset.setFieldRequired("debtorname",true);
	}
	if(v_country == "SG"){
		McMerinfoTmpList_dataset.getValue("rptype");
		McMerinfoTmpList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoTmpList_dataset.setFieldRequired("channelsg",true);
		
		McMerinfoTmpList_dataset.getValue("proxytype");
		McMerinfoTmpList_dataset.setFieldReadOnly("proxytype",true);
		McMerinfoTmpList_dataset.setFieldRequired("proxytype",true);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("proxyid",true);
		McMerinfoTmpList_dataset.setFieldRequired("proxyid",true);	
		McMerinfoTmpList_dataset.setFieldRequired("regincr",true);	
		
		McMerinfoTmpList_dataset.setFieldReadOnly("merurl",true);
		McMerinfoTmpList_dataset.setFieldRequired("merurl",true);
		//McMerinfoDetailList
		McMerinfoDetailList_dataset.getValue("rptype");
		McMerinfoDetailList_dataset.setFieldReadOnly("rptype",true);
		McMerinfoDetailList_dataset.setFieldRequired("channelsg",true);
		
		McMerinfoDetailList_dataset.getValue("proxytype");
		McMerinfoDetailList_dataset.setFieldReadOnly("proxytype",true);
		McMerinfoDetailList_dataset.setFieldRequired("proxytype",true);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("proxyid",true);
		McMerinfoDetailList_dataset.setFieldRequired("proxyid",true);	
		McMerinfoDetailList_dataset.setFieldRequired("regincr",true);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("merurl",true);
		McMerinfoDetailList_dataset.setFieldRequired("merurl",true);	
	}
		
	if(v_country == "ID" || v_country == "TH"){	
		if(isShowAggregator == 'Y'){
			McMerinfoTmpList_dataset.setFieldRequired("merfeetype",true);
			McMerinfoTmpList_dataset.setFieldRequired("merfeecycle",true);
			McMerinfoTmpList_dataset.setFieldRequired("aggregator",true);
			
			McMerinfoDetailList_dataset.setFieldRequired("merfeetype",true);
			McMerinfoDetailList_dataset.setFieldRequired("merfeecycle",true);
			McMerinfoDetailList_dataset.setFieldRequired("aggregator",true);		
		}
	}
	
	McMerinfoTmpList_dataset.setFieldReadOnly("merid",true);
	McMerinfoTmpList_dataset.setFieldRequired("merid",true);
	
	McMerinfoTmpList_dataset.setFieldReadOnly("meracct",true);
	McMerinfoTmpList_dataset.setFieldRequired("meracct",true);
	
	McMerinfoTmpList_dataset.setFieldReadOnly("merfeeacct",true);
	McMerinfoTmpList_dataset.setFieldRequired("merfeeacct",true);
	
	McMerinfoTmpList_dataset.setFieldReadOnly("acctcur",true);
	McMerinfoTmpList_dataset.setFieldRequired("acctcur",true);
		
	McMerinfoTmpList_dataset.setFieldReadOnly("mername",true);
	McMerinfoTmpList_dataset.setFieldRequired("mername",true);
	//McMerinfoDetailList
	McMerinfoDetailList_dataset.setFieldReadOnly("merid",true);
	McMerinfoDetailList_dataset.setFieldRequired("merid",true);
	
	McMerinfoDetailList_dataset.setFieldReadOnly("meracct",true);
	McMerinfoDetailList_dataset.setFieldRequired("meracct",true);
	
	McMerinfoDetailList_dataset.setFieldReadOnly("merfeeacct",true);
	McMerinfoDetailList_dataset.setFieldRequired("merfeeacct",true);
	
	McMerinfoDetailList_dataset.setFieldReadOnly("acctcur",true);
	McMerinfoDetailList_dataset.setFieldRequired("acctcur",true);
	
	McMerinfoDetailList_dataset.setFieldReadOnly("mername",true);
	McMerinfoDetailList_dataset.setFieldRequired("mername",true);
	
	var merfeecycle = McMerinfoTmpList_dataset.getValue("merfeecycle");
	if(merfeecycle=="2"){
		McMerinfoTmpList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("merfeedate",true);	
			
		McMerinfoTmpList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("chlfeedate",true);	
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("merfeedate",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("chlfeedate",false);
	}	
	var deliverych = McMerinfoTmpList_dataset.getValue("deliverych");
	if(deliverych.indexOf("RFD")!=-1){
		McMerinfoTmpList_dataset.setFieldRequired("hsbcnetid",true);
	}else{
		McMerinfoTmpList_dataset.setFieldRequired("hsbcnetid",false);
	}
	if(deliverych.indexOf("H2H")!=-1){
		McMerinfoTmpList_dataset.setFieldRequired("hsbcnetid",true);
		McMerinfoTmpList_dataset.setFieldRequired("connectid",true);
	}else{
		McMerinfoTmpList_dataset.setFieldRequired("connectid",false);
	}
	if(deliverych.indexOf("Email")!=-1){
		McMerinfoTmpList_dataset.setFieldRequired("meremail",true);
	}else{
		McMerinfoTmpList_dataset.setFieldRequired("meremail",false);
	}
		
	var chlfeecycle = McMerinfoTmpList_dataset.getValue("chlfeecycle");
	if(chlfeecycle=="2"){
		McMerinfoTmpList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoTmpList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoTmpList_dataset.setValue("chlfeedate","");
	}

	var mertype = McMerinfoTmpList_dataset.getValue("mertype");
	if(mertype=="2"){
		McMerinfoTmpList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoTmpList_dataset.setFieldRequired("supmerid",true);
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoTmpList_dataset.setFieldRequired("supmerid",false);
	}
	var channel = McMerinfoTmpList_dataset.getValue("channel");
	if(v_country=="HK"){
		if(channel.indexOf("1")!=-1||channel.indexOf("2")!=-1||channel.indexOf("3")!=-1){
			McMerinfoTmpList_dataset.setFieldRequired("proxytype",true);
			McMerinfoTmpList_dataset.setFieldRequired("proxyid",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("proxyid",true);
		}else{
			McMerinfoTmpList_dataset.setFieldRequired("proxytype",false);
			McMerinfoTmpList_dataset.setFieldRequired("proxyid",false);
			McMerinfoTmpList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("proxyid",true);
		}
		if(channel.indexOf("2")!=-1){
			McMerinfoTmpList_dataset.setFieldRequired("permnetid",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("permnetid",false);
		}else{
			McMerinfoTmpList_dataset.setFieldRequired("permnetid",false);
			McMerinfoTmpList_dataset.setFieldReadOnly("permnetid",true);
		}
	}
	if(channel.indexOf("1")!=-1){
		if(v_country=="SG"){
			McMerinfoTmpList_dataset.setFieldReadOnly("commerceid",true);
			McMerinfoTmpList_dataset.setFieldRequired("commerceid",false);
		}else{
			McMerinfoTmpList_dataset.setFieldReadOnly("commerceid",false);
			McMerinfoTmpList_dataset.setFieldRequired("commerceid",true);
		}
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("commerceid",true);
		McMerinfoTmpList_dataset.setFieldRequired("commerceid",false);
	}
	if(channel.indexOf("2")!=-1){
		if(v_country=="HK"){
		McMerinfoTmpList_dataset.setFieldReadOnly("permnetid",true);
		McMerinfoTmpList_dataset.setFieldRequired("permnetid",true);
		}
		if(v_country=="SG"){
			McMerinfoTmpList_dataset.setFieldReadOnly("posid",true);
			McMerinfoTmpList_dataset.setFieldRequired("posid",false);
		}else{
			McMerinfoTmpList_dataset.setFieldReadOnly("posid",true);
			McMerinfoTmpList_dataset.setFieldRequired("posid",true);
		}		
		McMerinfoTmpList_dataset.setFieldReadOnly("posname",true);
		McMerinfoTmpList_dataset.setFieldRequired("posname",true);
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("permnetid",true);
		McMerinfoTmpList_dataset.setFieldRequired("permnetid",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("posid",true);
		McMerinfoTmpList_dataset.setFieldRequired("posid",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("posname",true);
		McMerinfoTmpList_dataset.setFieldRequired("posname",false);
		
	}
	if(channel.indexOf("3")!=-1){
		McMerinfoTmpList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoTmpList_dataset.setFieldRequired("paymeid",true);
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoTmpList_dataset.setFieldRequired("paymeid",false);
		
	}
	if(channel.indexOf("4")!=-1){
		if(v_country=="SG"){
			McMerinfoTmpList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoTmpList_dataset.setFieldRequired("billpid",false);
		}else{
			McMerinfoTmpList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoTmpList_dataset.setFieldRequired("billpid",true);
			
			McMerinfoTmpList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoTmpList_dataset.setFieldRequired("merurl",true);
		}		
		
		McMerinfoTmpList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpmode",true);
		
		if(v_country=="HK"){
			McMerinfoTmpList_dataset.setFieldReadOnly("billpproxytype",true);
			McMerinfoTmpList_dataset.setFieldRequired("billpproxytype",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("billpproxyid",true);
			McMerinfoTmpList_dataset.setFieldRequired("billpproxyid",true);
			McMerinfoTmpList_dataset.setFieldReadOnly("billpacct",true);
			McMerinfoTmpList_dataset.setFieldRequired("billpacct",true);
		}
	}else{
		McMerinfoTmpList_dataset.setFieldReadOnly("billpid",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpid",false);
		if(v_country !="SG"){
			McMerinfoTmpList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoTmpList_dataset.setFieldRequired("merurl",false);
		}
		
		McMerinfoTmpList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpmode",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpproxytype",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpproxyid",false);
		
		McMerinfoTmpList_dataset.setFieldReadOnly("billpacct",true);
		McMerinfoTmpList_dataset.setFieldRequired("billpacct",false);
	}
	var billpid = McMerinfoTmpList_dataset.getValue("billpid");
	if(billpid==""){
		McMerinfoTmpList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoTmpList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoTmpList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoTmpList_dataset.setFieldReadOnly("billpacct",true);
	}
	
	//McMerinfoDetailList
	var merfeecycleorg = McMerinfoDetailList_dataset.getValue("merfeecycle");
	if(merfeecycleorg=="2"){
		McMerinfoDetailList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("merfeedate",true);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("chlfeedate",true);	
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("merfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("merfeedate",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("chlfeedate",false);	
	}	
	var deliverychorg = McMerinfoDetailList_dataset.getValue("deliverych");
	if(deliverychorg.indexOf("RFD")!=-1){
		McMerinfoDetailList_dataset.setFieldRequired("hsbcnetid",true);
	}else{
		McMerinfoDetailList_dataset.setFieldRequired("hsbcnetid",false);
	}
	if(deliverychorg.indexOf("H2H")!=-1){
		McMerinfoDetailList_dataset.setFieldRequired("hsbcnetid",true);
		McMerinfoDetailList_dataset.setFieldRequired("connectid",true);
	}else{
		McMerinfoDetailList_dataset.setFieldRequired("connectid",false);
	}
	if(deliverychorg.indexOf("Email")!=-1){
		McMerinfoDetailList_dataset.setFieldRequired("meremail",true);
	}else{
		McMerinfoDetailList_dataset.setFieldRequired("meremail",false);
	}
		
	var chlfeecycleorg = McMerinfoDetailList_dataset.getValue("chlfeecycle");
	if(chlfeecycleorg=="2"){
		McMerinfoDetailList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("chlfeedate",true);
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("chlfeedate",true);
		McMerinfoDetailList_dataset.setFieldRequired("chlfeedate",false);
		McMerinfoDetailList_dataset.setValue("chlfeedate","");
	}

	var mertypeorg = McMerinfoDetailList_dataset.getValue("mertype");
	if(mertypeorg=="2"){
		McMerinfoDetailList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoDetailList_dataset.setFieldRequired("supmerid",true);
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("supmerid",true);
		McMerinfoDetailList_dataset.setFieldRequired("supmerid",false);
	}
	var channelorg = McMerinfoDetailList_dataset.getValue("channel");
	if(v_country=="HK"){
		if(channelorg.indexOf("1")!=-1||channelorg.indexOf("2")!=-1||channelorg.indexOf("3")!=-1){
			McMerinfoDetailList_dataset.setFieldRequired("proxytype",true);
			McMerinfoDetailList_dataset.setFieldRequired("proxyid",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("proxyid",true);
		}else{
			McMerinfoDetailList_dataset.setFieldRequired("proxytype",false);
			McMerinfoDetailList_dataset.setFieldRequired("proxyid",false);
			McMerinfoDetailList_dataset.setFieldReadOnly("proxytype",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("proxyid",true);
		}
		if(channelorg.indexOf("2")!=-1){
			McMerinfoDetailList_dataset.setFieldRequired("permnetid",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("permnetid",false);
		}else{
			McMerinfoDetailList_dataset.setFieldRequired("permnetid",false);
			McMerinfoDetailList_dataset.setFieldReadOnly("permnetid",true);
		}
	}
	if(channelorg.indexOf("1")!=-1){
		if(v_country=="SG"){
			McMerinfoDetailList_dataset.setFieldReadOnly("commerceid",true);
			McMerinfoDetailList_dataset.setFieldRequired("commerceid",false);
		}else{
			McMerinfoDetailList_dataset.setFieldReadOnly("commerceid",true);
			McMerinfoDetailList_dataset.setFieldRequired("commerceid",true);
		}
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("commerceid",true);
		McMerinfoDetailList_dataset.setFieldRequired("commerceid",false);
	}
	if(channelorg.indexOf("2")!=-1){
		if(v_country=="HK"){
		McMerinfoDetailList_dataset.setFieldReadOnly("permnetid",true);
		McMerinfoDetailList_dataset.setFieldRequired("permnetid",true);
		}
		if(v_country=="SG"){
			McMerinfoDetailList_dataset.setFieldReadOnly("posid",true);
			McMerinfoDetailList_dataset.setFieldRequired("posid",false);
		}else{
			McMerinfoDetailList_dataset.setFieldReadOnly("posid",true);
			McMerinfoDetailList_dataset.setFieldRequired("posid",true);
		}
		
		McMerinfoDetailList_dataset.setFieldReadOnly("posname",true);
		McMerinfoDetailList_dataset.setFieldRequired("posname",true);
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("permnetid",true);
		McMerinfoDetailList_dataset.setFieldRequired("permnetid",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("posid",true);
		McMerinfoDetailList_dataset.setFieldRequired("posid",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("posname",true);
		McMerinfoDetailList_dataset.setFieldRequired("posname",false);
		
	}
	if(channelorg.indexOf("3")!=-1){
		McMerinfoDetailList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoDetailList_dataset.setFieldRequired("paymeid",true);
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("paymeid",true);
		McMerinfoDetailList_dataset.setFieldRequired("paymeid",false);
		
	}
	if(channelorg.indexOf("4")!=-1){
		if(v_country=="SG"){
			McMerinfoDetailList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoDetailList_dataset.setFieldRequired("billpid",false);
		}else{
			McMerinfoDetailList_dataset.setFieldReadOnly("billpid",true);
			McMerinfoDetailList_dataset.setFieldRequired("billpid",true);
			
			McMerinfoDetailList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoDetailList_dataset.setFieldRequired("merurl",true);
		}
			
		McMerinfoDetailList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpmode",true);
		
		if(v_country=="HK"){
			McMerinfoDetailList_dataset.setFieldReadOnly("billpproxytype",true);
			McMerinfoDetailList_dataset.setFieldRequired("billpproxytype",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("billpproxyid",true);
			McMerinfoDetailList_dataset.setFieldRequired("billpproxyid",true);
			McMerinfoDetailList_dataset.setFieldReadOnly("billpacct",true);
			McMerinfoDetailList_dataset.setFieldRequired("billpacct",true);
		}
	}else{
		McMerinfoDetailList_dataset.setFieldReadOnly("billpid",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpid",false);
		if(v_country !="SG"){
			McMerinfoDetailList_dataset.setFieldReadOnly("merurl",true);
			McMerinfoDetailList_dataset.setFieldRequired("merurl",false);
		}
				
		McMerinfoDetailList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpmode",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpproxytype",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpproxyid",false);
		
		McMerinfoDetailList_dataset.setFieldReadOnly("billpacct",true);
		McMerinfoDetailList_dataset.setFieldRequired("billpacct",false);
	}
	var billpidorg = McMerinfoDetailList_dataset.getValue("billpid");
	if(billpidorg==""){
		McMerinfoDetailList_dataset.setFieldReadOnly("billpmode",true);
		McMerinfoDetailList_dataset.setFieldReadOnly("billpproxytype",true);
		McMerinfoDetailList_dataset.setFieldReadOnly("billpproxyid",true);
		McMerinfoDetailList_dataset.setFieldReadOnly("billpacct",true);
	}
	
	}
	
	highlight(McMerinfoTmpList_dataset,McMerinfoDetailList_dataset);
	highlightTableMer(McFeerateSelTmpList_dataset,McFeerateSelDetailList_dataset,"id");
//	highlightTableMer(McFeerateSelTmpList_dataset,McFeerateSelDetailList_dataset,["orgid","feetype","paytype"]);
}
function btBack_onClick(button) {
	 closeWin();
}
function btApprove_onClickCheck() {
   	McMerinfoTmpList_dataset.setParameter("op","CHECK");
   	McMerinfoTmpList_dataset.setParameter("approveStatusChoose","01");
   	return true;
}

function btReject_onClickCheck() {
   	McMerinfoTmpList_dataset.setParameter("op","CHECK");
   	McMerinfoTmpList_dataset.setParameter("approveStatusChoose","02");
   	return true;
}

function btApprove_postSubmit(button){
    alert("${Common_Message_Success}");
	McMerinfoTmpList_dataset.flushData(McMerinfoTmpList_dataset.pageIndex);
	window.parent.flushPage();
    closeWin();
}
function btReject_postSubmit(button){
    alert("${Common_Message_Success}");    
	McMerinfoTmpList_dataset.flushData(McMerinfoTmpList_dataset.pageIndex);
	window.parent.flushPage();
	closeWin();
}	
//刷新数据
function flushPage(){
	McMerinfoTmpList_dataset.flushData(McMerinfoTmpList_dataset.pageIndex);
}
//定位一条记录
function locate(id){
    var record = McMerinfoTmpList_dataset.find(["id"], [id]);
    if (record) {
        McMerinfoTmpList_dataset.setRecord(record);
    }
}
</script>
</@CommonQueryMacro.page>