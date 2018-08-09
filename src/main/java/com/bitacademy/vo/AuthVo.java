package com.bitacademy.vo;

public class AuthVo {
    private int user_no;
    private int authCode;
    private String loginID;
    private String nameHan;

    public AuthVo() {
    }

    public AuthVo(int user_no, int authCode, String loginID, String nameHan) {
        this.user_no = user_no;
        this.authCode = authCode;
        this.loginID = loginID;
        this.nameHan = nameHan;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public int getAuthCode() {
        return authCode;
    }

    public void setAuthCode(int authCode) {
        this.authCode = authCode;
    }

    public String getLoginID() {
        return loginID;
    }

    public void setLoginID(String loginID) {
        this.loginID = loginID;
    }

    public String getNameHan() {
        return nameHan;
    }

    public void setNameHan(String nameHan) {
        this.nameHan = nameHan;
    }

    @Override
    public String toString() {
        return "AuthVo{" +
                "user_no=" + user_no +
                ", authCode=" + authCode +
                ", loginID='" + loginID + '\'' +
                ", nameHan='" + nameHan + '\'' +
                '}';
    }
}
