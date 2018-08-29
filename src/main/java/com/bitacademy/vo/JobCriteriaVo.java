package com.bitacademy.vo;

public class JobCriteriaVo extends CriteriaVo {

	private String comCondition;
	private String startDate;
	private String endDate;
	private String keyword;

	public JobCriteriaVo() {
	}

	public JobCriteriaVo(String comCondition, String startDate, String endDate, String keyword) {
		super();
		this.comCondition = comCondition;
		this.startDate = startDate;
		this.endDate = endDate;
		this.keyword = keyword;
	}

	public String getComCondition() {
		return comCondition;
	}

	public void setComCondition(String comCondition) {
		this.comCondition = comCondition;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "JobCriteriaVo [comCondition=" + comCondition + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", keyword=" + keyword + ", getStartNum()=" + getStartNum() + ", getPage()=" + getPage()
				+ ", getRows()=" + getRows() + ", getSidx()=" + getSidx() + ", getSord()=" + getSord() + ", getParam()="
				+ getParam() + "]";
	}

}
