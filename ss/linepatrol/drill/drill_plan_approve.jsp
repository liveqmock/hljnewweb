<%@include file="/common/header.jsp"%>
<%@page import="com.cabletech.linepatrol.drill.module.*" %>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head>
		<title>演练方案审核</title>
		<script type="text/javascript">
			function checkForm(){
				if(getTrimValue("operator")=="approve"){
					if(submitForm1.approveResult[0].checked){
						if(getTrimValue("deadline").length==0){
							alert("总结提交时限不能为空！");
							return false;
						}
					}
				}
				if(getTrimValue("operator")=="transfer"){
					if(getTrimValue("approvers").length==0){
						alert("转审人不能为空！");
						return false;
					}
					processBar(submitForm1);
					return true;
				}
				processBar(submitForm1);
				return true;
			}
			function getTrimValue(value){
				return document.getElementById(value).value.trim();
			}
			String.prototype.trim = function() {
				return this.replace(/^\s+|\s+$/g,"");
			}
		</script>
	</head>
	<body>
		<c:if test="${operator=='approve'}">
			<template:titile value="演练方案审核"/>
		</c:if>
		<c:if test="${operator=='transfer'}">
			<template:titile value="演练方案转审"/>
		</c:if>
		<html:form action="/drillPlanAction.do?method=approveDrillPlan" onsubmit="return checkForm()" styleId="submitForm1" enctype="multipart/form-data">&nbsp; 
			<jsp:include page="drill_plan_base.jsp"></jsp:include>
			<input type="hidden" name="taskId" value="<c:out value='${drillTask.id }' />"/>
			<input type="hidden" name="id" value="<c:out value='${drillPlan.id }' />"/>
			<input type="hidden" name="creator" value="<c:out value='${drillPlan.creator }' />"/>
			<input type="hidden" name="contractorId" value="<c:out value='${drillPlan.contractorId }' />"/>
			<input type="hidden" id="planCreateTime" value="<c:out value='${drillPlan.createTime }'/>" />
			<input type="hidden" id="planDeadlineTime" value="<c:out value='${drillTask.deadline }'/>" />
			<table cellspacing="0" cellpadding="1" align="center" style="width:90%;border-top:0px;" class="tabout">
				<c:if test="${operator=='approve'}">
					<tr class="trcolor">
						<td class="tdulright" colspan="2">
							<c:if test="${drillPlan.createTime>drillTask.deadline}">
								<font color="red">演练方案提交超时，超时<bean:write name="days" format="#.##"/>小时</font>
							</c:if>
							<c:if test="${drillPlan.createTime<=drillTask.deadline}">
								<font color="blue">演练方案提交提前，提前<bean:write name="days" format="#.##"/>小时</font>
							</c:if>
						</td>
					</tr>
					<tr class="trcolor" id="deadlineArea">
						<td class="tdulleft" style="width:20%;">总结提交时限：</td>
						<td class="tdulright">
							<c:if test="${empty drillPlan.deadline}">
								<input name="deadline" class="Wdate" id="deadline" style="width:200"
									onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss',minDate:'%y-%M-%d'})" readonly/>
							</c:if>
							<c:if test="${not empty drillPlan.deadline}">
								<input name="deadline" class="Wdate" id="deadline" style="width:200"
									onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss',minDate:'%y-%M-%d'})" readonly value="<bean:write name='drillPlan' property='deadline' format='yyyy/MM/dd HH:mm:ss'/>"/>
							</c:if>
					</tr>
					<tr class="trcolor">
						<input type="hidden" name="operator" id="operator" value="approve"/>
						<apptag:approve labelClass="tdulleft" valueClass="tdulright" colSpan="2" areaClass="textarea max-length-1024" />
					</tr>
					<tr class="trcolor"">
						<td colspan="2" align="center" class="tdc">
							<html:submit property="action" styleClass="button">提交</html:submit> &nbsp;&nbsp;
							<html:reset property="action" styleClass="button">重写</html:reset>&nbsp;&nbsp;
							<html:button property="button" styleClass="button" onclick="javascript:history.go(-1);">返回</html:button>
						</td>
					</tr>
				</c:if>
				<c:if test="${operator=='transfer'}">
					<input type="hidden" name="operator" id="operator" value="transfer"/>
					<tr class="trcolor">
						<apptag:approverselect label="转审人" colSpan="4" inputName="approvers,mobile" inputType="radio" spanId="approverSpan" />
					</tr>
					<tr class="trcolor"">
						<td height="25" style="text-align: right;" class="tdulleft" style="width:20%;">
							转审说明：<input type="hidden" name="approveResult" value="2" />
						</td>
						<td colspan="3" style="text-align: left;" class="tdulright">
							<textarea name="approveRemark" rows="6" style="width: 500px;"></textarea>
						</td>
					</tr>
					<tr class="trcolor">
						<td colspan="4" align="center" class="tdc">
							<html:submit property="action" styleClass="button">转审</html:submit>&nbsp;&nbsp;
							<html:button property="button" styleClass="button" onclick="javascript:history.go(-1);">返回</html:button>
						</td>
					</tr>
				</c:if>
			</table>
		</html:form>
	</body>
</html>
