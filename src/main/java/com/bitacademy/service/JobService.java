package com.bitacademy.service;

import com.bitacademy.dao.JobDao;
import com.bitacademy.vo.GisuVo;
import com.bitacademy.vo.JobSearchVo;
import com.bitacademy.vo.JobVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class JobService {

	@Autowired
	JobDao jobDao;

	//지원자 리스트 조회
	public List<GisuVo> getGisu(String gisu, String name) {

		Map<String, String> map = new HashMap<>();
		map.put("gisu", gisu);
		map.put("name", name);

		return jobDao.getGisu(map);
	}


	/*기업정보 리스트 가져오기*/
	public List<JobVo> comSearch(JobSearchVo jobSearchVo) {

		return jobDao.comSelectList(jobSearchVo);
	}

	public List<JobVo> getSearchList(int commpany_no) {

		return jobDao.getSearchList(commpany_no);
	}

}
