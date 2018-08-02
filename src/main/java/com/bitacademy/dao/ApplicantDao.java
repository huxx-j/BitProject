package com.bitacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;

@Repository
public class ApplicantDao {

	@Autowired
	SqlSession sqlSession;

	public List<CurriculumVo> getWorkType(){

		return sqlSession.selectList("applicant.getWorkType");
	}//맨윗줄 업무구분 가져가기

	public List<CurriculumVo> getCurriList(String workType){

		return sqlSession.selectList("applicant.getCurriList",workType);
	}//맨윗줄 업무구분관련된 수업이름 가져가기

	public List<ApplyUserVo> search(int selectValue){

		List<ApplyUserVo> list = sqlSession.selectList("applicant.getApplyStudent",selectValue);
		/*System.out.println(list.toString());*/

		return list;
	}//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기

	public List<ApplyUserVo> getAppliedList(int user_no){

		return sqlSession.selectList("applicant.getAppliedList",user_no);
	}//선택된 사람의 과거 지원내역 가져가기

	public ApplyUserVo apply_details(Map<String,Integer> noMap) {

		return sqlSession.selectOne("applicant.apply_details",noMap);
	}//선택된 과거 지원내역의 상세내용

	public void applyUpdate(ApplyUserVo applyVo) {

		sqlSession.update("applicant.applyUpdate",applyVo);
	}//수정버튼 클릭 후 지원내역 수정
}
