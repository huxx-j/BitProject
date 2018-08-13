package com.bitacademy.vo;

public class SubjectVo {
    private int Subject_no;
    private int SubjectCate_no;
    private String SubjectName;
    private String Outline;
    private String CateName;

    public SubjectVo() {
    }

    public SubjectVo(int subject_no, int subjectCate_no, String subjectName, String outline, String cateName) {
        Subject_no = subject_no;
        SubjectCate_no = subjectCate_no;
        SubjectName = subjectName;
        Outline = outline;
        CateName = cateName;
    }

    public int getSubject_no() {
        return Subject_no;
    }

    public void setSubject_no(int subject_no) {
        Subject_no = subject_no;
    }

    public int getSubjectCate_no() {
        return SubjectCate_no;
    }

    public void setSubjectCate_no(int subjectCate_no) {
        SubjectCate_no = subjectCate_no;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String subjectName) {
        SubjectName = subjectName;
    }

    public String getOutline() {
        return Outline;
    }

    public void setOutline(String outline) {
        Outline = outline;
    }

    public String getCateName() {
        return CateName;
    }

    public void setCateName(String cateName) {
        CateName = cateName;
    }

    @Override
    public String toString() {
        return "SubjectVo{" +
                "Subject_no=" + Subject_no +
                ", SubjectCate_no=" + SubjectCate_no +
                ", SubjectName='" + SubjectName + '\'' +
                ", Outline='" + Outline + '\'' +
                ", CateName='" + CateName + '\'' +
                '}';
    }
}

