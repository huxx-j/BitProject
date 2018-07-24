package com.bitacademy.service;

import com.bitacademy.dao.CurriculumDao;
import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CurriculumService {
	
	@Autowired
	private CurriculumDao curriDao;
	
	
	public CurriculumVo viewCurriculum(String curriculum_no){
 		
 		System.out.println("[CurriService] viewCurriculum");
 		
		return curriDao.viewCurriculum(curriculum_no);
 	}
	
	public int edit(CurriculumVo curriVo) {
		System.out.println("[CurriService] edit IN");
		return curriDao.edit(curriVo);
	}
	

	public int addCurri(CurriculumVo curriVo) {
		
		return curriDao.addCurri(curriVo);
	}
	public List<CurriculumVo> currilist(){
		return curriDao.currilist();
	}
	public List<CurriculumCateVo> curriCateList(){
		
		return curriDao.curriCateList();
	}
	public List<ApplicantVo> studentManagement(String curriculum_no){
		
		System.out.println("[CurriService] studentManagement IN");
		return curriDao.studentManagement(curriculum_no);
	}
	
//	
	
	//리스트로 받을 때
//	public List<CurriculumVo> viewCurriculumInfo(int curriculum_no){
//		
//		System.out.println("[CurriService] viewCurriculum");
//		
//		return curriDao.viewCurriculumInfo(curriculum_no);
//	}
//	public List<CurriculumVo> viewCurriculum(){
//		
//		System.out.println("[CurriService] viewCurriculum");
//		
//		return curriDao.viewCurriculum();
//	}
}
