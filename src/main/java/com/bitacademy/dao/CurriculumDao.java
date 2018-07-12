package com.bitacademy.dao;

import com.bitacademy.vo.CurriculumVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CurriculumDao {

    @Autowired
    SqlSession sqlSession;


    public List<String> getWorkType() {
        return sqlSession.selectList("curri.getWorkType");
    }

    public List<CurriculumVo> getCurri(String workType) {
        return sqlSession.selectList("curri.getCurri", workType);
    }

    public CurriculumVo getCurriInfo(int curriculum_no) {
        return sqlSession.selectOne("curri.getCurriInfo", curriculum_no);
    }
}
