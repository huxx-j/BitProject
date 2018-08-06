package com.bitacademy.vo;

public class PagerRequestVo {
    private int page;
    private int rows;
    private String sidx;
    private String sord;
    private int startNum;

    public PagerRequestVo() {
    }

    public PagerRequestVo(int page, int rows, String sidx, String sord, int startNum) {
        this.page = page;
        this.rows = rows;
        this.sidx = sidx;
        this.sord = sord;
        this.startNum = startNum;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getStartNum() {
        return startNum;
    }

    public void setStartNum(int startNum) {
        this.startNum = startNum;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    @Override
    public String toString() {
        return "PagerRequestVo{" +
                "rows=" + rows +
                ", page=" + page +
                ", sidx='" + sidx + '\'' +
                ", sord='" + sord + '\'' +
                '}';
    }
}
