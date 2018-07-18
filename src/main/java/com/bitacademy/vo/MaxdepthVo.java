package com.bitacademy.vo;

public class MaxdepthVo {
    private int GroupCode;
    private int Depth;

    public MaxdepthVo() {
    }

    public MaxdepthVo(int groupCode, int depth) {
        GroupCode = groupCode;
        Depth = depth;
    }

    public int getGroupCode() {
        return GroupCode;
    }

    public void setGroupCode(int groupCode) {
        GroupCode = groupCode;
    }

    public int getDepth() {
        return Depth;
    }

    public void setDepth(int depth) {
        Depth = depth;
    }

    @Override
    public String toString() {
        return "MaxdepthVo{" +
                "GroupCode=" + GroupCode +
                ", Depth=" + Depth +
                '}';
    }
}
