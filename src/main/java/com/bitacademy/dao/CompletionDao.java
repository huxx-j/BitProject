package com.bitacademy.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.UserCareerVo;

@Repository
public class CompletionDao {

    @Autowired SqlSession sqlSession;

    public List<CurriculumVo> getWorkType(){

        return sqlSession.selectList("applicant.getWorkType");
    }//맨윗줄 업무구분 가지러가기

    public List<CurriculumVo> getCurriList(String cateName){

        return sqlSession.selectList("applicant.getCurriList",cateName);
    }//선택된 업무구분과 관련된 수업이름 가져가기

    public List<ApplyUserVo> search(int selectValue){
    	System.out.println("서치 다오");
        List<ApplyUserVo> list = sqlSession.selectList("completion.getCompletionStudent",selectValue);
        System.out.println(list.toString());
        System.out.println("서치 다오 돌아옴");
        return list;
    }//조회버튼 클릭 후 그리드영역 학생리스트 가져가기

    public List<UserCareerVo> afterServiceList(int user_no){

        return sqlSession.selectList("completion.afterServiceList",user_no);
    }//선택된 학생의 취업정보 가져가기

    public UserCareerVo afterService_details(Map<String,Integer> noMap) {

    	System.out.println(noMap+"+detail 다오");
        return sqlSession.selectOne("completion.afterService_details",noMap);

    }//클릭된 취업내용 상세내역 가져가기

    public int afterServiceUpdate(UserCareerVo userCareerVo) {

    		int result = sqlSession.update("completion.afterServiceUpdate",userCareerVo);
    		/*System.out.println(result);*/

    		return result;
    }//수정버튼 클릭 후 취업상세내용 업데이트하기

    public int afterServiceAdd(UserCareerVo userCareerVo) {

		int result = sqlSession.insert("completion.afterServiceAdd",userCareerVo);
		System.out.println(result);

		return result;
    }//저장 버튼 클릭 후 취업내용 추가하기

}
