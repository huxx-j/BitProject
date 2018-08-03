package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.ApplicantDao;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;

@Service
public class ApplicantService {

	@Autowired
	ApplicantDao applicantDao;

	public List<CurriculumVo> getWorkType(){

		return applicantDao.getWorkType();
	}//맨윗줄 업무구분 가져가기

	public List<CurriculumVo> getCurriList(String cateName){

		return applicantDao.getCurriList(cateName);
	}//맨윗줄 업무구분관련된 수업이름 가져가기

	public List<ApplyUserVo> search(int selectValue){

		return applicantDao.search(selectValue);
	}//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기

	public List<ApplyUserVo> getAppliedList(int user_no){

		return applicantDao.getAppliedList(user_no);
	}//선택된 사람의 과거 지원내역 가져가기

	public ApplyUserVo apply_details(int curriculum_no,int user_no) {

		Map<String,Integer> noMap = new HashMap<String,Integer>();
		noMap.put("curriculum_no", curriculum_no);
		noMap.put("user_no", user_no);

		return applicantDao.apply_details(noMap);
	}//선택된 과거 지원내역의 상세내용

	public int applyUpdate(ApplyUserVo applyVo) {

		String cardPayDay = applyVo.getCardPayDate();
		String depositPayDay = applyVo.getDepositDate();
		int year = Integer.parseInt(cardPayDay.substring(0,4));
		int month = Integer.parseInt(cardPayDay.substring(5, 7));
		int day = Integer.parseInt(cardPayDay.substring(8,10));
		applyVo.setCardPayDate(year+"/"+month+"/"+day);

		/*System.out.println(year+"/"+month+"/"+day);*/
		year = Integer.parseInt(depositPayDay.substring(0,4));
		month = Integer.parseInt(depositPayDay.substring(5,7));
		day = Integer.parseInt(depositPayDay.substring(8,10));
		applyVo.setDepositDate(year+"/"+month+"/"+day);

		return applicantDao.applyUpdate(applyVo);


	}//수정버튼 클릭 후 지원내역 수정
}
