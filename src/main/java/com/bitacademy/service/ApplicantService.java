package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.ApplicantDao;
import com.bitacademy.vo.CurriculumVo;

@Service
public class ApplicantService {

	@Autowired
	ApplicantDao applicantDao;
	
	public List<CurriculumVo> getCurriList(){
		
		
		return applicantDao.getCurriList();
	}
	
	/*public List<StudentVo> serch(CurriculumVo curriVo){
		
		return applicantDao.serch(curriVo);
	}*/
}
