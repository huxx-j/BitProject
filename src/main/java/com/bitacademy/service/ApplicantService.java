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

	public List<CurriculumVo> getFristWorkType(){


		return applicantDao.getFristWorkType();
	}

	public List<CurriculumVo> getCurriList(String workType){


		return applicantDao.getCurriList(workType);
	}

	public List<ApplyUserVo> search(int selectValue){

		return applicantDao.search(selectValue);
	}

	public List<ApplyUserVo> getAppliedList(int user_no){

		return applicantDao.getAppliedList(user_no);
	}

	public ApplyUserVo apply_details(int curriculum_no,int user_no) {

		Map<String,Integer> noMap = new HashMap<String,Integer>();
		noMap.put("curriculum_no", curriculum_no);
		noMap.put("user_no", user_no);

		return applicantDao.apply_details(noMap);
	}

	public void applyUpdate(ApplyUserVo applyVo) {

		String cardPayDay = applyVo.getCardPayDay();
		String depositPayDay = applyVo.getDepositDay();
		int year = Integer.parseInt(cardPayDay.substring(0,4));
		int month = Integer.parseInt(cardPayDay.substring(5, 7));
		int day = Integer.parseInt(cardPayDay.substring(8,10));
		applyVo.setCardPayDay(year+"/"+month+"/"+day);

		System.out.println(year+"/"+month+"/"+day);
		year = Integer.parseInt(depositPayDay.substring(0,4));
		month = Integer.parseInt(depositPayDay.substring(5,7));
		day = Integer.parseInt(depositPayDay.substring(8,10));
		applyVo.setDepositDay(year+"/"+month+"/"+day);

		applicantDao.applyUpdate(applyVo);
	}
}
