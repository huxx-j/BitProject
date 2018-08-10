package com.bitacademy.dao;

import com.bitacademy.vo.AuthVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LoginDao {
    @Autowired
    private SqlSession sqlSession;

    public AuthVo login(Map<String, String> authMap) {
        return sqlSession.selectOne("login.login", authMap);
    }
}
