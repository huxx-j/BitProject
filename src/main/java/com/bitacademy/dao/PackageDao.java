package com.bitacademy.dao;

import com.bitacademy.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PackageDao {
    @Autowired
    private SqlSession sqlSession;
    public List<PackageCateVo> selectcatelist(){
        return sqlSession.selectList("package.select");
    }
    public int insert(PackageVo packageVo){
        sqlSession.insert("package.insert",packageVo);
        System.out.println(packageVo.getPackage_no());
        return packageVo.getPackage_no();
    }

    public int insertstep(StepInPackVo stepInPackVo) {
        sqlSession.insert("package.insertstep",stepInPackVo);
        return stepInPackVo.getStep_no();
    }

    public void insertsub(SubInStepVo subInStepVo) {
        sqlSession.insert("package.insertsub",subInStepVo);
    }

    public List<PackageVo> selectpacklist() {
        return sqlSession.selectList("package.selectpack");
    }

    public PackageVo selectpackage(int no) {
        return sqlSession.selectOne("package.selectonepack",no);
    }

    public void addcate(PackageCateVo packageCateVo) {
        sqlSession.insert("package.addcate",packageCateVo);
    }

    public List<StepInPackVo> getstep(int no) {
        return sqlSession.selectList("package.getstep",no);
    }

    public void UpdateCate(SubjectCateVo subjectCateVo) {
        sqlSession.update("package.CateUpdate",subjectCateVo);
    }

    
}
