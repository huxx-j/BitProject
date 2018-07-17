package com.bitacademy.vo;

public class ScoreVo {
    private int curriculum_no;
    private int subInStep_no;
    private int user_no;
    private int score;
    private int file_no;
    private String subjectName;

    public ScoreVo() {
    }

    public ScoreVo(int curriculum_no, int subInStep_no, int user_no, int score, int file_no, String subjectName) {
        this.curriculum_no = curriculum_no;
        this.subInStep_no = subInStep_no;
        this.user_no = user_no;
        this.score = score;
        this.file_no = file_no;
        this.subjectName = subjectName;
    }

    public int getCurriculum_no() {
        return curriculum_no;
    }

    public void setCurriculum_no(int curriculum_no) {
        this.curriculum_no = curriculum_no;
    }

    public int getSubInStep_no() {
        return subInStep_no;
    }

    public void setSubInStep_no(int subInStep_no) {
        this.subInStep_no = subInStep_no;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getFile_no() {
        return file_no;
    }

    public void setFile_no(int file_no) {
        this.file_no = file_no;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    @Override
    public String toString() {
        return "ScoreVo{" +
                "curriculum_no=" + curriculum_no +
                ", subInStep_no=" + subInStep_no +
                ", user_no=" + user_no +
                ", score=" + score +
                ", file_no=" + file_no +
                ", subjectName='" + subjectName + '\'' +
                '}';
    }
}

