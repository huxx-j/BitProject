package com.bitacademy.vo;

public class JobReqVo {

	private int request_no;
	private int company_no;
	private String receiptDate;
	
	public JobReqVo() {
	}


	public JobReqVo(int request_no, int company_no, String receiptDate) {
		this.request_no = request_no;
		this.company_no = company_no;
		this.receiptDate = receiptDate;
	}


	public int getRequest_no() {
		return request_no;
	}


	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}


	public int getCompany_no() {
		return company_no;
	}


	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}


	public String getReceiptDate() {
		return receiptDate;
	}


	public void setReceiptDate(String receiptDate) {
		this.receiptDate = receiptDate;
	}


	@Override
	public String toString() {
		return "JobReqVo [request_no=" + request_no + ", company_no=" + company_no + ", receiptDate=" + receiptDate
				+ "]";
	}

}
