package com.bitacademy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ClassManagementDao {

    @Autowired
    SqlSession sqlSession;

    public List<String> getWorkType() {
        return sqlSession.selectList("class.getWorkType");
    }

    public List<String> getCurri(String workType) {
        return sqlSession.selectList("class.getCurri", workType);
    }
}
