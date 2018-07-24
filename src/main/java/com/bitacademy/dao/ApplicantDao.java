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

	public List<CurriculumVo> getFristWorkType(){


		return sqlSession.selectList("applicant.getFristWorkType");
	}

	public List<CurriculumVo> getCurriList(String workType){

		return sqlSession.selectList("applicant.getCurriList",workType);
	}

	public List<ApplyUserVo> search(int selectValue){

		List<ApplyUserVo> list = sqlSession.selectList("applicant.getApplyStudent",selectValue);
		System.out.println(list.toString());

		return list;
	}

	public List<ApplyUserVo> getAppliedList(int user_no){

		return sqlSession.selectList("applicant.getAppliedList",user_no);
	}

	public ApplyUserVo apply_details(Map<String,Integer> noMap) {

		return sqlSession.selectOne("applicant.apply_details",noMap);
	}

	public void applyUpdate(ApplyUserVo applyVo) {

		sqlSession.update("applicant.applyUpdate",applyVo);
	}
}
