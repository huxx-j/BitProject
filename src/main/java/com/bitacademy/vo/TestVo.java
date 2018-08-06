package com.bitacademy.vo;

public class TestVo {
    private int username;
    private String gender;
    private String cellphone;

    public int getUsername() {
        return username;
    }

    public void setUsername(int username) {
        this.username = username;
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

    @Override
    public String toString() {
        return "TestVo{" +
                "username=" + username +
                ", gender='" + gender + '\'' +
                ", cellphone='" + cellphone + '\'' +
                '}';
    }
}
