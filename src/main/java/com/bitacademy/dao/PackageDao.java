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

    public List<SubInStepVo> getsublist(int no) {
        List<SubInStepVo> sublist=sqlSession.selectList("package.sublist", no);
        return sublist;
    }

    public List<PackageCateVo> selectcatelist(){
        return sqlSession.selectList("package.select");
    }

    public int insert(PackageVo packageVo){
        sqlSession.insert("package.insert",packageVo);

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

    public void UpdateCate(PackageCateVo packageCateVo) {
        sqlSession.update("package.CateUpdate",packageCateVo);
    }

    public int getReferenceCnt(int package_no){
        return sqlSession.selectOne("curriculum.getReferenceCnt", package_no);

    }
//
//    public void updateSub(SubInStepVo subInStepVo) {
//        sqlSession.update("package.updateSub",subInStepVo);
//    }
//
//    public int updateStep(StepInPackVo stepInPackVo) {
//       return sqlSession.update("package.updateStep",stepInPackVo);
//    }
//
//    public void deleteSubInPack(int no) {
//    }

    public void delCate(int id) {
        sqlSession.update("package.delCate",id);
    }
    public void delChildCate(int pid){
        sqlSession.update("package.delChildCate",pid);
    }

    public void deleteStepInPack(int package_no) {
        sqlSession.delete("package.deleteStepInPack",package_no);

    }

    public void deleteSubInStep(int step_no) {
        sqlSession.delete("package.deleteSubInStep",step_no);
    }

    public PackageCateVo getPackCate(int no) {
        return sqlSession.selectOne("package.getPackCate",no);
    }

    public void delPackage(int no) {
        sqlSession.update("package.delPackage",no);
    }

    public void updatePackage(PackageVo packageVo) {
        sqlSession.update("package.updatePackage",packageVo);
    }
}
