package com.bitacademy.vo;

public class ApplyUserVo {
	
	private String gisuName;
	private String nameHan;
	private String birthDate;
	private String gender;
	private String state;
	private String handphone;
	private String applyDay;
	private String testDay;
	private String school;
	private String major;
	private String deposit;
	
	public ApplyUserVo(String gisuName, String nameHan, String birthDate, String gender, String state, String handphone,
			String applyDay, String testDay, String school, String major, String deposit) {
		this.gisuName = gisuName;
		this.nameHan = nameHan;
		this.birthDate = birthDate;
		this.gender = gender;
		this.state = state;
		this.handphone = handphone;
		this.applyDay = applyDay;
		this.testDay = testDay;
		this.school = school;
		this.major = major;
		this.deposit = deposit;
	}

	public ApplyUserVo() {
	}

	public String getGisuName() {
		return gisuName;
	}

	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}

	public String getNameHan() {
		return nameHan;
	}

	public void setNameHan(String nameHan) {
		this.nameHan = nameHan;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getHandphone() {
		return handphone;
	}

	public void setHandphone(String handphone) {
		this.handphone = handphone;
	}

	public String getApplyDay() {
		return applyDay;
	}

	public void setApplyDay(String applyDay) {
		this.applyDay = applyDay;
	}

	public String getTestDay() {
		return testDay;
	}

	public void setTestDay(String testDay) {
		this.testDay = testDay;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	@Override
	public String toString() {
		return "ApplyUserVo [gisuName=" + gisuName + ", nameHan=" + nameHan + ", birthDate=" + birthDate + ", gender=" + gender
				+ ", state=" + state + ", handphone=" + handphone + ", applyDay=" + applyDay + ", testDay="
				+ testDay + ", school=" + school + ", major=" + major + ", deposit=" + deposit + "]";
	}
	
	
}
