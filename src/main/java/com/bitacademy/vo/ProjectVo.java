package com.bitacademy.vo;

public class ProjectVo {

    private int project_no;
    private int curriculum_no;
    private String projectName;
    private String useLang;
    private String useDB;
    private String outline;
    private String focus;
    private String applyField;
    private String useTechnique;
    private int file_no;
    private String membersName;
    private String membersNo;
    private String fileName;

    public ProjectVo() {
    }

    public ProjectVo(int project_no, int curriculum_no, String projectName, String useLang, String useDB, String outline, String focus, String applyField, String useTechnique, int file_no, String membersName, String membersNo, String fileName) {
        this.project_no = project_no;
        this.curriculum_no = curriculum_no;
        this.projectName = projectName;
        this.useLang = useLang;
        this.useDB = useDB;
        this.outline = outline;
        this.focus = focus;
        this.applyField = applyField;
        this.useTechnique = useTechnique;
        this.file_no = file_no;
        this.membersName = membersName;
        this.membersNo = membersNo;
        this.fileName = fileName;
    }

    public int getProject_no() {
        return project_no;
    }

    public void setProject_no(int project_no) {
        this.project_no = project_no;
    }

    public int getCurriculum_no() {
        return curriculum_no;
    }

    public void setCurriculum_no(int curriculum_no) {
        this.curriculum_no = curriculum_no;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getUseLang() {
        return useLang;
    }

    public void setUseLang(String useLang) {
        this.useLang = useLang;
    }

    public String getUseDB() {
        return useDB;
    }

    public void setUseDB(String useDB) {
        this.useDB = useDB;
    }

    public String getOutline() {
        return outline;
    }

    public void setOutline(String outline) {
        this.outline = outline;
    }

    public String getFocus() {
        return focus;
    }

    public void setFocus(String focus) {
        this.focus = focus;
    }

    public String getApplyField() {
        return applyField;
    }

    public void setApplyField(String applyField) {
        this.applyField = applyField;
    }

    public String getUseTechnique() {
        return useTechnique;
    }

    public void setUseTechnique(String useTechnique) {
        this.useTechnique = useTechnique;
    }

    public int getFile_no() {
        return file_no;
    }

    public void setFile_no(int file_no) {
        this.file_no = file_no;
    }

    public String getMembersName() {
        return membersName;
    }

    public void setMembersName(String membersName) {
        this.membersName = membersName;
    }

    public String getMembersNo() {
        return membersNo;
    }

    public void setMembersNo(String membersNo) {
        this.membersNo = membersNo;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    @Override
    public String toString() {
        return "ProjectVo{" +
                "project_no=" + project_no +
                ", curriculum_no=" + curriculum_no +
                ", projectName='" + projectName + '\'' +
                ", useLang='" + useLang + '\'' +
                ", useDB='" + useDB + '\'' +
                ", outline='" + outline + '\'' +
                ", focus='" + focus + '\'' +
                ", applyField='" + applyField + '\'' +
                ", useTechnique='" + useTechnique + '\'' +
                ", file_no=" + file_no +
                ", membersName='" + membersName + '\'' +
                ", membersNo='" + membersNo + '\'' +
                ", fileName='" + fileName + '\'' +
                '}';
    }
}
