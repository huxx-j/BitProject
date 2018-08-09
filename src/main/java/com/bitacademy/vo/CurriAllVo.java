package com.bitacademy.vo;

import java.util.List;

public class CurriAllVo {

	private CurriculumVo curriculumVo;
	private List<ApplicantVo> applicantList;
	private List<ApplicantVo> studentList;
	public CurriAllVo() {
		super();
	}
	public CurriAllVo(CurriculumVo curriculumVo, List<ApplicantVo> applicantList, List<ApplicantVo> studentList) {
		super();
		this.curriculumVo = curriculumVo;
		this.applicantList = applicantList;
		this.studentList = studentList;
	}
	public CurriculumVo getCurriculumVo() {
		return curriculumVo;
	}
	public void setCurriculumVo(CurriculumVo curriculumVo) {
		this.curriculumVo = curriculumVo;
	}
	public List<ApplicantVo> getApplicantList() {
		return applicantList;
	}
	public void setApplicantList(List<ApplicantVo> applicantList) {
		this.applicantList = applicantList;
	}
	public List<ApplicantVo> getStudentList() {
		return studentList;
	}
	public void setStudentList(List<ApplicantVo> studentList) {
		this.studentList = studentList;
	}
	@Override
	public String toString() {
		return "CurriAllVo [curriculumVo=" + curriculumVo + ", applicantList=" + applicantList + ", studentList="
				+ studentList + "]";
	}


}
