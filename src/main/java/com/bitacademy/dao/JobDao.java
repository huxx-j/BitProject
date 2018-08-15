package com.bitacademy.dao;

import com.bitacademy.vo.GisuTableVo;

import com.bitacademy.vo.JobSearchVo;
import com.bitacademy.vo.JobVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class JobDao {

	@Autowired
	SqlSession sqlSession;

	
	//취업의뢰 리스트 가져오기
	public List<JobVo> jobRequestList(JobSearchVo jobSearchVo) {
		return sqlSession.selectList("job.jobRequestList",jobSearchVo);
	}
	
	
	/*취업의뢰 기업 상세정보 가져오기*/
	public JobVo getCompany(int company_no) {
		return sqlSession.selectOne("job.getCompany", company_no);
	}

	/*특정기업 취업의뢰 리스트*/
	public List<JobVo> getJobRequestListByComNo(int company_no) {
		return sqlSession.selectList("job.getJobRequestListByComNo", company_no);
	}
	
	/*취업의뢰 리스트*/
	public JobVo getJobRequest(int request_no) {
		return sqlSession.selectOne("job.getJobRequest", request_no);
	}
	

	
	
	
	
	//지원자 리스트 조회
	public List<GisuTableVo> getGisu(GisuTableVo gisuTableVo) {
		List<GisuTableVo> list = sqlSession.selectList("job.selectList",gisuTableVo );
		return list;
	}

	

	/*한번클릭*/
	public List<JobVo> getInterviewList(int request_no) {
		return sqlSession.selectList("job.getInterviewList",request_no);

	}

	
	
	public JobVo getReceiptDate(int company_no) {	
		return sqlSession.selectOne("job.getReceiptDate", company_no);
		
	}

	/* 취업의뢰리스트 한번클릭했을때 
	public JobVo getJobRequest(int request_no) {
		return sqlSession.selectOne("job.getJobRequest",request_no);
	}*/
}