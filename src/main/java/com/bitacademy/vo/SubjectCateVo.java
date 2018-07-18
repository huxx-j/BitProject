package com.bitacademy.vo;

public class SubjectCateVo {
    private int SubjectCate_no;
    private String CateName;
    private int GroupCode;
    private int ParentCode;
    private int Depth;

    public SubjectCateVo() {
    }

    public SubjectCateVo(int subjectCate_no, String cateName, int groupCode, int parentCode, int depth) {
        SubjectCate_no = subjectCate_no;
        CateName = cateName;
        GroupCode = groupCode;
        ParentCode = parentCode;
        Depth = depth;
    }

    public int getSubjectCate_no() {
        return SubjectCate_no;
    }

    public void setSubjectCate_no(int subjectCate_no) {
        SubjectCate_no = subjectCate_no;
    }

    public String getCateName() {
        return CateName;
    }

    public void setCateName(String cateName) {
        CateName = cateName;
    }

    public int getGroupCode() {
        return GroupCode;
    }

    public void setGroupCode(int groupCode) {
        GroupCode = groupCode;
    }

    public int getParentCode() {
        return ParentCode;
    }

    public void setParentCode(int parentCode) {
        ParentCode = parentCode;
    }

    public int getDepth() {
        return Depth;
    }

    public void setDepth(int depth) {
        Depth = depth;
    }

    @Override
    public String toString() {
        return "SubjectCateVo{" +
                "SubjectCate_no=" + SubjectCate_no +
                ", CateName='" + CateName + '\'' +
                ", GroupCode=" + GroupCode +
                ", ParentCode=" + ParentCode +
                ", Depth=" + Depth +
                '}';
    }
}
