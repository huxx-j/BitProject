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

    //학생관리 탭에 유저정보를 불러오는 코드
    public List<UserInfoVo> getUserInfoList(int currino) {
        return sqlSession.selectList("userinfo.getUserInfoList", currino);

    }
}
