package com.bitacademy.service;

import com.bitacademy.dao.JobDao;
import com.bitacademy.vo.GisuTableVo;

import com.bitacademy.vo.JobSearchVo;
import com.bitacademy.vo.JobVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;


@Service
public class JobService {

	@Autowired
	JobDao jobDao;

	/*기업정보 리스트 가져오기*/
	public List<JobVo> jobRequestList(JobSearchVo jobSearchVo) {
		return jobDao.jobRequestList(jobSearchVo);
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
}
