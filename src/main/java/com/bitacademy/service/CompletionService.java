package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.CompletionDao;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.PagerRequestVo;
import com.bitacademy.vo.PagerResponseVo;
import com.bitacademy.vo.UserCareerVo;

@Service
public class CompletionService {

    @Autowired CompletionDao completionDao;

    //업무구분(커리큘럼카테고리) 리스트가져오기	
    public List<CurriculumCateVo> getCurriCateList(){

        return completionDao.getCurriCateList();
    }
    
    //맨윗줄 업무구분 및 radio조건반영된 수업이름 가져가기
	public List<CurriculumVo> getCurriList_state(String curriculumCate_no,int curriState){

		Map<String,Object> noMap = new HashMap<String,Object>();
		noMap.put("curriculumCate_no", curriculumCate_no);
		noMap.put("curriState", curriState);
		
		return completionDao.getCurriList_state(noMap);
	}
    
    //선택된 업무구분과 관련된 수업이름 가져가기
    public List<CurriculumVo> getCurriList(int curriculumCate_no){

        return completionDao.getCurriList(curriculumCate_no);
    }
    
    //조회버튼 클릭 후 그리드영역 학생리스트 가져가기
    public PagerResponseVo getStudentList(int curriculum_no, int page, int rows, String sidx, String sord) {
		PagerResponseVo pagerResponseVo = new PagerResponseVo(); //리턴할 데이터를 담을 Vo
        int startNum = rows * (page - 1); //페이지 첫글의 번호
        System.out.println("sidx1 > " + sidx);
        if(sidx.equals("")) {
        	sidx="sidx0";
        }
        System.out.println("sidx2 > " + sidx);
        PagerRequestVo pagerRequestVo = new PagerRequestVo(page, rows, sidx, sord, startNum, curriculum_no); //쿼리를 돌리기 위한 Vo선언 및 데이터 셋팅
        System.out.println(pagerRequestVo.toString());
        /*Map<String, Object> map = new HashMap<>();
        map.put("curriculum_no", curriculum_no);
        map.put("pagerRequestVo", pagerRequestVo);*/
        int records = completionDao.getRecords(curriculum_no); //데이터의 총 개수를 가져옴
        pagerResponseVo.setPage(page); //리턴할 Vo에 현재페이지 셋팅
        pagerResponseVo.setRecords(records); //리턴할 Vo에 데이터의 총 개수 셋팅
        pagerResponseVo.setRows(completionDao.getStudentList(pagerRequestVo)); //리턴할 Vo에 데이터를 리스트형태로 셋팅
        int total; //페이지수 변수 선언
        if (records % rows != 0) { //페이지수 계산
            total = (records / rows) + 1; //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이 아닐때 int형의 결과에 1을 더해줌
        } else {
            total = (records / rows); //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이면 int형의 결과를 그대로 씀
        }
        pagerResponseVo.setTotal(total); //페이지수 셋팅
        return pagerResponseVo; //페이징을 사용하기 위해선 page, records, rows, total 4개의 데이터를 반드시 셋팅하고 리턴해야함

	}
    
    /*public List<ApplyUserVo> getStudentList(int curriculum_no){
    	System.out.println("서치 서비스");
    	List<ApplyUserVo> studentList = completionDao.getStudentList(curriculum_no);
    	
        return studentList;
    }*/

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
