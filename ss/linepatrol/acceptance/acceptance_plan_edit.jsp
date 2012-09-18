<%@include file="/common/header.jsp"%>
<html>
<head>
	<title></title>
	
	<script language="javascript" src="${ctx}/js/validation/prototype.js" type=""></script>
	<script language="javascript" src="${ctx}/js/validation/effects.js" type=""></script>
	<script language="javascript" src="${ctx}/js/validation/validation_cn.js" type=""></script>
	<link href="${ctx}/js/validation/styles/style_min.css" rel="stylesheet" type="text/css">
	
	<script type='text/javascript' src='${ctx}/js/extjs/adapter/ext/ext-base.js'></script>
	<script type='text/javascript' src='${ctx}/js/extjs/ext-all.js'></script>
	<link rel='stylesheet' type='text/css' href='${ctx}/js/extjs/resources/css/ext-all.css' />
	
	<script type='text/javascript' src='${ctx}/linepatrol/js/change_style.js'></script>
	
	<script type="text/javascript">
		var win;
		function showWin(url){
			win = new Ext.Window({
				layout : 'fit',
				width:700,
				height:400,
				resizable:true,
				closeAction : 'close',
				modal:true,
				html:'<iframe scrolling=auto frameborder=0 width=100% height=100% src="'+url+'" />',
				plain: true
			});
			win.show(Ext.getBody());
		}
		function record(method){
			var url = getUrl(method);
			showWin(url);
		}
		function getUrl(method){
			var type = getType();
			var url = '${ctx}/linepatrol/acceptance/';
			if(type == '1'){
				if(method == '1'){
					url += 'importCable.jsp?type=1';
				}else{
					url += 'recordCable.jsp';
				}
			}else{
				if(method == '1'){
					url += 'importPipe.jsp?type=1';
				}else{
					url += 'recordPipe.jsp';
				}
			}
			return url;
		}
		function getResultUrl(method,applyId){
			var url = "";
			if(method == '1'){
				url = "${ctx}/acceptancePlanQueryAction.do?method=getCablePipeList&type=cable&canDelete=&applyId="+applyId;
			}else{
				url = "${ctx}/acceptancePlanQueryAction.do?method=getCablePipeList&type=pipe&canDelete=&applyId="+applyId;
			}
			return url;
		}
		function getType(){
			var types = document.getElementsByName("resourceType");
			for(var i=0;i<types.length;i++){
				if(types[i].checked){
					return types[i].value;
				}
			}
		}
		function view(applyId){
			var method = getType();
			var url = getResultUrl(method,applyId);
			showWin(url);
		}
		function close(){
			win.close();
		}
		function check(){
			if($('approver').value == ''){
				alert('��׼�˲���Ϊ��');
				return false;
			}
			return true;
		}
		function setRadio(){
			var resourceType = document.getElementsByName("resourceType");
			var resource = document.getElementById("resource").value;
			for(var i = 0; i < resourceType.length; i++){
				if(resourceType[i].value==resource){
					resourceType[i].checked=true;
					return;
				}
			}
		}
		//����
		goBack = function() {
			var url = '${sessionScope.S_BACK_URL}';
			self.location.replace(url);
		}
	</script>
</head>
<body onload="changeStyle();setRadio();">
	<template:titile value="�޸����ս�ά�ƻ�" />
	<html:form action="/acceptancePlanQueryAction.do?method=editAcceptancePlan" styleId="form" onsubmit="return check()">
		<template:formTable >
			<template:formTr name="��Ŀ����">
				<html:text property="applicant" styleClass="view" value="${userName }" style="width:200px" readonly="true" />
			</template:formTr>
			<template:formTr name="��Ŀ��������">
				<html:text property="name" value="${sessionScope.apply.name }" styleClass="inputtext required" style="width:200px"/>
			</template:formTr>
			<template:formTr name="������Դ����">
				<input type="hidden" id="resource" value="${sessionScope.apply.resourceType }"/>
				<html:radio property="resourceType" value="1" disabled="true" />����
				<html:radio property="resourceType" value="2" disabled="true" />�ܵ�
			</template:formTr>
			<template:formTr name="���뷽ʽ">
				<input type="button" class="button" value="��������" onclick="record(1);" />
				<input type="button" class="button" value="�ֹ�¼��" onclick="record(2);" />
			</template:formTr>
			<template:formTr name="��¼������">
				<input type="button" class="button" value="�鿴" onclick="view('${sessionScope.apply.id }');" />
			</template:formTr>
			<template:formSubmit>
				<td>
					<html:button property="action" styleClass="button" onclick="goBack();">����</html:button>
					<html:submit property="action" styleClass="button">�ύ</html:submit>
				</td>
			</template:formSubmit>
		</template:formTable>
	</html:form>
	<script type="text/javascript">
		function formCallback(result, form) {
			window.status = "valiation callback for form '" + form.id + "': result = " + result;
		}

		var valid = new Validation('form', {immediate : true, onFormValidate : formCallback});
	</script>
</body>
</html>