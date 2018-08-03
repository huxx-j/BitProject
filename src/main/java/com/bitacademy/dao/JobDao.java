package com.bitacademy.dao;

import com.bitacademy.vo.GisuVo;
import com.bitacademy.vo.JobSearchVo;
import com.bitacademy.vo.JobVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class JobDao {

	@Autowired
	SqlSession sqlSession;

	
	//지원자 리스트 조회

	public List<GisuVo> getGisu(Map<String, String> map) {

		return sqlSession.selectList("job.selectList2", map);

	}

	public List<JobVo> comSelectList(JobSearchVo jobSearchVo) {

		List<JobVo> list = sqlSession.selectList("job.getSeachStudent",jobSearchVo);
		System.out.println(list.toString());

		return list;

	}

	public List<JobVo> getSearchList(int commpany_no) {

		return sqlSession.selectList("job.getSeachStudent",commpany_no);

	}
}