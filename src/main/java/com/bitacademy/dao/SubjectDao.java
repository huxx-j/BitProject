package com.bitacademy.dao;

import com.bitacademy.vo.SubjectVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SubjectDao {
	
    @Autowired
    private SqlSession sqlSession;

    public void insert(SubjectVo subjectVo){
        sqlSession.insert("subject.insert",subjectVo);
    }
}
