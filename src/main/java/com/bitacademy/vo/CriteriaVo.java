package com.bitacademy.vo;

public class CriteriaVo {

	private int page; //선택한 페이지
	private int rows; //한페이지에 출력갯수
	private String sidx; //정렬항목
	private String sord; //정렬방법 오름차순 or 내림차순
	private Object param; //기타 파라미터

	public CriteriaVo() {
	}

	public CriteriaVo(int page, int rows, String sidx, String sord, Object param) {
		this.page = page;
		this.rows = rows;
		this.sidx = sidx;
		this.sord = sord;
		this.param = param;
	}

	/*계산함수*/
	public int getStartNum() {
		int startNum = rows * (page - 1)+1;
		return startNum;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
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

	public Object getParam() {
		return param;
	}

	public void setParam(Object param) {
		this.param = param;
	}
	
	@Override
	public String toString() {
		return "CriteriaVo [page=" + page + ", rows=" + rows + ", sidx=" + sidx + ", sord=" + sord + ", param=" + param + ", startNum=" + getStartNum()
				+ "]";
	}

}
