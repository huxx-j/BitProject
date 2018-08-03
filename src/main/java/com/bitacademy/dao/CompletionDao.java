package com.bitacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.UserCareerVo;

@Repository
public class CompletionDao {

    @Autowired SqlSession sqlSession;

    //업무구분(커리큘럼카테고리) 리스트가져오기	
    public List<CurriculumCateVo> getCurriCateList(){

        return sqlSession.selectList("applicant.getCurriCateList");
    }

    public List<CurriculumVo> getCurriList(int curriculumCate_no){

        return sqlSession.selectList("applicant.getCurriList",curriculumCate_no);
    }//선택된 업무구분과 관련된 수업이름 가져가기

    public List<ApplyUserVo> getStudentList(int curriculum_no){
    	System.out.println("서치 다오");
        List<ApplyUserVo> list = sqlSession.selectList("completion.getCompletionStudent",curriculum_no);
        System.out.println(list.toString());
        System.out.println("서치 다오 돌아옴");
        return list;
    }//조회버튼 클릭 후 그리드영역 학생리스트 가져가기

    public List<UserCareerVo> getUserCareerList(int user_no){

        return sqlSession.selectList("completion.getUserCareerList",user_no);
    }//선택된 학생의 취업정보 가져가기

    public UserCareerVo getUserCareer(Map<String,Integer> noMap) {

    	System.out.println(noMap+"+detail 다오");
        return sqlSession.selectOne("completion.getUserCareer",noMap);

    }//클릭된 취업내용 상세내역 가져가기

    public int afterServiceUpdate(UserCareerVo userCareerVo) {
    		System.out.println("업데이트다오");
    		int result = sqlSession.update("completion.afterServiceUpdate",userCareerVo);
    		System.out.println(result);

    		return result;
    }//수정버튼 클릭 후 취업상세내용 업데이트하기

    public int afterServiceAdd(UserCareerVo userCareerVo) {

		int result = sqlSession.insert("completion.afterServiceAdd",userCareerVo);
		System.out.println(result);

		return result;
    }//저장 버튼 클릭 후 취업내용 추가하기

}
