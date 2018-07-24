package com.bitacademy.vo;

public class ApplyUserVo {
	
	private int user_no;
	private int curriculum_no;
	private String workType;
	private String gisuName;
	private String curriName;
	private String nameHan;
	private String applyType;
	private String birthDate;
	private String testScore;
	private String gender;
	private String state;
	private String handphone;
	private String testLang;
	private String applyDay;
	private String testDay;
	private String school;
	private String major;
	private String deposit;
	private String depositDay;
	private String depositAmount;
	private String cardPayDay;
	private String cardPayAmount;
	private String totalPay;
	private String consult;
	public ApplyUserVo(int user_no, int curriculum_no, String workType, String gisuName, String curriName,
                       String nameHan, String applyType, String birthDate, String testScore, String gender, String state,
                       String handphone, String testLang, String applyDay, String testDay, String school, String major,
                       String deposit, String depositDay, String depositAmount, String cardPayDay, String cardPayAmount,
                       String totalPay, String consult) {
		
		this.user_no = user_no;
		this.curriculum_no = curriculum_no;
		this.workType = workType;
		this.gisuName = gisuName;
		this.curriName = curriName;
		this.nameHan = nameHan;
		this.applyType = applyType;
		this.birthDate = birthDate;
		this.testScore = testScore;
		this.gender = gender;
		this.state = state;
		this.handphone = handphone;
		this.testLang = testLang;
		this.applyDay = applyDay;
		this.testDay = testDay;
		this.school = school;
		this.major = major;
		this.deposit = deposit;
		this.depositDay = depositDay;
		this.depositAmount = depositAmount;
		this.cardPayDay = cardPayDay;
		this.cardPayAmount = cardPayAmount;
		this.totalPay = totalPay;
		this.consult = consult;
	}
	public ApplyUserVo() {
		
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getCurriculum_no() {
		return curriculum_no;
	}
	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getGisuName() {
		return gisuName;
	}
	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}
	public String getCurriName() {
		return curriName;
	}
	public void setCurriName(String curriName) {
		this.curriName = curriName;
	}
	public String getNameHan() {
		return nameHan;
	}
	public void setNameHan(String nameHan) {
		this.nameHan = nameHan;
	}
	public String getApplyType() {
		return applyType;
	}
	public void setApplyType(String applyType) {
		this.applyType = applyType;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getTestScore() {
		return testScore;
	}
	public void setTestScore(String testScore) {
		this.testScore = testScore;
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
	public String getTestLang() {
		return testLang;
	}
	public void setTestLang(String testLang) {
		this.testLang = testLang;
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
	public String getDepositDay() {
		return depositDay;
	}
	public void setDepositDay(String depositDay) {
		this.depositDay = depositDay;
	}
	public String getDepositAmount() {
		return depositAmount;
	}
	public void setDepositAmount(String depositAmount) {
		this.depositAmount = depositAmount;
	}
	public String getCardPayDay() {
		return cardPayDay;
	}
	public void setCardPayDay(String cardPayDay) {
		this.cardPayDay = cardPayDay;
	}
	public String getCardPayAmount() {
		return cardPayAmount;
	}
	public void setCardPayAmount(String cardPayAmount) {
		this.cardPayAmount = cardPayAmount;
	}
	public String getTotalPay() {
		return totalPay;
	}
	public void setTotalPay(String totalPay) {
		this.totalPay = totalPay;
	}
	public String getConsult() {
		return consult;
	}
	public void setConsult(String consult) {
		this.consult = consult;
	}
	
	@Override
	public String toString() {
		return "ApplyUserVo [user_no=" + user_no + ", curriculum_no=" + curriculum_no + ", workType=" + workType
				+ ", gisuName=" + gisuName + ", curriName=" + curriName + ", nameHan=" + nameHan + ", applyType="
				+ applyType + ", birthDate=" + birthDate + ", testScore=" + testScore + ", gender=" + gender
				+ ", state=" + state + ", handphone=" + handphone + ", testLang=" + testLang + ", applyDay=" + applyDay
				+ ", testDay=" + testDay + ", school=" + school + ", major=" + major + ", deposit=" + deposit
				+ ", depositDay=" + depositDay + ", depositAmount=" + depositAmount + ", cardPayDay=" + cardPayDay
				+ ", cardPayAmount=" + cardPayAmount + ", totalPay=" + totalPay + ", consult=" + consult + "]";
	}
	
	
}
