<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="Static QR Code">
<@CommonQueryMacro.CommonQuery id="staticQrCode" init="true" submitMode="selected">
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<script type='text/javascript' src='${contextPath}/dwr/interface/generateQrCodeAction.js'> </script>
<table width="100%">
	<tr>
      	<td align="left">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true">
			<table align="center"  width="100%">
		         <tr>
			      	<td  align="left">
							<@CommonQueryMacro.Group id="group1" label="Static QR Code" labelwidth="10%" fieldStr="qmerid,qtransedit,qdate,qamt,qtransno,blank" colNm="4"/></br>
			        </td>
	   			 </tr>
				<tr>
					<td align="center">
						<@CommonQueryMacro.SimpleButton id="btSave" desc="Generate"/>
					</td>
				</tr>
			</table>
		</@CommonQueryMacro.GroupBox>
		</td>
	</tr>
</table>
<table width="100%">
	<tr>
		<td align="center">
				<div id="play" style="text-align: center;display: none" >
					<div id="vqrcode"
						style="width: 256px; height: 256px; margin-top: 15px;">
			             <image id="imgg"  src="data:image/png;base64,"/>
					</div>
				</div>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">

	
    function initCallGetter_post(){
    	$("#editor_blank").remove();
    	staticQrCode_dataset.setValue("qmerid","5822");
    	staticQrCode_dataset.setValue("qtransno","12312312");
    	staticQrCode_dataset.setValue("qtransedit","Y");
    }
    function btSave_onClick(){
    
    	var merid = staticQrCode_dataset.getValue("qmerid");
    	var expirydate = staticQrCode_dataset.getValue("qdate");
    	var transno = staticQrCode_dataset.getValue("qtransno");
    	var amt = staticQrCode_dataset.getValue("qamt");
    	var amtedit = staticQrCode_dataset.getValue("qtransedit");
    	dwr.engine.setAsync(false);
    	//生成二维码
		generateQrCodeAction.generate(merid,expirydate,transno,amt,amtedit,function(data){
			$("#play").show();
			document.getElementById("imgg").src = "data:image/png;base64,"+ data;
		});
		dwr.engine.setAsync(true);
    }
    function staticQrCode_dataset_afterChange(dataset,field){
    	if(field.name=="qtransedit"){
    		qtransedit = dataset.getValue("qtransedit");
    		if(qtransedit == "Y"){
    			dataset.setFieldReadOnly("qamt",true);
    		}else{
    			dataset.setFieldReadOnly("qamt",false);
    		}
    	}
    }
</script>
</@CommonQueryMacro.page>