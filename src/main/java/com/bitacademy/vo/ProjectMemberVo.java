package com.bitacademy.vo;

public class ProjectMemberVo {
    private int project_no;
    private int user_no;

    public ProjectMemberVo() {
    }

    public ProjectMemberVo(int project_no, int user_no) {
        this.project_no = project_no;
        this.user_no = user_no;
    }

    public int getProject_no() {
        return project_no;
    }

    public void setProject_no(int project_no) {
        this.project_no = project_no;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    @Override
    public String toString() {
        return "ProjectMemberVo{" +
                "project_no=" + project_no +
                ", user_no=" + user_no +
                '}';
    }
}
