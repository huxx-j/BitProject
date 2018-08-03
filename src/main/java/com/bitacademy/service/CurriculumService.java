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
//		System.out.println("수정 서비스 와따");
//		return curriDao.edit(curriVo);
		//두 테이블 update할 떄,
		//1. DAO 두개 성공해야 반영되도록 트랜젝션 해줘야함
		//2. or if문 써서 둘 다 성공해야 1넘기도록 설정

		int editCurriResult = curriDao.editCurri(curriVo);
		int editCurriCateResult = curriDao.editCurriCate(curriVo);
		int editPackageResult = curriDao.editPackage(curriVo);

		if (editCurriResult == 1 && editCurriCateResult == 1 && editPackageResult ==1) {
			int result = 1;
			return result;
		}else {
			int result = 0;
			return result;
		}
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
//		System.out.println("viewApplicantList" + curriculum_no);
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
