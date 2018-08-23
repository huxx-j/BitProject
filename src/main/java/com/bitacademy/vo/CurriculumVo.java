package com.bitacademy.vo;

import java.util.Arrays;
import java.util.List;

public class CurriculumVo {

	private int curriculumCate_no;
	private int package_no;
	private String packageName;
	private int curriculum_no;
	private String cateName;
	private String curriName;
	private String curriNickname;
	private String startDate;
	private String endDate;
	private String time;
	private int maxCnt;
	private String price;
	private String support;
	private String gisuName;
	private String managerInfo;
	private String state;
	private int mainViewFlag;
	private int detailViewFlag;
	private List<TestInfoVo> testInfoList;
	public CurriculumVo() {
		super();
	}
	public CurriculumVo(int curriculumCate_no, int package_no, String packageName, int curriculum_no, String cateName,
			String curriName, String curriNickname, String startDate, String endDate, String time, int maxCnt,
			String price, String support, String gisuName, String managerInfo, String state, int mainViewFlag,
			int detailViewFlag, List<TestInfoVo> testInfoList) {
		super();
		this.curriculumCate_no = curriculumCate_no;
		this.package_no = package_no;
		this.packageName = packageName;
		this.curriculum_no = curriculum_no;
		this.cateName = cateName;
		this.curriName = curriName;
		this.curriNickname = curriNickname;
		this.startDate = startDate;
		this.endDate = endDate;
		this.time = time;
		this.maxCnt = maxCnt;
		this.price = price;
		this.support = support;
		this.gisuName = gisuName;
		this.managerInfo = managerInfo;
		this.state = state;
		this.mainViewFlag = mainViewFlag;
		this.detailViewFlag = detailViewFlag;
		this.testInfoList = testInfoList;
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
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getMaxCnt() {
		return maxCnt;
	}
	public void setMaxCnt(int maxCnt) {
		this.maxCnt = maxCnt;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getSupport() {
		return support;
	}
	public void setSupport(String support) {
		this.support = support;
	}
	public String getGisuName() {
		return gisuName;
	}
	public void setGisuName(String gisuName) {
		this.gisuName = gisuName;
	}
	public String getManagerInfo() {
		return managerInfo;
	}
	public void setManagerInfo(String managerInfo) {
		this.managerInfo = managerInfo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getMainViewFlag() {
		return mainViewFlag;
	}
	public void setMainViewFlag(int mainViewFlag) {
		this.mainViewFlag = mainViewFlag;
	}
	public int getDetailViewFlag() {
		return detailViewFlag;
	}
	public void setDetailViewFlag(int detailViewFlag) {
		this.detailViewFlag = detailViewFlag;
	}
	public List<TestInfoVo> getTestInfoList() {
		return testInfoList;
	}
	public void setTestInfoList(List<TestInfoVo> testInfoList) {
		this.testInfoList = testInfoList;
	}
	@Override
	public String toString() {
		return "CurriculumVo [curriculumCate_no=" + curriculumCate_no + ", package_no=" + package_no + ", packageName="
				+ packageName + ", curriculum_no=" + curriculum_no + ", cateName=" + cateName + ", curriName="
				+ curriName + ", curriNickname=" + curriNickname + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", time=" + time + ", maxCnt=" + maxCnt + ", price=" + price + ", support=" + support + ", gisuName="
				+ gisuName + ", managerInfo=" + managerInfo + ", state=" + state + ", mainViewFlag=" + mainViewFlag
				+ ", detailViewFlag=" + detailViewFlag + ", testInfoList=" + testInfoList + "]";
	}

	
	
	
	
}