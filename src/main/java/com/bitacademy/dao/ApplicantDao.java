package com.bitacademy.dao;

import java.util.List;

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
	
	public List<ApplyUserVo> search(CurriculumVo curriVo){
		
		List<ApplyUserVo> list = sqlSession.selectList("applicant.getApplyStudent",curriVo);
		System.out.println(list.toString());
		
		return list;
	}
}
