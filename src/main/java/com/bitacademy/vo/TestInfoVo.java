package com.bitacademy.vo;

public class TestInfoVo {
	private int testDate_no;
	private String testDate0;
	private String testDate1;
	private String testDate2;
	private String testTime0;
	private String testTime1;
	private String testTime2;
	private int curriculum_no;
	public TestInfoVo() {
		super();
	}
	public TestInfoVo(int testDate_no, String testDate0, String testDate1, String testDate2, String testTime0,
			String testTime1, String testTime2, int curriculum_no) {
		super();
		this.testDate_no = testDate_no;
		this.testDate0 = testDate0;
		this.testDate1 = testDate1;
		this.testDate2 = testDate2;
		this.testTime0 = testTime0;
		this.testTime1 = testTime1;
		this.testTime2 = testTime2;
		this.curriculum_no = curriculum_no;
	}
	public int getTestDate_no() {
		return testDate_no;
	}
	public void setTestDate_no(int testDate_no) {
		this.testDate_no = testDate_no;
	}
	public String getTestDate0() {
		return testDate0;
	}
	public void setTestDate0(String testDate0) {
		this.testDate0 = testDate0;
	}
	public String getTestDate1() {
		return testDate1;
	}
	public void setTestDate1(String testDate1) {
		this.testDate1 = testDate1;
	}
	public String getTestDate2() {
		return testDate2;
	}
	public void setTestDate2(String testDate2) {
		this.testDate2 = testDate2;
	}
	public String getTestTime0() {
		return testTime0;
	}
	public void setTestTime0(String testTime0) {
		this.testTime0 = testTime0;
	}
	public String getTestTime1() {
		return testTime1;
	}
	public void setTestTime1(String testTime1) {
		this.testTime1 = testTime1;
	}
	public String getTestTime2() {
		return testTime2;
	}
	public void setTestTime2(String testTime2) {
		this.testTime2 = testTime2;
	}
	public int getCurriculum_no() {
		return curriculum_no;
	}
	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}
	@Override
	public String toString() {
		return "TestInfoVo [testDate_no=" + testDate_no + ", testDate0=" + testDate0 + ", testDate1=" + testDate1
				+ ", testDate2=" + testDate2 + ", testTime0=" + testTime0 + ", testTime1=" + testTime1 + ", testTime2="
				+ testTime2 + ", curriculum_no=" + curriculum_no + "]";
	}
	

	
}
