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

	
	//지원자 리스트 조회

	public List<GisuTableVo> getGisu(GisuTableVo gisuTableVo) {

		List<GisuTableVo> list = sqlSession.selectList("job.selectList",gisuTableVo );
		return list;
	}

	//기업정보 리스트 가져오기
	public List<JobVo> jobRequestList(JobSearchVo jobSearchVo) {

		List<JobVo> list = sqlSession.selectList("job.jobRequestList",jobSearchVo);
		return list;

	}

	/*한번클릭*/
	public List<JobVo> getInterviewList(int request_no) {

		return sqlSession.selectList("job.getInterviewList",request_no);

	}

	/*두번클릭*/
	/*취업의뢰기업 상세정보 가져오기*/
	public JobVo getJobRequest(int request_no) {
		
		return sqlSession.selectOne("job.getJobRequest",request_no);
		
	}
}