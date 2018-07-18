package com.bitacademy.dao;

import com.bitacademy.vo.UserInfoVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserInfoDao {
    @Autowired
    SqlSession sqlSession;

    public List<UserInfoVo> getUserInfo(int currino) {
        return sqlSession.selectList("userinfo.getUserInfo", currino);

    }
}
