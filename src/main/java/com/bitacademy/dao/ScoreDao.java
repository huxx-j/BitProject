package com.bitacademy.dao;

import com.bitacademy.vo.ScoreVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScoreDao {
    @Autowired
    SqlSession sqlSession;

    public List<ScoreVo> getSubjectList(int curriNo) {
        return sqlSession.selectList("score.getSubjectList", curriNo);
    }
}
