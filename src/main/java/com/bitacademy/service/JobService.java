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

	//지원자 리스트 조회
	public List<GisuTableVo> getGisu(GisuTableVo gisuTableVo) {

		return jobDao.getGisu(gisuTableVo);
	}


	/*기업정보 리스트 가져오기*/
	public List<JobVo> jobRequestList(JobSearchVo jobSearchVo) {

		return jobDao.jobRequestList(jobSearchVo);
	}

	/*한번클릭*/
	public List<JobVo> getInterviewList(int request_no) {

		return jobDao.getInterviewList(request_no);
	}

	/*두번클릭*/
	/*취업의뢰기업 상세정보 가져오기*/
	public JobVo getJobRequest(int request_no) {
		
		return jobDao.getJobRequest(request_no);
	}

}
