<%@include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title></title>
		    <script type="text/javascript" src="${ctx}/js/WdatePicker/WdatePicker.js"></script>
	<link type="text/css" rel="stylesheet"
		href="${ctx}/js/WdatePicker/skin/WdatePicker.css">
		
		<script type="text/javascript">
			toViewForm=function(idValue){
	           // window.location.href = "${ctx}/troubleInfoAction.do?method=viewTroubleInfo&troubleid="+idValue;
	           window.location.href = "${ctx}/troubleQueryStatAction.do?method=viewTroubleReply&replyid="+idValue+"&queryact=no";
			}
			
			toExamForm=function(idValue){
				window.location.href = "${ctx}/troubleExamAction.do?method=examReplyForm&replyid="+idValue;
			}
			
		     function toCloseOneReply(replyid){
				if(confirm("确定关闭故障反馈单吗？")){
					window.location.href = "${ctx}/replyApproveAction.do?method=closeTroubleInfo&replyid="+replyid+"&act=closeonereply";
				}
			}
		</script>
	</head>

	<body>
	
		<br>
		<template:titile value="故障考核评估" />
		<html:form action="/troubleExamAction.do?method=saveTroubleReply"
			styleId="ApproveReply">
			<input type="hidden" id="troubleid" name="troubleid" value="<bean:write name="trouble" property="id"/>" />
			<table  width="80%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
			     <tr class=trwhite>
				    <td class="tdulleft">故障登记人：</td>
				    <td class="tdulright" >
						<c:out value="${sendman}"></c:out>
					</td>
					<td class="tdulleft">故障登记单位：</td>
				    <td class="tdulright">
				        <c:out value="${deptName}"></c:out>
				    </td>
				  </tr> 
				 <tr class=trcolor>
				    <td class="tdulleft">指派代维：</td>
				    <td class="tdulright">
						<c:forEach items="${unitlist}" var="unit">
							指派代维:<bean:write name="unit" property="contractorname"/><br/>
						</c:forEach>
					</td>
					<td class="tdulleft">故障单号：</td>
				    <td class="tdulright">
				    	<c:out value="${trouble.troubleId}"></c:out>
				    </td>
				  </tr>
			      <tr class=trwhite>
				    <td class="tdulleft">故障名称：</td>
				    <td class="tdulright" colspan="3">
				    	<bean:write name="trouble" property="troubleName" />
					</td>
				  </tr>
			 	  <tr class=trcolor>
				    <td class="tdulleft">故障发生时间：</td>
				    <td class="tdulright">
						<fmt:formatDate value="${trouble.troubleStartTime}" var="startTime" pattern="yyyy/MM/dd HH:mm:ss"/>
				    	<bean:write  name="startTime" />
					</td>
				    <td class="tdulleft">故障派发时间：</td>
				    <td class="tdulright">
						<fmt:formatDate value="${trouble.troubleSendTime}" var="date" pattern="yyyy/MM/dd HH:mm:ss"/>
				    	<bean:write  name="date" />
					</td>
				  </tr>
				  
				  <tr class=trwhite>
				    <td class="tdulleft">是否为重大故障：</td>
				    <td class="tdulright">
				    	<c:if test="${trouble.isGreatTrouble=='0'}">
				    		否
				    	</c:if>
				    	<c:if test="${trouble.isGreatTrouble=='1'}">
				    		是
				    	</c:if>
				    </td>
				    <td class="tdulleft">故障反馈时限：</td>
				    <td class="tdulright">
				    	<fmt:formatDate value="${trouble.replyDeadline}" var="startTime" pattern="yyyy/MM/dd HH:mm:ss"/>
				    </td>
				  </tr>
				  
				   <tr class=trcolor>
				    <td class="tdulleft">故障派发人：</td>
				    <td class="tdulright" colspan="3"><bean:write name="trouble" property="troubleSendMan"/></td>
				   </tr>
				   <tr class=trwhite>
				    <td class="tdulleft">平台：</td>
				    <td class="tdulright">
				      ${trouble.connector}
				    </td>
				    <td class="tdulleft">平台电话：</td>
				    <td class="tdulright"><bean:write name="trouble" property="connectorTel"/></td>
				  </tr>
				  <tr class=trcolor>
				         <td class="tdulleft">eoms单号数量：</td>
						  <td class="tdulright" colspan="3">
						  	${eomsnum}个
					     </td>
				  </tr>
				   <tr class=trwhite>
				         <td class="tdulleft">eoms单号：</td>
						  <td class="tdulright" colspan="3" style="word-break:break-all;width:60%;">
						  	${eoms}
					     </td>
				  </tr>
				  <tr class=trcolor>
				    <td class="tdulleft">故障描述：</td>
				    <td class="tdulright" colspan="3" style="word-break:break-all;width:500px;" >
				    	<bean:write name="trouble" property="troubleRemark"/>
				    </td>
				  </tr>
				    <tr class=trwhite>
				    <td class="tdulleft">附件：</td>
				    <td class="tdulright" colspan="3" >
				    	 <apptag:upload state="look" cssClass="" entityId="${trouble.id}" entityType="LP_TROUBLE_INFO"/>
				    </td>
				  </tr>
				  <tr class=trcolor><td colspan="4">
				 <table width="100%" border="0" align="center" cellpadding="3" cellspacing="0" class="tabout">
				 	<tr  class=trcolor>
				 		<td>代维公司</td><td>反馈时间</td><td>状态</td><td>操作</td>
				 	</tr>
				 	<c:forEach items="${replys}" var="reply" varStatus="loop">
				 			<c:if test="${loop.count%2==0 }"> <tr class=trcolor></c:if>
							<c:if test="${loop.count%2==1 }"> <tr class=trwhite></c:if>
							<td><bean:write name="reply" property="contractorname"/></td>
							<td>
				    			<bean:write name="reply" property="reply_submit_time"/>
							</td>
							<td><bean:write name="reply" property="confirm_result"/></td>
							<td>
							<bean:define id="rid" property="id" name="reply"></bean:define>
								<logic:equal value="1" name="reply" property="cr">
								    <a href="javascript:toExamForm('<%=rid%>')">考核</a> |
								</logic:equal>
								<a href="javascript:toViewForm('<%=rid%>')">查看</a>
							</td>
				 		</tr>
				 	</c:forEach>
				 </table>
				 </td></tr>
				 <tr class=trwhite align="center">
				    <td colspan="4">
				    	<input type="button" class="button" value="返回" onclick="javascript:history.back();" />
				    </td>
				  </tr>
			</table>
		</html:form>
	</body>
</html>
