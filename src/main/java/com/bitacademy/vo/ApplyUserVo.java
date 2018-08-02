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
	private String testResult;
	private String cellphone;
	private String testLang;
	private String applyDate;
	private String testDate;
	private String school;
	private String major;
	private String deposit;
	private String depositDate;
	private String depositAmount;
	private String cardPayDate;
	private String cardPayAmount;
	private String totalPay;
	private String consult;

	public ApplyUserVo(int user_no, int curriculum_no, String workType, String gisuName, String curriName,
			String nameHan, String applyType, String birthDate, String testScore, String gender, String testResult,
			String cellphone, String testLang, String applyDate, String testDate, String school, String major,
			String deposit, String depositDate, String depositAmount, String cardPayDate, String cardPayAmount,
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
		this.testResult = testResult;
		this.cellphone = cellphone;
		this.testLang = testLang;
		this.applyDate = applyDate;
		this.testDate = testDate;
		this.school = school;
		this.major = major;
		this.deposit = deposit;
		this.depositDate = depositDate;
		this.depositAmount = depositAmount;
		this.cardPayDate = cardPayDate;
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

	public String getTestResult() {
		return testResult;
	}

	public void setTestResult(String testResult) {
		this.testResult = testResult;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getTestLang() {
		return testLang;
	}

	public void setTestLang(String testLang) {
		this.testLang = testLang;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getTestDate() {
		return testDate;
	}

	public void setTestDate(String testDate) {
		this.testDate = testDate;
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

	public String getDepositDate() {
		return depositDate;
	}

	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}

	public String getDepositAmount() {
		return depositAmount;
	}

	public void setDepositAmount(String depositAmount) {
		this.depositAmount = depositAmount;
	}

	public String getCardPayDate() {
		return cardPayDate;
	}

	public void setCardPayDate(String cardPayDate) {
		this.cardPayDate = cardPayDate;
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
				+ ", testResult=" + testResult + ", cellphone=" + cellphone + ", testLang=" + testLang + ", applyDate="
				+ applyDate + ", testDate=" + testDate + ", school=" + school + ", major=" + major + ", deposit="
				+ deposit + ", depositDate=" + depositDate + ", depositAmount=" + depositAmount + ", cardPayDate="
				+ cardPayDate + ", cardPayAmount=" + cardPayAmount + ", totalPay=" + totalPay + ", consult=" + consult
				+ "]";
	}
	
	
}
