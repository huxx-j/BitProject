package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.bitacademy.dao.JobDao;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.InterViewerVo;
import com.bitacademy.vo.JobCriteriaVo;
import com.bitacademy.vo.JobReqVo;
import com.bitacademy.vo.JobRequestVo;
import com.bitacademy.vo.ResultGridVo;


@Service
public class JobService {

	@Autowired
	JobDao jobDao;

	/*취업의뢰 리스트 가져오기*/
	public ResultGridVo getJobRequestList(JobCriteriaVo jobCriteriaVo) {
		
		int page; // 요청페이지
		int records; // 총데이타수(전체데이타수)
		List<Object> rows; // 데이터리스트
		int rowCnt; // 한페이지당 출력되는 수
		
		//요청한 현재페이지 번호
		page = jobCriteriaVo.getPage();
		
		//토탈카운트 구하기 --> records
		records = jobDao.getJobRequestTotalCnt(jobCriteriaVo);
		
		//현재페이지에서 출력할 리스트 가져오기 --> rows
		rows = jobDao.getJobRequestList(jobCriteriaVo);
		
		//한페이지당 출력되는 수
		rowCnt = jobCriteriaVo.getRows();
			
		/*리턴Vo*/
		ResultGridVo resultGridVo = new ResultGridVo(page, records, rows, rowCnt);
		
		return resultGridVo;
	}

	/*면접 지원자 리스트 조회*/
	public List<InterViewerVo> getInterviewList(int request_no) {
		return jobDao.getInterviewList(request_no);
	}
	
	
	/*특정기업 취업의뢰 상세*/
	public JobRequestVo getJobRequest(int request_no) {
		//취업의뢰정보(취업의뢰+기업정보)
		JobRequestVo jobRequestVo = jobDao.getJobRequest(request_no);
		
		//취업의뢰 히스토리
		List<JobReqVo> jobReqList = jobDao.getJobReqList(jobRequestVo.getCompany_no());
		
		//지원자 리스트
		List<InterViewerVo> interViewerList = jobDao.getInterviewList(request_no);
		
		//취업의뢰정보+취업의뢰히스트뢰+지원자리스트
		jobRequestVo.setJobReqList(jobReqList);
		jobRequestVo.setInterViewerList(interViewerList);
		
		return jobRequestVo;
	}
	
	
	/*취업의뢰 히스토리*/
	public List<JobReqVo> getJobReqList(int company_no) {
		return jobDao.getJobReqList(company_no);
	}
	
	/*면접지원자 삭제*/
	public int delInterViewer(int interview_no) {
		int result = jobDao.delInterViewer(interview_no);
		return result;
	}
	
	/*면접지원자추가*/
	public int insertInterViewer(InterViewerVo interViewerVo) {
		return jobDao.insertInterViewer(interViewerVo);
	}
	
	@Transactional
	/*취업의뢰 수정(회사정보+취업의뢰정보)*/
	public int updateJobRequest(JobRequestVo jobRequestVo) {
		
		int cResult = jobDao.updateCompany(jobRequestVo);
		int rResult = jobDao.updateJobRequest(jobRequestVo);
		return cResult+rResult;
	}
	
	/*학생리스트--> 면접지원 팝업*/
	public List<ApplyUserVo> getStudentList(JobCriteriaVo jobCriteriaVo) {
		System.out.println("=============================================");
		System.out.println("=============================================");
		return jobDao.getStudentList(jobCriteriaVo);
	}
	
	/*취업의뢰기업 상세정보 가져오기(회사정보)  삭제예정*/
	/*public JobRequestVo getCompany(int company_no) {
		return jobDao.getCompany(company_no);
	}
*/
	
	
	

	

	
	
	
	
	
	
	/*
	//지원자 리스트 조회
	public List<InterViewerVo> getGisu(InterViewerVo gisuTableVo) {
		return jobDao.getGisu(gisuTableVo);
	}

*/
	
	


/*
	public JobRequestVo getReceiptDate(int company_no) {
		
		return jobDao.getReceiptDate(company_no);
	}*/
	
	
/*	 취업의뢰리스트 한번클릭했을때 
	public JobVo getJobRequest(int request_no) {

		return jobDao.getJobRequest(request_no);
	}*/
}
