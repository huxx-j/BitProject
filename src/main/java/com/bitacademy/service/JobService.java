package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.JobDao;
import com.bitacademy.vo.GisuTableVo;
import com.bitacademy.vo.JobCriteriaVo;
import com.bitacademy.vo.JobVo;
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

	
	/*취업의뢰기업 상세정보 가져오기*/
	public JobVo getCompany(int company_no) {
		return jobDao.getCompany(company_no);
	}

	/*특정기업 취업의뢰 리스트*/
	public List<JobVo> getJobRequestListByComNo(int company_no) {
		return jobDao.getJobRequestListByComNo(company_no);
	}
	
	/*특정기업 취업의뢰 상세*/
	public JobVo getJobRequest(int request_no) {
		return jobDao.getJobRequest(request_no);
	}
	
	
	
	
	//지원자 리스트 조회
	public List<GisuTableVo> getGisu(GisuTableVo gisuTableVo) {
		return jobDao.getGisu(gisuTableVo);
	}


	
	/*한번클릭*/
	public List<JobVo> getInterviewList(int request_no) {

		return jobDao.getInterviewList(request_no);
	}



	public JobVo getReceiptDate(int company_no) {
		
		return jobDao.getReceiptDate(company_no);
	}
	
	
/*	 취업의뢰리스트 한번클릭했을때 
	public JobVo getJobRequest(int request_no) {

		return jobDao.getJobRequest(request_no);
	}*/
}
