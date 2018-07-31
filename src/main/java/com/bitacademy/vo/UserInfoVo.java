package com.bitacademy.vo;

public class UserInfoVo {
    private int user_no;
    private String nameHan;
    private String studResNum;
    private String gender;
    private String cellphone;
    private String school;
    private String major;
    private String gisuName;
    private String testResult;
    private String applyDate;
    private String testDate;
    private String deposit;

    public UserInfoVo() {
    }

    public UserInfoVo(int user_no, String nameHan, String studResNum, String gender, String cellphone, String school, String major, String gisuName, String testResult, String applyDate, String testDate, String deposit) {
        this.user_no = user_no;
        this.nameHan = nameHan;
        this.studResNum = studResNum;
        this.gender = gender;
        this.cellphone = cellphone;
        this.school = school;
        this.major = major;
        this.gisuName = gisuName;
        this.testResult = testResult;
        this.applyDate = applyDate;
        this.testDate = testDate;
        this.deposit = deposit;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public String getNameHan() {
        return nameHan;
    }

    public void setNameHan(String nameHan) {
        this.nameHan = nameHan;
    }

    public String getStudResNum() {
        return studResNum;
    }

    public void setStudResNum(String studResNum) {
        this.studResNum = studResNum;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCellphone() {
        return cellphone;
    }

    public void setCellphone(String cellphone) {
        this.cellphone = cellphone;
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

    public String getGisuName() {
        return gisuName;
    }

    public void setGisuName(String gisuName) {
        this.gisuName = gisuName;
    }

    public String getTestResult() {
        return testResult;
    }

    public void setTestResult(String testResult) {
        this.testResult = testResult;
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

    public String getDeposit() {
        return deposit;
    }

    public void setDeposit(String deposit) {
        this.deposit = deposit;
    }

    @Override
    public String toString() {
        return "UserInfoVo{" +
                "user_no=" + user_no +
                ", nameHan='" + nameHan + '\'' +
                ", studResNum='" + studResNum + '\'' +
                ", gender='" + gender + '\'' +
                ", cellphone='" + cellphone + '\'' +
                ", school='" + school + '\'' +
                ", major='" + major + '\'' +
                ", gisuName='" + gisuName + '\'' +
                ", testResult='" + testResult + '\'' +
                ", applyDate='" + applyDate + '\'' +
                ", testDate='" + testDate + '\'' +
                ", deposit='" + deposit + '\'' +
                '}';
    }
}
