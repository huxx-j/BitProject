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

    public List<Object> getInfoList(PagerRequestVo pagerRequestVo) {
        return sqlSession.selectList("test.getInfoList", pagerRequestVo);
    }

    public int getRecords(){
        return sqlSession.selectOne("test.getRecords");
    }
}
