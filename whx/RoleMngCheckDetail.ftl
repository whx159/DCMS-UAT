<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<#assign id=RequestParameters['id']?default('') />
<#assign updTransCd=RequestParameters['updTransCd']?default('') />
<@CommonQueryMacro.page title="${ROLE_PERMISSION_MANAGEMENT}">
    <@CommonQueryMacro.CommonQuery id="RoleMngCheckDetail" init="true" navigate="false" submitMode="current">

    <table align="left" border="0" width="100%">
        <tr>
            <#if updTransCd == "02" >
            <td width="50%">
                <table width="100%">
                    <tr>
                        <td width="100%">
                            <table class="grouptable" width="100%">
                                <tr>
                                    <td id="oldHead" nowrap colspan="4"
                                        style="BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; PADDING-LEFT: 10px; BACKGROUND: #d6e5f8; HEIGHT: 25px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid"
                                        align="center"> <@message code="Common.Message.before.mod" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%" colNm=4> <@message code="RoleMngCheckDetail.Field.old_roleid"/></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="old_roleid"/></td>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="RoleMngCheckDetail.Field.old_roleName"/></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="old_roleName" /></td>
                                </tr>
                                <tr>
                                    
                                </tr>

                                <tr>
                                </tr>

                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" align="left" height="300" valign="top" style="boerder:1px solid #ededed">
                            <iframe id="frame1" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
            </#if>
            <td width="50%">
                <table width="100%" id="comSeri">
                    <tr>
                        <td width="100%">
                            <table class="grouptable" width="100%">
                                <tr>
                                    <#if updTransCd == "02" >
                                        <td nowrap colspan="4"
                                            style="BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; PADDING-LEFT: 10px; BACKGROUND: #d6e5f8; HEIGHT: 25px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid"
                                            align="center"> <@message code="Common.Message.after.mod" />
                                        </td>
                                    <#else>
                                        <td nowrap colspan="4"
                                            style="BORDER-BOTTOM: #ccc 1px solid; TEXT-ALIGN: center; BORDER-LEFT: #ccc 1px solid; PADDING-LEFT: 10px; BACKGROUND: #d6e5f8; HEIGHT: 25px; BORDER-TOP: #ccc 1px solid; BORDER-RIGHT: #ccc 1px solid"
                                            align="center">
                                        </td>
                                    </#if>
                                </tr>
                                <tr>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="RoleMngCheckDetail.Field.new_roleid"/></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="new_roleid"/></td>
                                    <td align="center" nowrap class="labeltd" width="25%"> <@message code="RoleMngCheckDetail.Field.new_roleName"/></td>
                                    <td class="datatd"
                                        width="25%"><@CommonQueryMacro.SingleField fId="new_roleName" /></td>
                                </tr>
                                <tr>
                                   
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" align="left" height="300" valign="top" style="boerder:1px solid #ededed">
                            <iframe id="frame2" height="100%" width="100%" scrolling="auto" frameborder="0"></iframe>
                        </td>
                    </tr>
                </table>
            </td>
            <#if updTransCd != "02" >
                <td width="50%"></td>
            </#if>
        </tr>
        <tr>
            <td colspan="2">
                <table align="left" width="100%">
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
    </table>
    </@CommonQueryMacro.CommonQuery>

<script language="javascript">
var updTransCd_js = "${updTransCd}";
    function load() {
        RoleFuncMng_dataset.setFieldReadOnly("rolename", false);
    }

    function initCallGetter_post() {
    	if(updTransCd_js=="02"){
			highlightRole(RoleMngCheckDetail_dataset);
		}
        var id = "${id}";
        if ("${updTransCd}" == "02"){
            var roleId = RoleMngCheckDetail_dataset.getValue("old_roleid");
            document.getElementById("frame1").src = "${contextPath}/fpages/system/ftl/RoleMngCheckDetailFuncBefore.ftl?roleId=" + roleId;
        }
        document.getElementById("frame2").src = "${contextPath}/fpages/system/ftl/RoleMngCheckDetailFuncAfter.ftl?id=" + id+"&roleId=" + roleId;
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
