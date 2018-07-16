package com.bitacademy.dao;

import com.bitacademy.vo.UsersVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDao {
    @Autowired
    SqlSession sqlSession;


    public List<UsersVo> getMemberName(int curriNo) {
        return sqlSession.selectList("project.getMemberName", curriNo);
    }
}
