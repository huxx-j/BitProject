package com.bitacademy.vo;

public class InterViewerVo {
	private String request_no;
	private String user_no;
	private String interview_no;
	private String nameHan;
	private String applyDate;
	private String result;
	private String gisuName;

	public InterViewerVo() {
		super();
	}

	public InterViewerVo(String request_no, String user_no, String interview_no, String nameHan, String applyDate,
			String result, String gisuName) {
		super();
		this.request_no = request_no;
		this.user_no = user_no;
		this.interview_no = interview_no;
		this.nameHan = nameHan;
		this.applyDate = applyDate;
		this.result = result;
		this.gisuName = gisuName;
	}

	public String getRequest_no() {
		return request_no;
	}

	public void setRequest_no(String request_no) {
		this.request_no = request_no;
	}

	public String getUser_no() {
		return user_no;
	}

	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}

	public String getInterview_no() {
		return interview_no;
	}

	public void setInterview_no(String interview_no) {
		this.interview_no = interview_no;
	}

	public String getNameHan() {
		return nameHan;
	}

	public void setNameHan(String nameHan) {
		this.nameHan = nameHan;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getGisuName() {
		return gisuName;
	}

	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}

	@Override
	public String toString() {
		return "InterViewerVo [request_no=" + request_no + ", user_no=" + user_no + ", interview_no=" + interview_no
				+ ", nameHan=" + nameHan + ", applyDate=" + applyDate + ", result=" + result + ", gisuName=" + gisuName
				+ "]";
	}

}
