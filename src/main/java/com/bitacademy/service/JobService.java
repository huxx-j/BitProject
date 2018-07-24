package com.bitacademy.service;

import com.bitacademy.dao.JobDao;
import com.bitacademy.vo.GisuVo;
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

	public List<JobVo> getJob(int radio, String date1, String date2) {

		Map<String, Object> map = new HashMap<>(); // Object 첫번째 키값
		map.put("radio", radio);
		map.put("date1", date1);
		map.put("date2", date2);

		return jobDao.getJob(map);
	}

	public List<GisuVo> getGisu(String gisu, String name) {

		Map<String, String> map = new HashMap<>(); // Object 첫번째 키값
		map.put("gisu", gisu);
		map.put("name", name);
		

		return jobDao.getGisu(map);
	}
}
