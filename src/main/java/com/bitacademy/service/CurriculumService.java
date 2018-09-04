package com.bitacademy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitacademy.dao.CurriculumDao;
import com.bitacademy.dao.PackageDao;
import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.PackageCateVo;
import com.bitacademy.vo.PackageVo;
import com.bitacademy.vo.TestInfoVo;

@Service
public class CurriculumService {

	@Autowired
	private CurriculumDao curriDao;
	@Autowired
	private PackageDao packageDao;

	// 커리큘럼 조회(curriculum_no값으로)
	public CurriculumVo viewCurriculum(String curriculum_no) {
		CurriculumVo curriculumVo = curriDao.viewCurriculum(curriculum_no);
		curriculumVo.setTestInfoList(curriDao.viewTestInfo(curriculum_no));
		return curriculumVo;
	}

	@Transactional
	// 교육과정 수정
	public int edit(CurriculumVo curriVo) {
		// System.out.println("수정 서비스 와따");

		// return curriDao.edit(curriVo);
		// 두 테이블 update할 떄,
		// 1. DAO 두개 성공해야 반영되도록 트랜젝션 해줘야함
		// 2. or if문 써서 둘 다 성공해야 1넘기도록 설정
		curriDao.editCurri(curriVo);
		int listSize = curriVo.getTestInfoList().size();
		List<TestInfoVo> testInfoList = curriVo.getTestInfoList();
		int curriculum_no = curriVo.getCurriculum_no();
		curriDao.deleteTestInfo(curriculum_no);
/*
		int insSuccessCnt = 0;
		for (int j = 0; j <= listSize; j++) {
			TestInfoVo testInfoVo = testInfoList.get(j);
			testInfoVo.setCurriculum_no(curriculum_no);
			int insResult = 0;
			if (testInfoVo.getTestDate() != null && testInfoVo.getTestTime() != null) {
				insResult = curriDao.insertTestInfo(testInfoVo);
			}
			if (insResult > 0) {
				insSuccessCnt += 1;
			}
		}
		*/
		System.out.println("리스트사이즈"+listSize);
		int insResult = 0;
		int insSuccessCnt = 0;
		for (int j = 0; j < listSize; j++) {
			TestInfoVo testInfoVo = testInfoList.get(j);
			testInfoVo.setCurriculum_no(curriculum_no);
			insResult = curriDao.insertTestInfo(testInfoVo); 
			// insert 성공건수 check
			if (insResult > 0) {
				insSuccessCnt = insSuccessCnt + 1;
				// successCnt += 1;
			}
		}
		
		if (insSuccessCnt == listSize) {
			return 1;
		} else {
			return 0;
		}
	}

	// 교육과정 카테고리 추가
	public int addCurriCate(CurriculumCateVo curriCateVo) {
		return curriDao.addCurriCate(curriCateVo);
	}

	// 교육과정 카테고리 수정
	public int updateCate(CurriculumCateVo curriCateVo) {
		return curriDao.updateCate(curriCateVo);
	}

	// 교육과정 카테고리 삭제
	public int deleteCate(int curriculumCate_no) {
		return curriDao.deleteCate(curriculumCate_no);
	}

	// 트랜잭션
	@Transactional
	// 교육과정 추가
	public int addCurri(CurriculumVo curriVo) {
		// 커리큘럼 정보 insert 후 전형일 추가하기 위해 curriculum_no값 받아오기(selectKey)
		int curriculum_no = curriDao.addCurri(curriVo);
		int listSize = curriVo.getTestInfoList().size();
		int successCnt = 0;
		
		/////////////////////////////초기 ver/////////////////////////
		// 전형일 list 사이즈만큼 curriculum_no값 set한 후 전형일 insert
		for (int i = 0; i < listSize; i++) {
			TestInfoVo testInfoVo = curriVo.getTestInfoList().get(i);
			testInfoVo.setCurriculum_no(curriculum_no);
			int result = curriDao.addCurriTest(testInfoVo);
			// insert 성공건수 check
			if (result > 0) {
				successCnt = successCnt + 1;
				// successCnt += 1;
			}
		}
		
		////////////////////////////////////////////////////////////
		/*
		/////////////////////////null값 처리 수정 ver////////////////////
		for (int i = 0; i < listSize; i++) {
			TestInfoVo testInfoVo = curriVo.getTestInfoList().get(i);
			testInfoVo.setCurriculum_no(curriculum_no);
			 
			if(testInfoVo.getTestDate() == "" || testInfoVo.getTestTime() == "--:--") {
				testInfoVo.setTestDate(null);
				testInfoVo.setTestTime(null);
			}
			System.out.println("null값 처리이후" + testInfoVo.toString());
			int result = curriDao.addCurriTest(testInfoVo);
			// insert 성공건수 check
			if (result > 0) {
				successCnt = successCnt + 1;
				// successCnt += 1;
			}
		}
		/////////////////////////////////////////////////////////////
		*/
//		int result = 0;
//		
//		for (int i = 0; i < listSize; i++) {
//			TestInfoVo testInfoVo = curriVo.getTestInfoList().get(i);
//			testInfoVo.setCurriculum_no(curriculum_no);
//			if(testInfoVo.getTestDate() != "" && testInfoVo.getTestTime() != "") {
//				result = curriDao.addCurriTest(testInfoVo);
//			}
//			
//			// insert 성공건수 check
//			if (result > 0) {
//				successCnt = successCnt + 1;
//				// successCnt += 1;
//			}
//			System.out.println("testInfoVo"+testInfoVo.toString());
//		}
//		System.out.println("ADDCURRI"+result);
//		
//		
		
		
//		for(int j = 0; j < listSize; j++) {
//			curriVo.getTestInfoList().remove(null);
//			TestInfoVo testInfoVo = curriVo.getTestInfoList().get(j);
//			System.out.println("testInfoVo NULL 제거!!"+testInfoVo.toString());
//			if(testInfoVo.getTestDate() != "" && testInfoVo.getTestTime() != "") {
//				listSize = curriVo.getTestInfoList().size();
//				testInfoVo.setCurriculum_no(curriculum_no);
//				result = curriDao.addCurriTest(testInfoVo);
//				
//				if (result > 0) {
//					successCnt = successCnt + 1;
//					// successCnt += 1;
//				}
//				
//			}
//			System.out.println("TESTINFRO.TOSTRING" + testInfoVo.toString());
//		}
//		System.out.println("새로운 LISTSIZE" + listSize);
//		System.out.println("RESULT" + result);
//		///////////////////////20180829 수정필요
//		// insert 성공건수가 list사이즈와 같으면 성공!
//		System.out.println("SUCCESS CNT" + successCnt);
		if (successCnt == listSize) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// zTree 카테고리 탭 (목록 불러오기)
	public List<CurriculumVo> currilist() {
		return curriDao.currilist();
	}

	// zTree 카테고리 탭(목록 불러오기)
	public List<CurriculumCateVo> curriCateList() {

		return curriDao.curriCateList();
	}

	// 업무구분 select box ajax
	public List<CurriculumCateVo> getWorkType() {
		return curriDao.getWorkType();
	}

	// 전체지원자리스트 조회
	public List<ApplicantVo> viewApplicantList(String curriculum_no) {
		return curriDao.viewApplicantList(curriculum_no);
	}

	// 수강생리스트 조회
	public List<ApplicantVo> viewStudentList(String curriculum_no) {
		return curriDao.viewStudentList(curriculum_no);
	}

	// 기수부여
	public ApplicantVo gisuGrant(int applicant_no) {

		return curriDao.gisuGrant(applicant_no);
	}

	// 기수제거
	public ApplicantVo gisuRemove(int applicant_no) {
		return curriDao.gisuRemove(applicant_no);
	}

	// 기수부여 저장버튼(Flag = 1)
	public int gisuGrantSave(int applicant_no) {
		return curriDao.gisuGrantSave(applicant_no);
	}

	// 기수부여 저장버튼(Flag = 0)
	public int gisuRemoveSave(int applicant_no) {
		return curriDao.gisuRemoveSave(applicant_no);
	}

	// 패키지 보기 모달창-패키지 리스트 띄우기
	public List<PackageCateVo> packageCateList() {
		return packageDao.selectcatelist();
	}

	// 패키지 보기 모달창-패키지 리스트 띄우기2
	public List<PackageVo> packageList() {
		return packageDao.selectpacklist();
	}

	// 패키지 보기 모달창-패키지 선택 시 패키지명 받아옴
	public CurriculumVo viewPackageAjax(String package_no) {
		return curriDao.viewPackageAjax(package_no);
	}

}
