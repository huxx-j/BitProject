package com.bitacademy.service;

import java.util.List;

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
	
	public List<ApplyUserVo> search(CurriculumVo curriVo){
		
		System.out.println("서비스");
		return applicantDao.search(curriVo);
	}
}
