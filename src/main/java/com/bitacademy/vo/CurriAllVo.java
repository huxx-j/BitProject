package com.bitacademy.vo;

import java.util.List;

public class CurriAllVo {

	private CurriculumVo curriculumVo;
	private List<ApplicantVo> applicantList;

	public CurriAllVo() {
		super();
	}

	public CurriAllVo(CurriculumVo curriculumVo, List<ApplicantVo> applicantList) {
		super();
		this.curriculumVo = curriculumVo;
		this.applicantList = applicantList;
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

	@Override
	public String toString() {
		return "CurriAllVo [curriculumVo=" + curriculumVo + ", applicantList=" + applicantList + "]";
	}

}
