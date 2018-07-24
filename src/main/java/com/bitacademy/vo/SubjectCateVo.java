package com.bitacademy.vo;

public class SubjectCateVo {
    private int SubjectCate_no;
    private String CateName;
    private int GroupCode;
    private int ParentCode;
    private int Depth;
    private int OrderCode;
    private int Subject_no;

    public SubjectCateVo() {
}

    public SubjectCateVo(int subjectCate_no, String cateName, int groupCode, int parentCode, int depth, int orderCode, int subject_no) {
        SubjectCate_no = subjectCate_no;
        CateName = cateName;
        GroupCode = groupCode;
        ParentCode = parentCode;
        Depth = depth;
        OrderCode = orderCode;
        Subject_no = subject_no;
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

    public int getOrderCode() {
        return OrderCode;
    }

    public void setOrderCode(int orderCode) {
        OrderCode = orderCode;
    }

    public int getSubject_no() {
        return Subject_no;
    }

    public void setSubject_no(int subject_no) {
        Subject_no = subject_no;
    }
}
