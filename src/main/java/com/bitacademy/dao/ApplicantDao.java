package com.bitacademy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.CurriculumVo;

@Repository
public class ApplicantDao {

	@Autowired
	SqlSession sqlSession;
	
	public List<CurriculumVo> getCurriList(){
		
		return sqlSession.selectList("applicant.getCurriList");
	}
	
	/*public List<StudentVo> serch(CurriculumVo curriVo){
		
		return sqlSession.selectList("student.getValStudent",curriVo);
	}*/
}
