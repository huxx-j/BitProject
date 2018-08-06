package com.bitacademy.vo;

public class SubInStepVo {
    private int SubInStep_no;
    private int Step_no;
    private int Subject_no;
    private String Content;
    private int SubHour;
    private int file_no;
    private String SubjectName;
    public SubInStepVo() {
    }

    public SubInStepVo(int subInStep_no, int step_no, int subject_no, String content, int subHour, int file_no, String subjectName) {
        SubInStep_no = subInStep_no;
        Step_no = step_no;
        Subject_no = subject_no;
        Content = content;
        SubHour = subHour;
        this.file_no = file_no;
        SubjectName = subjectName;
    }

    public String getSubjectName() {
        return SubjectName;
    }

    public void setSubjectName(String subjectName) {
        SubjectName = subjectName;
    }

    public int getFile_no() {
        return file_no;
    }

    public void setFile_no(int file_no) {
        this.file_no = file_no;
    }

    public int getSubInStep_no() {
        return SubInStep_no;
    }

    public void setSubInStep_no(int subInStep_no) {
        SubInStep_no = subInStep_no;
    }

    public int getStep_no() {
        return Step_no;
    }

    public void setStep_no(int step_no) {
        Step_no = step_no;
    }

    public int getSubject_no() {
        return Subject_no;
    }

    public void setSubject_no(int subject_no) {
        Subject_no = subject_no;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String content) {
        Content = content;
    }

    public int getSubHour() {
        return SubHour;
    }

    public void setSubHour(int subHour) {
        SubHour = subHour;
    }

    @Override
    public String toString() {
        return "SubInStepVo{" +
                "SubInStep_no=" + SubInStep_no +
                ", Step_no=" + Step_no +
                ", Subject_no=" + Subject_no +
                ", Content='" + Content + '\'' +
                ", SubHour=" + SubHour +
                ", file_no=" + file_no +
                ", SubjectName='" + SubjectName + '\'' +
                '}';
    }
}
