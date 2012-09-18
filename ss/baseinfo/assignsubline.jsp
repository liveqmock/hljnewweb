<%@include file="/common/header.jsp"%>
<br>
<template:titile value="线段重新分配"/>
<html:form method="Post" action="/ResourceAssignAction.do?method=showAssignSubline">
<template:formTable >
<template:formTr name="代维单位" isOdd="false">
     <apptag:setSelectOptions valueName="connCollection" tableName="contractorinfo" columnName1="contractorname" region="true" columnName2="contractorid" order="contractorname" />
     <html:select property="contractor" styleClass="inputtext" styleId="rId" style="width:200px">
        <html:options collection="connCollection" property="value" labelProperty="label"/>
     </html:select>
</template:formTr>
<template:formSubmit>
      <td>
        <html:submit styleClass="button">下一步</html:submit>
      </td>
      <td>
        <html:reset styleClass="button">取消</html:reset>
      </td>
</template:formSubmit>
</template:formTable>
</html:form>
<table width="500" border="0" align="center" cellpadding="3" cellspacing="0" >
  <tr>
    <td><div align="left" style="color:red">* 请选择原线段所属维护部门</div></td>
  </tr>
</table>

