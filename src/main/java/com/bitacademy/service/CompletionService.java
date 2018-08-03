package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.CompletionDao;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.UserCareerVo;

@Service
public class CompletionService {

    @Autowired CompletionDao completionDao;

    public List<CurriculumVo> getWorkType(){

        return completionDao.getWorkType();
    }//맨윗줄 업무구분 가지러가기

    public List<CurriculumVo> getCurriList(String cateName){

        return completionDao.getCurriList(cateName);
    }//선택된 업무구분과 관련된 수업이름 가져가기

    public List<ApplyUserVo> search(int selectValue){
    	System.out.println("서치 서비스");
        return completionDao.search(selectValue);

    }//조회버튼 클릭 후 그리드영역 학생리스트 가져가기

    public List<UserCareerVo> afterServiceList(int user_no){

        return completionDao.afterServiceList(user_no);

    }//선택된 학생의 취업정보 가져가기

    public UserCareerVo afterService_details(int user_no,int userCareer_no) {

        Map<String,Integer> noMap = new HashMap<String,Integer>();
        noMap.put("userCareer_no", userCareer_no);
        noMap.put("user_no", user_no);

        return completionDao.afterService_details(noMap);
    }//클릭된 취업내용 상세내역 가져가기

    public int afterServiceUpdate(UserCareerVo userCareerVo) {

    	return completionDao.afterServiceUpdate(userCareerVo);
    }//수정버튼 클릭 후 취업상세내용 업데이트하기

    public int afterServiceAdd(UserCareerVo userCareerVo) {

    	if(userCareerVo.getRole().equals("")) {
    		userCareerVo.setRole("정보없음");
    		System.out.println(userCareerVo.getRole());
    	}

    	if(userCareerVo.getTelePhone().equals("")) {
    		userCareerVo.setTelePhone("정보없음");
    		System.out.println(userCareerVo.getTelePhone());
    	}
    	if(userCareerVo.getDepartment().equals("")) {
    		userCareerVo.setDepartment("정보없음");
    		System.out.println(userCareerVo.getDepartment());
    	}
    	if(userCareerVo.getCompanyAddress().equals("")) {
    		userCareerVo.setCompanyAddress("정보없음");
    		System.out.println(userCareerVo.getCompanyAddress());
    	}

    	return completionDao.afterServiceAdd(userCareerVo);
    }//저장 버튼 클릭 후 취업내용 추가하기

}
