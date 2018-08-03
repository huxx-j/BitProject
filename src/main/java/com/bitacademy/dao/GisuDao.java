package com.bitacademy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GisuDao {

    @Autowired
    SqlSession sqlSession;

    //커리큐럼 넘버로 기수만 불러오는 코드
    public String getGisu(int curriculum_no) {
        return sqlSession.selectOne("gisu.getGisu", curriculum_no);
    }
}
