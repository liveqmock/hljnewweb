<%@include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>
<html>
	<head>
		<title>�����̵�����</title>
		<%
		    UserInfo user = (UserInfo) request.getSession().getAttribute("LOGIN_USER");
		    String deptid = user.getDeptID();
		%>
		<link href="${ctx}/css/linepatrol_css.css" rel="stylesheet"
			type="text/css">
		<script type="text/javascript"
			src="${ctx}/js/WdatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
  		function checkAddInfo() {
  			if(doMtUsedEditForm.userids.value==""){
  				alert("û��ѡ������ˣ�");
  				return false;
  			}else{
  				doMtUsedEditForm.submit();
  			}
  		}
  		function openWindow(materialId,seqId){
  			var url="${ctx}/materialUsedInfoAction.do?method=getMarterialInfos&&material_id="+materialId+"&&contractor_id=<%=deptid%>&&seq_id="+seqId;
  			window.open(url,"xx","height=600,width=800,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no");
  		}
  		</script>
		<link type="text/css" rel="stylesheet"
			href="${ctx}/js/WdatePicker/skin/WdatePicker.css">
		<style>
table {
	font-size: 12px;
}
</style>
	</head>
	<body>
		<%
		    session.setAttribute("STOCK_LIST", null);
		    pageContext.setAttribute("detail_storage_map", request
		            .getAttribute("detail_storage_map"));
		%>
		<template:titile value="�����̵����������Ϣ" />
		<html:form method="post"
			action="/mtUsedAction?method=doMtUsedEditForm"
			styleId="doMtUsedEditForm">
			<table width="750" border="1" align="center" cellpadding="3"
				cellspacing="0" class="tabout" style="border-collapse:collapse;">
				<tr>
					<td colspan="2">
						<table width="100%">
							<tr>
								<td>
									��������
								</td>
								<td>
									���¿��
								</td>
								<td>
									��������
								</td>
								<td>
									����ʹ��
								</td>
								<td>
									ϵͳ�̵���
								</td>
								<td>
									ʵ�ʿ��
								</td>
							</tr>
							<%
							    int i = 0;
							%>
							<logic:iterate id="oneMap" name="detail_storage_map">
								<tr>
									<td>
										<bean:define id="materialId" name="oneMap" property="key"
											type="java.lang.String" />
										<input id="materialId" name="materialId" type="hidden"
											value="<bean:write name="oneMap" property="key" />" />
										<bean:write name="oneMap" property="value.material_name" />
									</td>
									<td>
										<input id="lastMonthStock" name="lastMonthStock" type="hidden"
											value="<bean:write name="oneMap" property="value.last_month_storage" />" />
										<bean:write name="oneMap" property="value.last_month_storage" />
									</td>
									<td>
										<input id="newAddedStock" name="newAddedStock" type="hidden"
											value="<bean:write name="oneMap" property="value.storage_number" />" />
										<bean:write name="oneMap" property="value.storage_number" />
									</td>
									<td>
										<input id="newUsedStock" name=newUsedStock "" type="hidden"
											value="<bean:write name="oneMap" property="value.used_number" />" />
										<bean:write name="oneMap" property="value.used_number" />
									</td>
									<td>
										<bean:write name="oneMap" property="value.have_number" />
									</td>
									<td>
										<input id="realStock_<%=i%>" name="realStock" type="hidden"
											value="<bean:write name="oneMap" property="value.real_number" />" />
										<a href="javascript:openWindow('<bean:write name="oneMap" property="key" />','<%=i%>');">
											<span id="real_stock_<%=i%>"><bean:write name="oneMap"
													property="value.real_number" />
										</span>
										</a>
									</td>
								</tr>
								<%
								    i++;
								%>
							</logic:iterate>
						</table>
					</td>
				</tr>
				<tr>
					<td style="width: 150px; text-align: right;">
						��ע��
					</td>
					<td style="width: 600px;">
					<bean:define id="approver_id" name="editBean" property="approver_id" />
					<bean:define id="approver_name" name="editBean" property="approver_name" />
						<textarea name="remark" cols="30" rows="5"><bean:write name="editBean" property="remark" /></textarea>
					</td>
				</tr>
				 <apptag:approverselect label="�����" inputName="userids"
					spanId="useridsSpan" inputType="radio" existValue="${approver_id}--${approver_name}" />
				<template:formSubmit>
					<input id="createtime" name="createtime" type="hidden"
						value="<%=(String) request.getAttribute("month")%>" />
					<input type="hidden" name="id"
						value='<bean:write name="editBean" property="id"/>' />
					<td>
						<html:button property="action" styleClass="button"
							onclick="checkAddInfo();">�ύ</html:button>
					</td>
					<td>
						<html:reset styleClass="button">����</html:reset>
					</td>
				</template:formSubmit>
			</table>
		</html:form>
	</body>
</html>