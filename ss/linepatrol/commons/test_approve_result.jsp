<%@ page language="java" pageEncoding="GBK"%>
<%@include file="/common/header.jsp"%>
<!-- 
 ����2�����������Ҫ�ھ�����˱����н��и�ֵ
<input type="hidden" name="objectId" value="" />
<input type="hidden" name="objectType" value="" />
 -->
<!-- 
<tr>
	<td height="25" style="text-align: right;">
		��˽����
	</td>
	<td colspan="3" style="text-align: left;">
		<input type="radio" name="approveResult" value="1" checked />
		ͨ��
		<input type="radio" name="approveResult" value="0" />
		��ͨ��
	</td>
</tr>
<tr>
	<td height="25" style="text-align: right;">
		��������
	</td>
	<td colspan="3" style="text-align: left;">
		<textarea name="approveRemark" rows="6" style="width: 400px;"></textarea>
	</td>
</tr>
 -->
<apptag:approve labelStyle="text-align: right;"
	valueStyle="text-align: left;" areaStyle="width: 400px;"></apptag:approve>
<apptag:approve displayType="view" objectId="000000000183"
	objectType="LP_TROUBLE_REPLY"></apptag:approve>