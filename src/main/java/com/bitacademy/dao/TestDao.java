package com.bitacademy.dao;

import com.bitacademy.vo.PagerRequestVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestDao {
    @Autowired
    SqlSession sqlSession;

    public List<Object> getInfoList(PagerRequestVo pagerRequestVo) { //테이블에 들어갈 데이터를 리스트로 가져옴
        return sqlSession.selectList("test.getInfoList", pagerRequestVo);
    }

    public int getRecords(){
        return sqlSession.selectOne("test.getRecords"); //가져올 데이터의 총 개수를 가져옴
    }
}
