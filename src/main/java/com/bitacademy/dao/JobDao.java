package com.bitacademy.dao;

import com.bitacademy.vo.InterViewerVo;

import com.bitacademy.vo.JobCriteriaVo;
import com.bitacademy.vo.JobReqVo;
import com.bitacademy.vo.JobRequestVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class JobDao {

	@Autowired
	SqlSession sqlSession;

	
	//취업의뢰 리스트 가져오기(현재페이지)
	public List<Object> getJobRequestList(JobCriteriaVo jobCriteriaVo) {
		return sqlSession.selectList("job.getJobRequestList",jobCriteriaVo);
	}

	//전체 취업의뢰 리스트 count 구하기
	public int getJobRequestTotalCnt(JobCriteriaVo jobCriteriaVo) {
		return sqlSession.selectOne("job.getJobRequestTotalCnt",jobCriteriaVo);
	}
	
	/*면접지원자 리스트*/
	public List<InterViewerVo> getInterviewList(int request_no) {
		return sqlSession.selectList("job.getInterviewList", request_no);
	}
	
	/*특정기업 취업의뢰 상세*/
	public JobRequestVo getJobRequest(int request_no) {
		return sqlSession.selectOne("job.getJobRequest", request_no);
	}
	
	/*특정기업 취업의뢰 리스트*/
	public List<JobReqVo> getJobReqList(int company_no) {
		return sqlSession.selectList("job.getJobReqList", company_no);
	}
	
	
	/*면접지원자 삭제*/
	public int delInterViewer(int interview_no) {
		int result = sqlSession.delete("job.delInterViewer", interview_no);
		return result;
	}
	
	/*회사정보 수정*/
	public int updateCompany(JobRequestVo jobRequestVo) {
		int result = sqlSession.update("job.updateCompany", jobRequestVo);
		return result;
	}
	
	/*취업의뢰 수정*/
	public int updateJobRequest(JobRequestVo jobRequestVo) {
		int result = sqlSession.update("job.updateJobRequest", jobRequestVo);
		return result;
	}
	
	
	
	
	
	/*취업의뢰 기업 상세정보 가져오기(회사정보)
	public JobRequestVo getCompany(int company_no) {
		return sqlSession.selectOne("job.getCompany", company_no);
	}
	*/
	
	
	
	

	
	
	
	
	
	
/*	//지원자 리스트 조회
	public List<InterViewerVo> getGisu(InterViewerVo gisuTableVo) {
		List<InterViewerVo> list = sqlSession.selectList("job.selectList",gisuTableVo );
		return list;
	}
*/
	

	

	
	
	/*public JobRequestVo getReceiptDate(int company_no) {	
		return sqlSession.selectOne("job.getReceiptDate", company_no);
		
	}*/

	/* 취업의뢰리스트 한번클릭했을때 
	public JobVo getJobRequest(int request_no) {
		return sqlSession.selectOne("job.getJobRequest",request_no);
	}*/
}