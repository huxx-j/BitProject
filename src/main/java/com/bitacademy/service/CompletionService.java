package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.CompletionDao;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.UserCareerVo;

@Service
public class CompletionService {

    @Autowired CompletionDao completionDao;

    //업무구분(커리큘럼카테고리) 리스트가져오기	
    public List<CurriculumCateVo> getCurriCateList(){

        return completionDao.getCurriCateList();
    }
    
    //선택된 업무구분과 관련된 수업이름 가져가기
    public List<CurriculumVo> getCurriList(int curriculumCate_no){

        return completionDao.getCurriList(curriculumCate_no);
    }
    
    //조회버튼 클릭 후 그리드영역 학생리스트 가져가기
    public List<ApplyUserVo> getStudentList(int curriculum_no){
    	System.out.println("서치 서비스");
    	List<ApplyUserVo> studentList = completionDao.getStudentList(curriculum_no);
    	
        return studentList;
    }

    //선택된 학생의 취업정보 가져가기
    public List<UserCareerVo> getUserCareerList(int user_no){

        return completionDao.getUserCareerList(user_no);
    }

    public UserCareerVo getUserCareer(int user_no,int userCareer_no) {

        Map<String,Integer> noMap = new HashMap<String,Integer>();
        noMap.put("userCareer_no", userCareer_no);
        noMap.put("user_no", user_no);

        return completionDao.getUserCareer(noMap);
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
