package com.bitacademy.dao;

import com.bitacademy.vo.MaxdepthVo;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubjectDao {
    @Autowired
    private SqlSession sqlSession;

    public void insert(SubjectVo subjectVo){
        sqlSession.insert("subject.insert",subjectVo);
    }

    public List<SubjectCateVo> selectcatelist(){

       return sqlSession.selectList("subject.listselect");
    }
    public List<SubjectVo> selectsublist(){

        return sqlSession.selectList("subject.subselect");
    }

    public List<MaxdepthVo> selectmdlist() {
        return sqlSession.selectList("subject.mdselect");
    }
}
