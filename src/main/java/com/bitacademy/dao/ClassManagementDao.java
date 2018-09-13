package com.bitacademy.dao;

import com.bitacademy.vo.CurriculumVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ClassManagementDao {

    @Autowired
    SqlSession sqlSession;

    //업무구분에 카테코리 이름을 불러오는 코드
    public List<String> getCateName() {
        return sqlSession.selectList("class.getCateName");
    }

    //업무구분에 따라 커리큘럼 리스트를 불러오는 코드
    public List<CurriculumVo> getCurriList(Map<String, Object> map) {
        return sqlSession.selectList("class.getCurriList", map);
    }

    //교육과정검색에 조회버튼을 누르면 커리큘럼 정보는 불러오는 코드
    public CurriculumVo getCurriInfo(int curriculum_no) {
        return sqlSession.selectOne("class.getCurriInfo", curriculum_no);
    }

    //다비의 현재 날짜를 불러오는 코드
    public String getDate() {
        return sqlSession.selectOne("class.getDate");
    }


}
