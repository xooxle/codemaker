<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/public/forAll.jsp" %>
<%@include file="/WEB-INF/pages/public/jqueryValidate.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>添加连线</title>
		<script type="text/javascript" src="${basePath}js/My97DatePicker/WdatePicker.js"></script>
	</head>
	<body class="ui-widget-content">
	
	<table width="100%">
	  <tr style="border:1px solid red">
		  <td class="ui-icon ui-icon-circle-triangle-e" width="16px">&nbsp;</td>
		  <td>添加连线</td>
	  </tr>
	</table>
		<form METHOD="POST" NAME="fmOperator" style="margin-top: 15; margin-bottom: 0" id="formID"
		 action="${basePath }transition_add.action">
		<input type="hidden" name="pageSize" value="${pageSize}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<div class="ItemBlockBorder">
		<div class="ItemBlock">
			<table align="center" class="mainForm" style="width:100%;">
<tr><td width="10%" align="right">名称：</td><td width="40%"><input name="transition.name" id="transition.name" type="text" size="15" class="InputStyle" vl="validate[optional,maxSize[64]]"/></td><td width="10%" align="right">起始节点：</td><td width="40%"><select name="fromNodeId" id="fromNodeId" class="SelectStyle"vl="validate[optional]"/><option value="">请选择</option><c:forEach items="${fromNodeList}" var="vari"><option value="${vari.id}" >${vari.name}</option></c:forEach></select></td></tr><tr><td width="10%" align="right">目标节点：</td><td width="40%"><select name="toNodeId" id="toNodeId" class="SelectStyle"vl="validate[optional]"/><option value="">请选择</option><c:forEach items="${toNodeList}" var="vari"><option value="${vari.id}" >${vari.name}</option></c:forEach></select></td><td width="10%" align="right">判断顺序号：</td><td width="40%"><input name="transition.sortValue" id="transition.sortValue" type="text" size="15" class="InputStyle" vl="validate[optional,custom[integer]]"/></td></tr><tr></tr>
			 </table>
			 </div>
			 </div>
					<div id="InputDetailBar">
					<input type="submit" name="btnSave" value="保 存" class="ButtonStyle" />
					<input type="reset" name="btnCancel" value="重 置" class="ButtonStyle">
					<input type="button" name="btnBack" value="返 回" class="ButtonStyle" 	onClick="history.back();">
				</div>
		</form>
	</body>
</html>

