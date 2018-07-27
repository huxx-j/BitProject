package com.bitacademy.vo;

public class CurriculumVo {

	private int curriculumCate_no;
	private int package_no;
	private String packageName;
	private int curriculum_no;
	private String workType;
	private String curriName;
	private String curriNickname;
	private String periodFr;
	private String periodTo;
	private String startDay;
	private String time;
	private int num;
	private String money;
	private String support;
	private String inquiry;
	private String state;
	private boolean mainViewFlag;
	private boolean datailViewFlag;
	private String gisuName;
	public CurriculumVo() {
		super();
	}
	public CurriculumVo(int curriculumCate_no, int package_no, String packageName, int curriculum_no, String workType,
			String curriName, String curriNickname, String periodFr, String periodTo, String startDay, String time,
			int num, String money, String support, String inquiry, String state, boolean mainViewFlag,
			boolean datailViewFlag, String gisuName) {
		super();
		this.curriculumCate_no = curriculumCate_no;
		this.package_no = package_no;
		this.packageName = packageName;
		this.curriculum_no = curriculum_no;
		this.workType = workType;
		this.curriName = curriName;
		this.curriNickname = curriNickname;
		this.periodFr = periodFr;
		this.periodTo = periodTo;
		this.startDay = startDay;
		this.time = time;
		this.num = num;
		this.money = money;
		this.support = support;
		this.inquiry = inquiry;
		this.state = state;
		this.mainViewFlag = mainViewFlag;
		this.datailViewFlag = datailViewFlag;
		this.gisuName = gisuName;
	}
	public int getCurriculumCate_no() {
		return curriculumCate_no;
	}
	public void setCurriculumCate_no(int curriculumCate_no) {
		this.curriculumCate_no = curriculumCate_no;
	}
	public int getPackage_no() {
		return package_no;
	}
	public void setPackage_no(int package_no) {
		this.package_no = package_no;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public int getCurriculum_no() {
		return curriculum_no;
	}
	public void setCurriculum_no(int curriculum_no) {
		this.curriculum_no = curriculum_no;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getCurriName() {
		return curriName;
	}
	public void setCurriName(String curriName) {
		this.curriName = curriName;
	}
	public String getCurriNickname() {
		return curriNickname;
	}
	public void setCurriNickname(String curriNickname) {
		this.curriNickname = curriNickname;
	}
	public String getPeriodFr() {
		return periodFr;
	}
	public void setPeriodFr(String periodFr) {
		this.periodFr = periodFr;
	}
	public String getPeriodTo() {
		return periodTo;
	}
	public void setPeriodTo(String periodTo) {
		this.periodTo = periodTo;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
	}
	public String getInquiry() {
		return inquiry;
	}
	public void setInquiry(String inquiry) {
		this.inquiry = inquiry;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public boolean isMainViewFlag() {
		return mainViewFlag;
	}
	public void setMainViewFlag(boolean mainViewFlag) {
		this.mainViewFlag = mainViewFlag;
	}
	public boolean isDatailViewFlag() {
		return datailViewFlag;
	}
	public void setDatailViewFlag(boolean datailViewFlag) {
		this.datailViewFlag = datailViewFlag;
	}
	public String getGisuName() {
		return gisuName;
	}
	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}
	@Override
	public String toString() {
		return "CurriculumVo [curriculumCate_no=" + curriculumCate_no + ", package_no=" + package_no + ", packageName="
				+ packageName + ", curriculum_no=" + curriculum_no + ", workType=" + workType + ", curriName="
				+ curriName + ", curriNickname=" + curriNickname + ", periodFr=" + periodFr + ", periodTo=" + periodTo
				+ ", startDay=" + startDay + ", time=" + time + ", num=" + num + ", money=" + money + ", support="
				+ support + ", inquiry=" + inquiry + ", state=" + state + ", mainViewFlag=" + mainViewFlag
				+ ", datailViewFlag=" + datailViewFlag + ", gisuName=" + gisuName + "]";
	}

}