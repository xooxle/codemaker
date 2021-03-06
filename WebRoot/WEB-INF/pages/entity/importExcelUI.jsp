<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/public/forAll.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<title>实体导入</title>
        <script type="text/javascript">		  
		  function checkForm(){
		   		    if($("#excelFile").val()==""){
		   		    	alertMsg("<center>请选择Excel文件</center>");
		   		    	return false;
		   		    }
		   		    if($("#checkRepeat").get(0).checked){
		   		    	var checkedOne = false;
		   		    	for(var i=0;i<$("input[name=optionalIds]").length;i++){
		   		    		if($("input[name=optionalIds]")[i].checked){
		   		    			checkedOne=true;
		   		    			break;
		   		    		} 
		   		    	}
		   		    	if(!checkedOne){
		   		    		alertMsg("<center>请选择要验证的字段</center>");
			   		    	return false;
		   		    	}
		   		    }
		   		    if(checkFile()){
			   		    $("#dialog-modal2").dialog({
			   		    	modal: true,
			   		    	width:800, 
			   		    	height:300
			   		    });
			   		    $("#progressFrame").attr("src","${basePath}entity_importProgress.action");
			   		     window.setTimeout(function(){
			   		    	$("#formAction").get(0).submit();
			   		    },2000);
		   		   		return false;
		   		    }
		   		    return false;
		  }
		  function checkFile(){
		    var val = $("#excelFile").val();
		    val = val.toLowerCase();
		  	if(!endsWith(val,"xls")){
		  		alertMsg("文件格式错误，仅支持xls格式。");
		  		return false;
		  	}
		  	return true;
		  }
		  function endsWith(source,pattern){
		  	return  source.substring(source.length-pattern.length)===pattern;
		  }
	</script>
	</head>
	<body class="ui-widget-content">
	
	<table width="100%">
	  <tr style="border:1px solid red">
		  <td class="ui-icon ui-icon-circle-triangle-e" width="16px">&nbsp;</td>
		  <td>实体导入</td>
	  </tr>
	</table>
	
    <form id="formAction" action="${basePath}entity_importExcel.action" method="post" enctype="multipart/form-data">
  	    <input type="hidden" name="formTimeId" value="${formTimeId}" /> 
    	<div class="ItemBlockBorder">
		<div class="ItemBlock">
		<table width="100%">
    		<tr>
					 	<td width="10%" align="right">Excel文件：</td>
					 	<td>
					 		<input type="file" name="excelFile" id="excelFile"  onchange="checkFile();" class="InputStyle" style="width:60%"/>
					 	</td>
					</tr>     
					<tr> 
						<td align="right"><input name="checkRepeat" id="checkRepeat" value="1" type="checkbox" onclick="$('#ci').toggle();"/></td>
						<td><label for="checkRepeat">非重复验证</label></td>
					</tr>
					<tr id="ci" style="display:none;">
					    <td align="right">
					       选择字段：
					    </td>
					    <td>
					       <div id="cichk">
<input type="checkbox" name="optionalIds" value="1" id="chk_1"/><label for="chk_1">名称</label>
<input type="checkbox" name="optionalIds" value="2" id="chk_2"/><label for="chk_2">表名称</label>
<input type="checkbox" name="optionalIds" value="3" id="chk_3"/><label for="chk_3">类名称</label>
<input type="checkbox" name="optionalIds" value="4" id="chk_4"/><label for="chk_4">所属包</label>
<input type="checkbox" name="optionalIds" value="5" id="chk_5"/><label for="chk_5">是否可查询</label>
<input type="checkbox" name="optionalIds" value="6" id="chk_6"/><label for="chk_6">是否可导出</label>
<input type="checkbox" name="optionalIds" value="7" id="chk_7"/><label for="chk_7">是否可导入</label>
<input type="checkbox" name="optionalIds" value="8" id="chk_8"/><label for="chk_8">对生成器不可见</label>

					       </div>
					       <div style="margin:10px 0px;border:1px dashed gray;padding:5px;">
					        <span class="ui-icon ui-icon-alert" style="float:left;"></span>遇到以上勾选字段完全相同的记录时，忽略该记录。
					       </div>
					    </td>
					</tr>
    	</table>
    	</div>
    	</div>
    	<div id="InputDetailBar">
    	        <input type="button" name="btnSave" value="提 交" class="ButtonStyle" onClick="checkForm();"/>
				<input type="button" name="btnBack" value="返 回" class="ButtonStyle" onClick="goBack();" />
    	</div>
    </form>
    </table>
   </div>
   <div> 
      <h3>注意</h3>
      <li>请先<a href="${basePath}entity_exportEmptyExcel.action" target="blank">下载导入模板</a>，然后将数据填入到模板内，最后导入该Excel文件。</li>
   </div>
   	<div id="dialog-modal" style="display:none;">
	</div>
   <div id="dialog-modal2" style="display:none;" title="提示">
		<iframe width="98%" height="300" id="progressFrame" frameborder="0"></iframe>
	</div>
  </body>
</html>
