package com.bitacademy.dao;

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

    public List<Integer> selectnlist() {
        return sqlSession.selectList("subject.nselect");
    }

    public SubjectVo getsub(int no) {
        return sqlSession.selectOne("subject.sub", no);
    }
    public void UpdateCate(SubjectCateVo subjectCateVo) {
        sqlSession.update("subject.CateUpdate",subjectCateVo);
    }
    public void UpdateSubjectPid(SubjectCateVo subjectCateVo){
        sqlSession.update("subject.UpdateSubjectPid",subjectCateVo);
    }
    public void UpdateSubject(SubjectVo subjectVo){
        sqlSession.update("subject.UpdateSubject",subjectVo);
    }
    public void addcate(SubjectCateVo subjectCateVo) {
        sqlSession.insert("subject.addcate",subjectCateVo);
    }


    public void delSubject(int no) {
        sqlSession.update("subject.delSubject",no);
    }
    public void delChildSubject(int pid) {
        sqlSession.update("subject.delChildSubject",pid);
    }

    public void delCate(int id) {
        sqlSession.update("subject.delCate",id);
    }
    public void delChildCate(int pid){
        sqlSession.update("subject.delChildCate",pid);
    }

    public SubjectCateVo getSubCate(int no) {
        return sqlSession.selectOne("subject.getSubCate",no);
    }
}
