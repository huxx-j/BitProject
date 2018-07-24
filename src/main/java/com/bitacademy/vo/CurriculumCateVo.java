package com.bitacademy.vo;

public class CurriculumCateVo {

	private int curriculumCate_no;
	private String cateName;
	private int groupCode;
	private int parentCode;
	private int depth;
	public CurriculumCateVo() {
		super();
	}
	public CurriculumCateVo(int curriculumCate_no, String cateName, int groupCode, int parentCode, int depth) {
		super();
		this.curriculumCate_no = curriculumCate_no;
		this.cateName = cateName;
		this.groupCode = groupCode;
		this.parentCode = parentCode;
		this.depth = depth;
	}
	public int getCurriculumCate_no() {
		return curriculumCate_no;
	}
	public void setCurriculumCate_no(int curriculumCate_no) {
		this.curriculumCate_no = curriculumCate_no;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public int getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(int groupCode) {
		this.groupCode = groupCode;
	}
	public int getParentCode() {
		return parentCode;
	}
	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "CurriculumCateVo [curriculumCate_no=" + curriculumCate_no + ", cateName=" + cateName + ", groupCode="
				+ groupCode + ", parentCode=" + parentCode + ", depth=" + depth + "]";
	}
	
	
}
