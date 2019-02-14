<#import "/templets/commonQuery/CommonQueryTagMacro.ftl" as CommonQueryMacro>
<#import "/templets/ui18n.ftl" as ui18n />
<#include "/templets/ui18nAdd.ftl">
<@CommonQueryMacro.page title="Static QR Code Generation">
<@CommonQueryMacro.CommonQuery id="staticQrCode" init="true" submitMode="selected">
<#assign v_brno = statics["com.huateng.ebank.business.common.GlobalInfo"].getCurrentInstance().getBrno()?default('')>
<script type='text/javascript' src='${contextPath}/dwr/interface/generateQrCodeAction.js'> </script>
<script type='text/javascript' src='${contextPath}/dwr/interface/CheckAction.js'> </script>
<table width="100%">
	<tr>
      	<td align="left">
		<@CommonQueryMacro.GroupBox id="guoupbox1"  expand="true">
			<table align="center"  width="100%">
		         <tr>
			      	<td  align="left">
							<@CommonQueryMacro.Group id="group1" label="Static QR Code Generation" labelwidth="10%" fieldStr="qmerid,mername,qtransedit,qamt,qdate,proxyvalue,qtransno,blank" colNm="4"/></br>
			        </td>
	   			 </tr>
				<tr>
					<td align="center">
						<@CommonQueryMacro.SimpleButton id="btSave" desc="Generate"/>
						<!-- <@CommonQueryMacro.SimpleButton id="btLoad" desc="Download"/> -->
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
			             <image id="imgg"  src="data:image/png;base64," style="display: block;"/>
					</div>
				</div>
		</td>
	</tr>
</table>
</@CommonQueryMacro.CommonQuery>
<script language="javascript">

	var _MerName_proxyUEN;
	var _transno = "";
    function initCallGetter_post(){
    	$("#editor_blank").remove();
    	staticQrCode_dataset.setValue("qtransedit","Y");
    	//staticQrCode_dataset.setValue("qmerid","");
    }
    Date.prototype.Format = function (fmt) { // 
	    var o = {
	        "M+": this.getMonth() + 1, // 月份
	        "d+": this.getDate(), // 日
	        "h+": this.getHours(), // 小时
	        "m+": this.getMinutes(), // 分
	        "s+": this.getSeconds(), // 秒
	        "q+": Math.floor((this.getMonth() + 3) / 3), // 季度
	        "S": this.getMilliseconds() // 毫秒
	    };
	    if (/(y+)/.test(fmt))
	        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
	}
    function btLoad_onClick(){
    	var qrcode = document.getElementById('vqrcode');
        var img = qrcode.getElementsByTagName('image')[0];
        var link = document.createElement("a");
        var imgUrl = img.getAttribute("src");
    	if (window.navigator.msSaveOrOpenBlob) {
		  var bstr = atob(imgUrl.split(',')[1])
		  var n = bstr.length
		  var u8arr = new Uint8Array(n)
		  while (n--) {
		   u8arr[n] = bstr.charCodeAt(n)
		  }
		  var blob = new Blob([u8arr])
		  var fileName;
		  if(_transno == ""){
		      fileName = _MerName_proxyUEN;
		  }else{
		      fileName = _MerName_proxyUEN + "-" + _transno;
		  }
		  window.navigator.msSaveOrOpenBlob(blob, fileName + '.' + 'png')
		}
    }
    function btSave_onClick(){
    	var merid = staticQrCode_dataset.getValue("qmerid");
    	var expirydate = staticQrCode_dataset.getValue("qdate");
    	var transno = staticQrCode_dataset.getValue("qtransno");
    	_transno = transno;
    	var amt = staticQrCode_dataset.getValue("qamt");
    	var amtedit = staticQrCode_dataset.getValue("qtransedit");
    	var mername = staticQrCode_dataset.getValue("mername");
    	var proxyvalue = staticQrCode_dataset.getValue("proxyvalue");
    	var flag = 0;
    	if(merid == ""){
    		alert("Merchant ID  is empty!");
    		return false;
    	}
    	if(amtedit == "N" && amt == ""){
    		alert("Transaction Amount should be provided!");
    		return false;
    	}
    	_MerName_proxyUEN = mername+"_"+proxyvalue;
    	
    	/*
    	dwr.engine.setAsync(false);
    	generateQrCodeAction.checkMerID(merid,function(data){
    		if(data == "-1"){
    			alert("Merchant ID  does not exist!");
    			flag = 1;
    		}else{
    			_MerName_proxyUEN = data;
    		}
    	});
    	if(flag == 1){//商户号不存在
    		return false;
    	}
    	dwr.engine.setAsync(true);
    	*/
    	
    	dwr.engine.setAsync(false);
    	//生成二维码
		generateQrCodeAction.generate(merid,expirydate,transno,amt,amtedit,mername,proxyvalue,function(data){
			//$("#play").show();
			//document.getElementById("imgg").src = "data:image/png;base64,"+ data;
		});
		dwr.engine.setAsync(true);
		//生成pdf的文件名
		var fileName;
		if(_transno == ""){
		      fileName = _MerName_proxyUEN;
		 }else{
		      fileName = _MerName_proxyUEN + "_" + _transno;
		 }
		window.location.href = "${contextPath}/dwr/DownFileAction.do?filename="+fileName+ '.' + 'pdf';
    }
    function staticQrCode_dataset_afterChange(dataset,field){
    	if(field.name=="qtransedit"){
    		qtransedit = dataset.getValue("qtransedit");
    		if(qtransedit == "Y"){
    			dataset.setFieldReadOnly("qamt",true);
    			dataset.setFieldRequired("qamt",false);
    		}else{
    			dataset.setFieldReadOnly("qamt",false);
    			dataset.setFieldRequired("qamt",true);
    		}
    	}
    }
</script>
</@CommonQueryMacro.page>