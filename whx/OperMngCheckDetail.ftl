<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<#assign st=RequestParameters["st"]?default("")>
<#assign flag=RequestParameters["flag"]?default("")>
<#assign tskId=RequestParameters["tskId"]?default("")>
<@CommonQueryMacro.page title="操作员角色管理">

<table width="100%" align="left">
    <tr>
        <td width="50%" valign="top">
            <table align="left" width="100%">
                <tr align="center">
                    <td width="100%" valign="top">
                        <@CommonQueryMacro.CommonQuery id="operMngModCom" init="true" navigate="false" submitMode="all" >
                            <table frame=void class="grouptable" width="100%">
                                <tr>
                                    <td id="oldHead" nowrap colspan="4"
                                        style="BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; PADDING-LEFT: 10px; BACKGROUND: #d6e5f8; HEIGHT: 25px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid"
                                        align="center"> <@message code="OperMngCheckDetail.CommonQuery.oldHead" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="OperMngModCom.Field.tlrno" /></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="tlrno"/></td>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="OperMngModCom.Field.tlrName" /></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="tlrName" /></td>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%"><@message code="OperMngModCom.Field.contactWay" /></td>
                                    <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="contactWay"/></td>
                                	<td align="center" nowrap class="labeltd" width="25%"><@message code="OperMngModCom.Field.email" /></td>
                                    <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="email"/></td>
                                </tr>
                            </table>
                        </@CommonQueryMacro.CommonQuery>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <@CommonQueryMacro.CommonQuery id="operMngRoleInfoCom" init="true" submitMode="current" navigate="false">
                            <@CommonQueryMacro.GroupBox id="guoup2" label="${ROLE_INFORMATION}" expand="true">
                                <table frame=void width="100%">
                                    <tr>
                                        <td valign="top">
                                            <@CommonQueryMacro.DataTable id ="datatable1" fieldStr="roleId[160],roleName[450]" hasFrame="true" height="300" width="100%" readonly="false"/>
                                        </td>
                                    </tr>
                                </table>
                            </@CommonQueryMacro.GroupBox>
                            <br>
                        <#--<table width="100%">-->
                        <#--<tr>-->
                        <#--<td colspan="5" align="right">-->
                        <#--<@CommonQueryMacro.Button id= "btCancel" />-->
                        <#--</td>-->
                        <#--</tr>-->
                        <#--</table>-->
                        </@CommonQueryMacro.CommonQuery>
                    </td>
                </tr>
            </table>
        </td>
        <td width="50%" valign="top">
            <table align="left" width="100%" id="comSeri">
                <tr align="center" id="ComSeri1">
                    <td width="100%">
                        <@CommonQueryMacro.CommonQuery id="operMngModComSeri" init="true" navigate="false" submitMode="all" >
                            <table frame=void class="grouptable" width="100%">
                                <tr>
                                    <td nowrap colspan="4"
                                        style="BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; PADDING-LEFT: 10px; BACKGROUND: #d6e5f8; HEIGHT: 25px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid"
                                        align="center"> <@message code="OperMngCheckDetail.CommonQuery.comSeri" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="OperMngModComSeri.Field.tlrno"/></td>
                                    <td class="datatd" width="25%"><@CommonQueryMacro.SingleField fId="tlrno"/></td>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="OperMngModComSeri.Field.tlrName"/></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="tlrName" /></td>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%"><@message code="OperMngModComSeri.Field.contactWay"/></td>
                                    <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="contactWay"/></td>
                                	<td align="center" nowrap class="labeltd" width="25%"><@message code="OperMngModComSeri.Field.email"/></td>
                                    <td class="datatd" nowrap><@CommonQueryMacro.SingleField fId="email"/></td>
                                </tr>
                            </table>
                        </@CommonQueryMacro.CommonQuery>
                    </td>
                </tr>
                <tr id="ComSeri3">
                    <td width="100%">
                        <@CommonQueryMacro.CommonQuery id="operMngRoleInfoComSeri" init="true" submitMode="current" navigate="false">
                            <@CommonQueryMacro.GroupBox id="guoup2" label="${ROLE_INFORMATION}" expand="true">
                                <table frame=void width="100%">
                                    <tr>
                                        <td valign="top">
                                            <@CommonQueryMacro.DataTable id ="datatable1" fieldStr="roleId[160],roleName[450]" hasFrame="true" height="300" width="100%" readonly="false"/>
                                        </td>
                                    </tr>
                                </table>
                            </@CommonQueryMacro.GroupBox>
                        </@CommonQueryMacro.CommonQuery>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <@CommonQueryMacro.CommonQuery id="OperMngCheckDetail" init="false" navigate="false" submitMode="current">
        <tr>
            <td colspan="2">
                <table align="center" width="100%">
                    <tr>
                        <td align="left">
                            <@CommonQueryMacro.Button id= "btClose" />
                            <@CommonQueryMacro.Button id= "btApprove" />
                            <@CommonQueryMacro.Button id= "btReject" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </@CommonQueryMacro.CommonQuery>
</table>
<script language="javascript">
    var st = "${st}";
    var flag = "${flag}";
    var tskId = "${tskId}";
    function initCallGetter_post(dataset) {
    	highlightUser(operMngModComSeri_dataset,operMngModCom_dataset,1);
	   	highlightTableMer(operMngRoleInfoComSeri_dataset,operMngRoleInfoCom_dataset,"roleId");
       if (st == "1" || st == "3") {
            document.getElementById("comSeri").style.display = "none";
            document.getElementById("oldHead").style.display = "none";
       }
       
        OperMngCheckDetail_dataset.setValue("tskId",tskId);
    }

    function btApprove_needCheck() {
        return false;
    }

    function btReject_needCheck() {
        return false;
    }


    function btApprove_postSubmit() {
       	alert("${AUDIT_THROUGH_SUCCESS}")
        closeWin(true);
        return false;
    }

    function btReject_postSubmit() {
        alert("${REVIEW_REJECTS_SUCCESS}")
        closeWin(true);
        return false;
    }

    function btClose_onClickCheck() {
        closeWin(true);
    }
</script>
</@CommonQueryMacro.page>
