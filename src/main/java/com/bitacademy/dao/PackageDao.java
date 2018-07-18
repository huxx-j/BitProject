package com.bitacademy.dao;

import com.bitacademy.vo.PackageCateVo;
import com.bitacademy.vo.PackageVo;
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
    public void insert(PackageVo packageVo){
        sqlSession.insert("package.insert",packageVo);
    }
}
