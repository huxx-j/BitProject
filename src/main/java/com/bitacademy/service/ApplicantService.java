package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.ApplicantDao;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.PagerRequestVo;
import com.bitacademy.vo.PagerResponseVo;

@Service
public class ApplicantService {

	@Autowired
	ApplicantDao applicantDao;

	//맨윗줄 업무구분 가져가기
	public List<CurriculumCateVo> getCurriCateList(){

		return applicantDao.getCurriCateList();
	}

	//맨윗줄 업무구분 및 radio조건반영된 수업이름 가져가기
		public List<CurriculumVo> getCurriList_state(String curriculumCate_no,int curriState){

			Map<String,Object> noMap = new HashMap<String,Object>();
			noMap.put("curriculumCate_no", curriculumCate_no);
			noMap.put("curriState", curriState);
			
			return applicantDao.getCurriList_state(noMap);
		}
	
	//맨윗줄 업무구분관련된 수업이름 가져가기
	public List<CurriculumVo> getCurriList(String curriculumCate_no){

		return applicantDao.getCurriList(curriculumCate_no);
	}

	//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기
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
        int records = applicantDao.getRecords(curriculum_no); //데이터의 총 개수를 가져옴
        pagerResponseVo.setPage(page); //리턴할 Vo에 현재페이지 셋팅
        pagerResponseVo.setRecords(records); //리턴할 Vo에 데이터의 총 개수 셋팅
        pagerResponseVo.setRows(applicantDao.getStudentList(pagerRequestVo)); //리턴할 Vo에 데이터를 리스트형태로 셋팅
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
		
		return applicantDao.getStudentList(curriculum_no);
	}*/

	//선택된 사람의 과거 지원내역 가져가기
	public List<ApplyUserVo> getAppliedList(int user_no){

		return applicantDao.getAppliedList(user_no);
	}

	//선택된 과거 지원내역의 상세내용
	public ApplyUserVo apply_details(int curriculum_no,int user_no) {

		Map<String,Integer> noMap = new HashMap<String,Integer>();
		noMap.put("curriculum_no", curriculum_no);
		noMap.put("user_no", user_no);

		return applicantDao.apply_details(noMap);
	}

	//수정버튼 클릭 후 지원내역 수정
	public int applyUpdate(ApplyUserVo applyVo) {

		System.out.println("업데이트 서비스");
		/*String cardPayDate = applyVo.getCardPayDate();
		String depositDate = applyVo.getDepositDate();
		System.out.println(cardPayDate);
		int year = Integer.parseInt(cardPayDate.substring(0,4));
		System.out.println(year);
		int month = Integer.parseInt(cardPayDate.substring(5, 7));
		System.out.println(month);
		int day = Integer.parseInt(cardPayDate.substring(8,10));
		System.out.println(day);
		applyVo.setCardPayDate(year+"/"+month+"/"+day);

		System.out.println(year+"/"+month+"/"+day);
		
		year = Integer.parseInt(depositDate.substring(0,4));
		System.out.println(year);
		month = Integer.parseInt(depositDate.substring(5,7));
		System.out.println(month);
		day = Integer.parseInt(depositDate.substring(8,10));
		System.out.println(day);
		applyVo.setDepositDate(year+"/"+month+"/"+day);*/
		applicantDao.applyUpdate_applyInfo(applyVo);
		return applicantDao.applyUpdate_users(applyVo);

	}

	
}
