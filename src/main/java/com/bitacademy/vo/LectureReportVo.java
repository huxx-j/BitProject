package com.bitacademy.vo;

public class LectureReportVo {
    private String lectureReport_no;
    private int curriculum_no;
    private String subject;
    private String content;
    private String instructor;
    private String eTC;
    private int period;
    private String date;

    public LectureReportVo() {
    }

    public LectureReportVo(String lectureReport_no, int curriculum_no, String subject, String content, String instructor, String eTC, int period, String date) {
        this.lectureReport_no = lectureReport_no;
        this.curriculum_no = curriculum_no;
        this.subject = subject;
        this.content = content;
        this.instructor = instructor;
        this.eTC = eTC;
        this.period = period;
        this.date = date;
    }

    public String getLectureReport_no() {
        return lectureReport_no;
    }

    public void setLectureReport_no(String lectureReport_no) {
        this.lectureReport_no = lectureReport_no;
    }

    public int getCurriculum_no() {
        return curriculum_no;
    }

    public void setCurriculum_no(int curriculum_no) {
        this.curriculum_no = curriculum_no;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String geteTC() {
        return eTC;
    }

    public void seteTC(String eTC) {
        this.eTC = eTC;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "LectureReportVo{" +
                "lectureReport_no='" + lectureReport_no + '\'' +
                ", curriculum_no=" + curriculum_no +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", instructor='" + instructor + '\'' +
                ", eTC='" + eTC + '\'' +
                ", period=" + period +
                ", date='" + date + '\'' +
                '}';
    }
}