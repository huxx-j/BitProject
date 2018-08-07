package com.bitacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.PagerRequestVo;

@Repository
public class ApplicantDao {

	@Autowired
	SqlSession sqlSession;

	//업무구분(커리큘럼카테고리) 리스트가져오기
	public List<CurriculumCateVo> getCurriCateList(){

		return sqlSession.selectList("applicant.getCurriCateList");
	}
	//선택된 업무구분과 radio조건 반영된 수업이름 가져가기
	public List<CurriculumVo> getCurriList_state(Map<String,Object> noMap){

		return sqlSession.selectList("applicant.getCurriList_state",noMap);
	}
	
	//선택된 업무구분과 관련된 수업이름 가져가기
	public List<CurriculumVo> getCurriList(String curriculumCate_no){

		return sqlSession.selectList("applicant.getCurriList",curriculumCate_no);
	}
	
	//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기
	public List<Object> getStudentList(PagerRequestVo pagerRequestVo) {
		return sqlSession.selectList("applicant.getStudentList", pagerRequestVo);
	}
	
//	public List<ApplyUserVo> getStudentList(int curriculum_no){
//
//		List<ApplyUserVo> list = sqlSession.selectList("applicant.getStudentList",curriculum_no);
//		System.out.println(list.toString());
//
//		return list;
//	}

	public List<ApplyUserVo> getAppliedList(int user_no){

		return sqlSession.selectList("applicant.getAppliedList",user_no);
	}//선택된 사람의 과거 지원내역 가져가기

	public ApplyUserVo apply_details(Map<String,Integer> noMap) {

		return sqlSession.selectOne("applicant.apply_details",noMap);
	}//선택된 과거 지원내역의 상세내용

	public int applyUpdate(ApplyUserVo applyVo) {
		
		System.out.println("업데이트 다오");
		int result = sqlSession.update("applicant.applyUpdate",applyVo);
		System.out.println("업데이트 다오 나옴");
		return result;
	}//수정버튼 클릭 후 지원내역 수정
	
	public int getRecords(int curriculum_no) {
		return sqlSession.selectOne("applicant.getRecords",curriculum_no);
	}//데이터의 총 개수를 가져오기
	
}
