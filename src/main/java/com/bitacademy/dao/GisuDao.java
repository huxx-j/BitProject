package com.bitacademy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GisuDao {

    @Autowired
    SqlSession sqlSession;

    public String getGisu(int curriculum_no) {
        return sqlSession.selectOne("gisu.getGisu", curriculum_no);
    }
}
