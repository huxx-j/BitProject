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
	
	//커리큘럼 조회(curriculum_no값으로)
	public CurriculumVo viewCurriculum(String curriculum_no){
 		
 		
		return curriDao.viewCurriculum(curriculum_no);
 	}
	//교육과정 수정
	public int edit(CurriculumVo curriVo) {
		return curriDao.edit(curriVo);
	}
	
	//교육과정 추가
	public int addCurri(CurriculumVo curriVo) {
		
		return curriDao.addCurri(curriVo);
	}
	
	//zTree 카테고리 탭 (목록 불러오기)
	public List<CurriculumVo> currilist(){
		return curriDao.currilist();
	}
	//zTree 카테고리 탭(목록 불러오기)
	public List<CurriculumCateVo> curriCateList(){
		
		return curriDao.curriCateList();
	}
	
	public List<ApplicantVo> viewApplicantList(String curriculum_no){
		System.out.println("viewApplicantList" + curriculum_no);
		return curriDao.viewApplicantList(curriculum_no);
	}
//	
//	public List<ApplicantVo> studentManagement(String curriculum_no){
//		
//		System.out.println("[CurriService] studentManagement IN");
//		return curriDao.studentManagement(curriculum_no);
//	}
	
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
