package com.bitacademy.dao;

import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CurriculumDao {

    @Autowired
    SqlSession sqlSession;

    //성우
    public List<String> getWorkType() {
        return sqlSession.selectList("curriculum.getWorkType");
    }

    public List<CurriculumVo> getCurri(String workType) {
        return sqlSession.selectList("curriculum.getCurri", workType);
    }

    public CurriculumVo getCurriInfo(int curriculum_no) {
        return sqlSession.selectOne("curriculum.getCurriInfo", curriculum_no);
    }


    //희준
    //교육과정 메인
    public CurriculumVo viewCurriculum(String curriculum_no ){

        return sqlSession.selectOne("curriculum.viewCurriculum",curriculum_no);
    }
    public List<CurriculumVo> currilist(){
        return sqlSession.selectList("curriculum.currilist");
    }
    public List<CurriculumCateVo> curriCateList(){

        return sqlSession.selectList("curriculum.curriCateList");
    }
    
    //교육과정 수정
    public int edit(CurriculumVo curriVo) {

        return sqlSession.update("curriculum.edit", curriVo);
    }
    //교육과정 추가
    public int addCurri(CurriculumVo curriVo) {

        return sqlSession.insert("curriculum.addCurri", curriVo);
    }
    
    //전체지원자 리스트 조회
    public ApplicantVo viewApplicantList(String curriculum_no) {
    	return sqlSession.selectOne("curriculum.viewApplicantList", curriculum_no);
    }
//    public List<ApplicantVo> studentManagement(String curriculum_no){
//        System.out.println("[curriDao] studentManagement");
//        return sqlSession.selectList("curriculum.studentManagement", curriculum_no);
//    }

//	public List<CurriculumVo> viewCurriculum( ){
//		System.out.println("[curriDao] viewCurriculum");
//
//		return sqlSession.selectList("curriculum.viewCurriculum");
//	}
//	public List<CurriculumVo> viewCurriculumInfo(int curriculum_no){
//		System.out.println("[curriDao] viewCurriculum");
//
//		return sqlSession.selectList("curriculum.viewCurriculumInfo", curriculum_no);
//	}

}
