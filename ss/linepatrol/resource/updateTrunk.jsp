<%@include file="/common/header.jsp"%>

<html>
<head>
	<title></title>
	
	<script type='text/javascript' src='${ctx}/linepatrol/js/change_style.js'></script>
	<script type='text/javascript'>
		function more(){
			window.location.href = '${ctx}/linepatrol/resource/fileDetail.jsp';
		}		    
	</script>
</head>
<body onload="changeStyle()">
	<template:titile value="资料更新" />
	<template:formTable>
		<html:form action="/trunkAction.do?method=updateFile" styleId="form">
			<input type="hidden" name="type" value="${type}" />
			<input type="hidden" name="id" value="${id}" />
			<c:choose>
				<c:when test="${type eq 'cable'}">
					<template:formTr name="中继段名称">
						${name}
					</template:formTr>
				</c:when>
				<c:otherwise>
					<template:formTr name="管道名称">
						${name}
					</template:formTr>
				</c:otherwise>
			</c:choose>
			<template:formTr name="历史资料">
				<c:choose>
					<c:when test="${empty addOnes}">
						无资料历史
					</c:when>
					<c:otherwise>
						<table width="100%">
							<tr>
								<td align="center"><b>名称</b></td>
								<td align="center"><b>更新人</b></td>
								<td align="center"><b>更新日期</b></td>
								<td align="center"><b>状态</b></td>
							</tr>
							<c:forEach var="f" items="${addOnes}" varStatus="status">
								<c:if test="${status.index < 3}">
									<tr>
										<td align="center"><a href="${ctx}/downloadAction.do?fileid=${f.FILEID}">${f.ORIGINALNAME}</a></td>
										<td align="center">
											<apptag:assorciateAttr table="userinfo" label="username" key="userid" keyValue="${f.UPLOADER}" />
										</td>
										<td align="center">
											<bean:write name="f" property="ONCREATE" format="yyyy/MM/dd" />
										</td>
										<td align="center">
											<c:choose>
												<c:when test="${f.IS_USABLE eq '1'}">
													入库
												</c:when>
												<c:otherwise>
													新增
												</c:otherwise>
											</c:choose>
										</td>
									</tr>
								</c:if>
							</c:forEach>
								<tr>
									<td colspan=3></td>
									<td align="right"><a href="javascript:more();">更多..</a></td> 
								</tr>
						</table>
					</c:otherwise>
				</c:choose>
			</template:formTr>
			<template:formTr name="本次更新">
				<apptag:upload state="edit" cssClass="" entityId="${id}" entityType="LP_ACCEPTANCE_CABLE" useable="0"/>
			</template:formTr>
			<template:formSubmit>
				<td>
					<html:submit property="action" styleClass="button">提交</html:submit>
				</td>
				<td>
					<html:button property="action" styleClass="button" onclick="javascript:parent.close();">关闭</html:button>
				</td>
			</template:formSubmit>
		</html:form>
	</template:formTable>
</body>
</html>