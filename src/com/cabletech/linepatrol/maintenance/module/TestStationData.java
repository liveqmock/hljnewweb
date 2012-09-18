package com.cabletech.linepatrol.maintenance.module;

import java.util.Date;

import com.cabletech.commons.base.BaseDomainObject;

/**
 * �ӵص���¼��������Ϣ��
 */

public class TestStationData extends BaseDomainObject  {

	private String id;
	private String testDataId;//¼������ϵͳ���
	private String testPlanId;
	private String testStationId;
	private Date factTestTime;
	private String testAddress;
	private String testWeather;//��������
	private String tester;
	private String testApparatus;//�����Ǳ�
	private String testMethod;//���Է���
	private Double resistanceValue;//������ֵ
	private String isEligible;//�Ƿ�ϸ�
	private String problemComment;//�������
	private String disposeMethod;//��������
	private String remark;
	private String testState;
	private Date createTime;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTestDataId() {
		return testDataId;
	}
	public void setTestDataId(String testDataId) {
		this.testDataId = testDataId;
	}
	public String getTestPlanId() {
		return testPlanId;
	}
	public void setTestPlanId(String testPlanId) {
		this.testPlanId = testPlanId;
	}
	public String getTestStationId() {
		return testStationId;
	}
	public void setTestStationId(String testStationId) {
		this.testStationId = testStationId;
	}
	public Date getFactTestTime() {
		return factTestTime;
	}
	public void setFactTestTime(Date factTestTime) {
		this.factTestTime = factTestTime;
	}
	public String getTestAddress() {
		return testAddress;
	}
	public void setTestAddress(String testAddress) {
		this.testAddress = testAddress;
	}
	public String getTestWeather() {
		return testWeather;
	}
	public void setTestWeather(String testWeather) {
		this.testWeather = testWeather;
	}
	public String getTester() {
		return tester;
	}
	public void setTester(String tester) {
		this.tester = tester;
	}
	public String getTestApparatus() {
		return testApparatus;
	}
	public void setTestApparatus(String testApparatus) {
		this.testApparatus = testApparatus;
	}
	public String getTestMethod() {
		return testMethod;
	}
	public void setTestMethod(String testMethod) {
		this.testMethod = testMethod;
	}
	public Double getResistanceValue() {
		return resistanceValue;
	}
	public void setResistanceValue(Double resistanceValue) {
		this.resistanceValue = resistanceValue;
	}
	public String getIsEligible() {
		return isEligible;
	}
	public void setIsEligible(String isEligible) {
		this.isEligible = isEligible;
	}
	public String getProblemComment() {
		return problemComment;
	}
	public void setProblemComment(String problemComment) {
		this.problemComment = problemComment;
	}
	public String getDisposeMethod() {
		return disposeMethod;
	}
	public void setDisposeMethod(String disposeMethod) {
		this.disposeMethod = disposeMethod;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTestState() {
		return testState;
	}
	public void setTestState(String testState) {
		this.testState = testState;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


}