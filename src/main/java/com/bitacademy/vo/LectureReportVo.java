package com.bitacademy.vo;

public class LectureReportVo {
    private String lectureReport_no;
    private int curriculum_no;
    private String subject;
    private String content;
    private String teacher;
    private String etc;
    private int period;
    private String classDate;

    public LectureReportVo() {
    }

    public LectureReportVo(String lectureReport_no, int curriculum_no, String subject, String content, String teacher, String etc, int period, String classDate) {
        this.lectureReport_no = lectureReport_no;
        this.curriculum_no = curriculum_no;
        this.subject = subject;
        this.content = content;
        this.teacher = teacher;
        this.etc = etc;
        this.period = period;
        this.classDate = classDate;
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

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getEtc() {
        return etc;
    }

    public void setEtc(String etc) {
        this.etc = etc;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getClassDate() {
        return classDate;
    }

    public void setClassDate(String classDate) {
        this.classDate = classDate;
    }

    @Override
    public String toString() {
        return "LectureReportVo{" +
                "lectureReport_no='" + lectureReport_no + '\'' +
                ", curriculum_no=" + curriculum_no +
                ", subject='" + subject + '\'' +
                ", content='" + content + '\'' +
                ", teacher='" + teacher + '\'' +
                ", etc='" + etc + '\'' +
                ", period=" + period +
                ", classDate='" + classDate + '\'' +
                '}';
    }
}