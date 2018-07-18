package com.bitacademy.vo;

public class UserInfoVo {
    private int User_no;
    private String NameHan;
    private String StudResNum;
    private String Gender;
    private String Handphone;
    private String School;
    private String Major;
    private String GisuName;
    private String TestResult;
    private String ApplyDay;
    private String TestDay;
    private String Deposit;

    public UserInfoVo() {
    }

    public UserInfoVo(int user_no, String nameHan, String studResNum, String gender, String handphone, String school, String major, String gisuName, String testResult, String applyDay, String testDay, String deposit) {
        User_no = user_no;
        NameHan = nameHan;
        StudResNum = studResNum;
        Gender = gender;
        Handphone = handphone;
        School = school;
        Major = major;
        GisuName = gisuName;
        TestResult = testResult;
        ApplyDay = applyDay;
        TestDay = testDay;
        Deposit = deposit;
    }

    public int getUser_no() {
        return User_no;
    }

    public void setUser_no(int user_no) {
        User_no = user_no;
    }

    public String getNameHan() {
        return NameHan;
    }

    public void setNameHan(String nameHan) {
        NameHan = nameHan;
    }

    public String getStudResNum() {
        return StudResNum;
    }

    public void setStudResNum(String studResNum) {
        StudResNum = studResNum;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getHandphone() {
        return Handphone;
    }

    public void setHandphone(String handphone) {
        Handphone = handphone;
    }

    public String getSchool() {
        return School;
    }

    public void setSchool(String school) {
        School = school;
    }

    public String getMajor() {
        return Major;
    }

    public void setMajor(String major) {
        Major = major;
    }

    public String getGisuName() {
        return GisuName;
    }

    public void setGisuName(String gisuName) {
        GisuName = gisuName;
    }

    public String getTestResult() {
        return TestResult;
    }

    public void setTestResult(String testResult) {
        TestResult = testResult;
    }

    public String getApplyDay() {
        return ApplyDay;
    }

    public void setApplyDay(String applyDay) {
        ApplyDay = applyDay;
    }

    public String getTestDay() {
        return TestDay;
    }

    public void setTestDay(String testDay) {
        TestDay = testDay;
    }

    public String getDeposit() {
        return Deposit;
    }

    public void setDeposit(String deposit) {
        Deposit = deposit;
    }

    @Override
    public String toString() {
        return "UserInfoVo{" +
                "User_no=" + User_no +
                ", NameHan='" + NameHan + '\'' +
                ", StudResNum='" + StudResNum + '\'' +
                ", Gender='" + Gender + '\'' +
                ", Handphone='" + Handphone + '\'' +
                ", School='" + School + '\'' +
                ", Major='" + Major + '\'' +
                ", GisuName='" + GisuName + '\'' +
                ", TestResult='" + TestResult + '\'' +
                ", ApplyDay='" + ApplyDay + '\'' +
                ", TestDay='" + TestDay + '\'' +
                ", Deposit='" + Deposit + '\'' +
                '}';
    }
}
