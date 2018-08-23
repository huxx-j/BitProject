package com.bitacademy.vo;

public class TestInfoVo {
	private int testDate_no;
	private String testDate;
	private String testTime;
	private int curriculum_no;
	public TestInfoVo() {
		super();
	}
	public TestInfoVo(int testDate_no, String testDate, String testTime, int curriculum_no) {
		super();
		this.testDate_no = testDate_no;
		this.testDate = testDate;
		this.testTime = testTime;
		this.curriculum_no = curriculum_no;
	}
	public int getTestDate_no() {
		return testDate_no;
	}
	public void setTestDate_no(int testDate_no) {
		this.testDate_no = testDate_no;
	}
	public String getTestDate() {
		return testDate;
	}
	public void setTestDate(String testDate) {
		this.testDate = testDate;
	}
	public String getTestTime() {
		return testTime;
	}
	public void setTestTime(String testTime) {
		this.testTime = testTime;
	}
	public int getCurriculum_no() {
		return curriculum_no;
	}
	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}
	@Override
	public String toString() {
		return "TestInfoVo [testDate_no=" + testDate_no + ", testDate=" + testDate + ", testTime=" + testTime
				+ ", curriculum_no=" + curriculum_no + "]";
	}

	
}
