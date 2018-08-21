package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.TestInfoVo;

@Repository
public class CurriculumDao {

	@Autowired
	SqlSession sqlSession;

	// 희준
	// 교육과정 메인
	public CurriculumVo viewCurriculum(String curriculum_no) {
		return sqlSession.selectOne("curriculum.viewCurriculum", curriculum_no);
	}

	// 커리큘럼카테고리 관련
	public List<CurriculumVo> currilist() {
		return sqlSession.selectList("curriculum.currilist");
	}

	// 커리큘럼 카테고리 관련
	public List<CurriculumCateVo> curriCateList() {
		return sqlSession.selectList("curriculum.curriCateList");
	}

	// 교육과정 카테고리 추가
	public int addCurriCate(CurriculumCateVo curriCateVo) {
		return sqlSession.insert("curriculum.addCurriCate", curriCateVo);
	}
	
	// 교육과정 카테고리 수정
	public int updateCate(CurriculumCateVo curriCateVo) {
		return sqlSession.update("curriculum.updateCate", curriCateVo);
	}

	// 업무구분 select box ajax
	public List<CurriculumCateVo> getWorkType() {
		return sqlSession.selectList("curriculum.getWorkType");
	}

	// 교육과정 수정
	public int editCurri(CurriculumVo curriVo) {
		System.out.println("수정 다오 와따");
		return sqlSession.update("curriculum.editCurri", curriVo);
	}

	public int editCurriCate(CurriculumVo curriVo) {
		return sqlSession.update("curriculum.editCurriCate", curriVo);
	}

	// 교육과정 추가
	public int addCurri(CurriculumVo curriVo) {
		return sqlSession.insert("curriculum.addCurri", curriVo);
	}
	
	public int addCurriTest(TestInfoVo testInfoVo) {
		return sqlSession.insert("curriculum.addCurriTest", testInfoVo);
	}

	// 전체지원자 리스트 조회
	public List<ApplicantVo> viewApplicantList(String curriculum_no) {
		System.out.println(curriculum_no);
		return sqlSession.selectList("curriculum.viewApplicantList", curriculum_no);
	}

	// 수강생리스트 조회
	public List<ApplicantVo> viewStudentList(String curriculum_no) {
		return sqlSession.selectList("curriculum.viewStudentList", curriculum_no);
	}

	// 기수부여
	public ApplicantVo gisuGrant(int applicant_no) {
		return sqlSession.selectOne("curriculum.gisuGrant", applicant_no);
	}

	// 기수제거
	public ApplicantVo gisuRemove(int applicant_no) {
		return sqlSession.selectOne("curriculum.gisuRemove", applicant_no);
	}

	// 기수부여 저장버튼(Flag = 1)
	public int gisuGrantSave(int applicant_no) {
		return sqlSession.update("curriculum.gisuGrantSave", applicant_no);
	}

	// 기수부여 저장버튼(Flag = 0)
	public int gisuRemoveSave(int applicant_no) {
		return sqlSession.update("curriculum.gisuRemoveSave", applicant_no);
	}

	// 패키지보기 모달창
	public CurriculumVo viewPackageAjax(String package_no) {
		return sqlSession.selectOne("curriculum.viewPackageAjax", package_no);
	}

}
