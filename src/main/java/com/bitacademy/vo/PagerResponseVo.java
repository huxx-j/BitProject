package com.bitacademy.vo;


import java.util.List;

public class PagerResponseVo {
    private int page;
    private int records;
    private List<Object> rows;
    private int total;


    public PagerResponseVo() {
    }

    public PagerResponseVo(int page, int records, List<Object> rows, int total) {
        this.page = page;
        this.records = records;
        this.rows = rows;
        this.total = total;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRecords() {
        return records;
    }

    public void setRecords(int records) {
        this.records = records;
    }

    public List<Object> getRows() {
        return rows;
    }

    public void setRows(List<Object> rows) {
        this.rows = rows;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "PagerResponseVo{" +
                "page=" + page +
                ", records=" + records +
                ", rows=" + rows +
                ", total=" + total +
                '}';
    }
}

