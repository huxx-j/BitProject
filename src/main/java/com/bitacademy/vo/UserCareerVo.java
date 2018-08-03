package com.bitacademy.vo;


public class UserCareerVo {

	private int userCareer_no;
    private int user_no;
    private String startDate;
    private String endDate;
    private String compName;
    private String devPart;
    private String role;
    private String telePhone;
    private String companyAddress;
    private String state;
    private String department;
    private String tel;
    private String address;
	
    public UserCareerVo(int userCareer_no, int user_no, String startDate, String endDate, String compName,
			String devPart, String role, String telePhone, String companyAddress, String state, String department,
			String tel, String address) {
	
		this.userCareer_no = userCareer_no;
		this.user_no = user_no;
		this.startDate = startDate;
		this.endDate = endDate;
		this.compName = compName;
		this.devPart = devPart;
		this.role = role;
		this.telePhone = telePhone;
		this.companyAddress = companyAddress;
		this.state = state;
		this.department = department;
		this.tel = tel;
		this.address = address;
	}

	public UserCareerVo() {
		
	}

	public int getUserCareer_no() {
		return userCareer_no;
	}

	public void setUserCareer_no(int userCareer_no) {
		this.userCareer_no = userCareer_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getDevPart() {
		return devPart;
	}

	public void setDevPart(String devPart) {
		this.devPart = devPart;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTelePhone() {
		return telePhone;
	}

	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "UserCareerVo [userCareer_no=" + userCareer_no + ", user_no=" + user_no + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", compName=" + compName + ", devPart=" + devPart + ", role=" + role
				+ ", telePhone=" + telePhone + ", companyAddress=" + companyAddress + ", state=" + state
				+ ", department=" + department + ", tel=" + tel + ", address=" + address + "]";
	}
	
    
    
}
