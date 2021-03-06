package com.bitacademy.vo;

public class PackageCateVo {
    private int PackageCate_no;
    private String CateName;
    private int GroupCode;
    private int ParentCode;
    private int Depth;
    private int OrderCode;

    public PackageCateVo() {
    }

    public PackageCateVo(int packageCate_no, String cateName, int groupCode, int parentCode, int depth, int orderCode) {
        PackageCate_no = packageCate_no;
        CateName = cateName;
        GroupCode = groupCode;
        ParentCode = parentCode;
        Depth = depth;
        OrderCode = orderCode;
    }

    public int getPackageCate_no() {
        return PackageCate_no;
    }

    public void setPackageCate_no(int packageCate_no) {
        PackageCate_no = packageCate_no;
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

    @Override
    public String toString() {
        return "PackageCateVo{" +
                "PackageCate_no=" + PackageCate_no +
                ", CateName='" + CateName + '\'' +
                ", GroupCode=" + GroupCode +
                ", ParentCode=" + ParentCode +
                ", Depth=" + Depth +
                ", OrderCode=" + OrderCode +
                '}';
    }
}
