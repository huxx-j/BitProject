package com.bitacademy.vo;

public class ApplyUserVo {

	private int user_no;
	private int curriculum_no;
	private String cateName;
	private String gisuName;
	private String curriName;
	private String nameHan;
	private String applyType;
	private String birthDate;
	private int testScore;
	private int gender;
	private String c_gender;
	private String testResult;
	private String cellphone;
	private String testLang;
	private String applyDate;
	private String testDate;
	private String school;
	private String major;
	private String deposit;
	private String depositDate;
	private int depositAmount;
	private String cardPayDate;
	private int cardPayAmount;
	private int totalPay;
	private String consultContent;
	private String CurriState;
	
	public ApplyUserVo(int user_no, int curriculum_no, String cateName, String gisuName, String curriName,
			String nameHan, String applyType, String birthDate, int testScore, int gender,String c_gender, String testResult,
			String cellphone, String testLang, String applyDate, String testDate, String school, String major,
			String deposit, String depositDate, int depositAmount, String cardPayDate, int cardPayAmount, int totalPay,
			String consultContent, String curriState) {
		
		this.user_no = user_no;
		this.curriculum_no = curriculum_no;
		this.cateName = cateName;
		this.gisuName = gisuName;
		this.curriName = curriName;
		this.nameHan = nameHan;
		this.applyType = applyType;
		this.birthDate = birthDate;
		this.testScore = testScore;
		this.gender = gender;
		this.c_gender = c_gender;
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
		this.consultContent = consultContent;
		CurriState = curriState;
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

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
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

	public int getTestScore() {
		return testScore;
	}

	public void setTestScore(int testScore) {
		this.testScore = testScore;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
			this.gender = gender;
	}
	
	public String getC_gender() {
		
		if(this.gender == 1){
			return "남자";
		} else {
			return "여자";
		}
	}
	
	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
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
		
		if(depositDate.equals("")) {
			depositDate=null;
		}else {
			this.depositDate = depositDate;
		}
	}

	public int getDepositAmount() {
		return depositAmount;
	}

	public void setDepositAmount(int depositAmount) {
		this.depositAmount = depositAmount;
	}

	public String getCardPayDate() {
		return cardPayDate;
	}

	public void setCardPayDate(String cardPayDate) {
		
		if(cardPayDate.equals("")) {
			cardPayDate=null;
		}else {
			this.cardPayDate = cardPayDate;
		}
	}

	public int getCardPayAmount() {
		return cardPayAmount;
	}

	public void setCardPayAmount(int cardPayAmount) {
		this.cardPayAmount = cardPayAmount;
	}

	public int getTotalPay() {
		return totalPay;
	}

	public void setTotalPay(int totalPay) {
		this.totalPay = totalPay;
	}

	public String getConsultContent() {
		return consultContent;
	}

	public void setConsultContent(String consultContent) {
		this.consultContent = consultContent;
	}

	public String getCurriState() {
		return CurriState;
	}

	public void setCurriState(String curriState) {
		CurriState = curriState;
	}

	@Override
	public String toString() {
		return "ApplyUserVo [user_no=" + user_no + ", curriculum_no=" + curriculum_no + ", cateName=" + cateName
				+ ", gisuName=" + gisuName + ", curriName=" + curriName + ", nameHan=" + nameHan + ", applyType="
				+ applyType + ", birthDate=" + birthDate + ", testScore=" + testScore + ", gender=" + gender
				+ ", c_gender=" + c_gender + ", testResult=" + testResult + ", cellphone=" + cellphone + ", testLang=" + testLang + ", applyDate="
				+ applyDate + ", testDate=" + testDate + ", school=" + school + ", major=" + major + ", deposit="
				+ deposit + ", depositDate=" + depositDate + ", depositAmount=" + depositAmount + ", cardPayDate="
				+ cardPayDate + ", cardPayAmount=" + cardPayAmount + ", totalPay=" + totalPay + ", consultContent=" + consultContent
				+ ", CurriState=" + CurriState + "]";
	}

	

}
