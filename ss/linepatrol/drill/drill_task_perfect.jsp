<%@include file="/common/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=GBK"%>

<html>
	<head>
		<title>�ƶ���������</title>
		<script type="text/javascript">
			function checkForm(state){
				if(state=="1"){
					if(valCharLength($("name").value)>50){
						alert("�����������Ʋ��ܳ���50���ַ���");
					    return;
					}
					if(valCharLength($("locale").value)>500){
						alert("�����ص㲻�ܳ���500���ַ���");
					    return;
					}
					if(valCharLength($("locale").value)>500){
						alert("�����ص㲻�ܳ���500���ַ���");
					    return;
					}
					if(valCharLength($("demand").value)>300){
						alert("����Ҫ���ܳ���300���ַ���");
					    return;
					}
					if(valCharLength($("remark").value)>300){
						alert("��ע���ܳ���300���ַ���");
					    return;
					}
					$('saveflag').value="1";
					processBar(perfectDrillTask);
					perfectDrillTask.submit();
					return;
				}
				if($("name").value.length==0){
					alert("�����������Ʋ���Ϊ�գ�");
				    return;
				}
				if(valCharLength($("name").value)>50){
					alert("�����������Ʋ��ܳ���50���ַ���");
				    return;
				}
				if($("beginTime").value.length==0){
					alert("������ʼʱ�䲻��Ϊ�գ�");
				    return;
				}
				if($("endTime").value.length==0){
					alert("��������ʱ�䲻��Ϊ�գ�");
				    return;
				}
				if($("deadline").value.length==0){
					alert("�����ύʱ�޲���Ϊ�գ�");
				    return;
				}
				if($("locale").value.length==0){
					alert("�����ص㲻��Ϊ�գ�");
				    return;
				}
				if(valCharLength($("locale").value)>500){
					alert("�����ص㲻�ܳ���500���ַ���");
				    return;
				}
				if($("contractorId").value.length==0){
					alert("����ѡ��һ����ά��˾��");
				    return;
				}
				if($("demand").value.length==0){
					alert("����Ҫ����Ϊ�գ�");
				    return;
				}
				if(valCharLength($("demand").value)>300){
					alert("����Ҫ���ܳ���300���ַ���");
				    return;
				}
				if($("remark").value.length==0){
					alert("��ע����Ϊ�գ�");
				    return;
				}
				if(valCharLength($("remark").value)>300){
					alert("��ע���ܳ���300���ַ���");
				    return;
				}
				processBar(perfectDrillTask);
				perfectDrillTask.submit();
			}
			//�ж��ַ�����
			function valCharLength(Value){
				var j=0;
				var s = Value;
				for(var i=0; i<s.length; i++) {
					if (s.substr(i,1).charCodeAt(0)>255) {
						j  = j + 2;
					} else { 
						j++;
					}
				}
				return j;
			}
			//���ô�ά��λ��ֵ
			function setConId(){
				var conId = $('conId').value;
				var contractorId = $('contractorId');
				contractorId.value = conId;
			}
		</script>
	</head>
	<body onload="setConId()">
		<template:titile value="������������"/>
		<html:form action="/drillTaskAction.do?method=addDrillTask" enctype="multipart/form-data" styleId="perfectDrillTask">
			<input name="id" value="${drillTask.id }" type="hidden"/>
			<table align="center" cellpadding="1" cellspacing="0" class="tabout" width="90%">
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">�������ƣ�</td>
					<td class="tdulright">
						<input type="text" name="name" id="name" class="inputtext" style="width:150px;" value="${drillTask.name }" />
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">��������</td>
					<td class="tdulright">
						<select name="level" style="width:150px;" class="inputtext">
							<option value="1">һ������</option>
							<option value="2">�ص�����</option>
						</select>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">��������ʱ�䣺</td>
					<td class="tdulright">
						<input name="beginTime" class="Wdate" id="beginTime" style="width:150px;"
							onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss',minDate:'%y-%M-%d'})" readonly value="<bean:write name='drillTask' property='beginTime' format='yyyy/MM/dd HH:mm:ss'/>"/>
						�D
						<input name="endTime" class="Wdate" id="endTime" style="width:150px;"
							onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss',minDate:'#F{$dp.$D(\'beginTime\')}'})" readonly value="<bean:write name='drillTask' property='endTime' format='yyyy/MM/dd HH:mm:ss'/>"/>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">�����ύʱ�ޣ�</td>
					<td class="tdulright">
						<input name="deadline" class="Wdate" id="deadline" style="width:150px;"
							onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm:ss',minDate:'%y-%M-%d'})" readonly value="<bean:write name='drillTask' property='deadline' format='yyyy/MM/dd HH:mm:ss'/>"/>
						<font color="red">*</font>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">�����ص㣺</td>
					<td class="tdulright">
						<input type="text" name="locale" id="locale" class="inputtext" style="width:150px;" value="${drillTask.locale }" />
						<font color="red">*</font>
					</td>
				</tr>
				<input type="hidden" id="conId" value="${userIds[3] }"/>
				<apptag:processorselect inputName="contractorId,userId,mobileId,conUser"
						spanId="userSpan" displayType="contractor" existValue="${userIds[0] }--${userIds[1] }" spanValue="${userIds[2] }" />
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">����Ҫ��</td>
					<td class="tdulright">
						<textarea class="textarea" rows="3" id="demand" name="demand"><c:out value="${drillTask.demand}"/></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">��ע��</td>
					<td class="tdulright">
						<textarea class="textarea" rows="3" id="remark" name="remark"><c:out value="${drillTask.remark}"/></textarea>
						<font color="red">*</font>
					</td>
				</tr>
				<tr class="trcolor">
					<td class="tdulleft" style="width:20%;">���񸽼���</td>
					<td class="tdulright">
						<apptag:upload cssClass="" entityId="${drillTask.id}" entityType="LP_DRILLTASK" state="edit"/>
					</td>
				</tr>
			</table>
			<div style="height:20px; margin-left: 5%; width: 95%; margin-top: 5px;">
				<font color="red">�������Ϊ���������������������д���ޡ�</font>
			</div>
			<div align="center" style="height:40px">
				<input type="hidden" id="saveflag" name="saveflag" value="0"/>
				<html:button property="action" styleClass="button" onclick="checkForm(0)">�ύ</html:button> &nbsp;&nbsp;
				<html:button property="action" styleClass="button" onclick="checkForm(1)">�ݴ�</html:button> &nbsp;&nbsp;
				<html:button property="button" styleClass="button" onclick="javascript:history.go(-1);">����</html:button>
			</div>
		</html:form>
	</body>
</html>