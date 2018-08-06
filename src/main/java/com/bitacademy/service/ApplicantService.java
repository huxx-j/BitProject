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

@Service
public class ApplicantService {

	@Autowired
	ApplicantDao applicantDao;

	//맨윗줄 업무구분 가져가기
	public List<CurriculumCateVo> getCurriCateList(){

		return applicantDao.getCurriCateList();
	}

	//맨윗줄 업무구분관련된 수업이름 가져가기
	public List<CurriculumVo> getCurriList(String curriculumCate_no){

		return applicantDao.getCurriList(curriculumCate_no);
	}

	//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기
	public List<ApplyUserVo> search(int selectValue){

		return applicantDao.search(selectValue);
	}

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
		String cardPayDate = applyVo.getCardPayDate();
		String depositDate = applyVo.getDepositDate();
		int year = Integer.parseInt(cardPayDate.substring(0,4));
		int month = Integer.parseInt(cardPayDate.substring(5, 7));
		int day = Integer.parseInt(cardPayDate.substring(8,10));
		applyVo.setCardPayDate(year+"/"+month+"/"+day);

		System.out.println(year+"/"+month+"/"+day);
		
		year = Integer.parseInt(depositDate.substring(0,4));
		month = Integer.parseInt(depositDate.substring(5,7));
		day = Integer.parseInt(depositDate.substring(8,10));
		applyVo.setDepositDate(year+"/"+month+"/"+day);

		return applicantDao.applyUpdate(applyVo);


	}
}
