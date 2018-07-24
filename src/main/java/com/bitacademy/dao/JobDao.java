package com.bitacademy.dao;

import com.bitacademy.vo.GisuVo;
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

	
	/*조회 1번째*/
	
	public List<JobVo> getJob(Map<String, Object> map) {

		// 세개 보낼때는 Map
		return sqlSession.selectList("job.selectList", map);

		// job은 <mapper namespace="job"> 이고 . selectList은 <select id="selectList" 이다.

	}

	
	/*지원자 리스트 조회*/
	
	public List<GisuVo> getGisu(Map<String, String> map) {

		// 세개 보낼때는 Map
		return sqlSession.selectList("job.selectList2", map);

		// job은 <mapper namespace="job"> 이고 . selectList2은 <select id="selectList2" 이다.

	}

}