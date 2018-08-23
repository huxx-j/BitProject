package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.CurriculumService;
import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriAllVo;
import com.bitacademy.vo.CurriculumCateVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.TestInfoVo;

@Controller
@RequestMapping(value = "/curri/")
public class CurriculumController {

	@Autowired
	private CurriculumService curriService;

	// 교육과정관리 메인(카테고리 탭 포함)
	@RequestMapping(value = "")
	public String curriMain(Model model) {
		// 교육과정 카테고리
		model.addAttribute("list", curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		// 패키지보기 모달창
		model.addAttribute("packageCateList", curriService.packageCateList());
		model.addAttribute("packageList", curriService.packageList());
		System.out.println("curriMain");
		// 업무구분 selectbox ajax
		model.addAttribute("workType", curriService.getWorkType());
		return "screening/mainCurri";
	}

	// 교육과정 카테고리 추가
	@ResponseBody
	@RequestMapping(value = "/addCurriCate")
	public int addCurriCate(@ModelAttribute CurriculumCateVo curriCateVo) {

		int result = curriService.addCurriCate(curriCateVo);
		return result;
	}

	// 교육과정 카테고리 수정
	@ResponseBody
	@RequestMapping(value = "/updateCate")
	public int updateCate(@RequestParam("curriculumCateVo") CurriculumCateVo curriculumCateVo) {
		int result = curriService.updateCate(curriculumCateVo);
		return result;
	}

	// 교육과정 추가 버튼
	@RequestMapping(value = "/addCurriForm")
	public String addCurriForm(Model model) {
		// 교육과정 카테고리
		model.addAttribute("list", curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		// 패키지 보기 모달
		model.addAttribute("packageCateList", curriService.packageCateList());
		model.addAttribute("packageList", curriService.packageList());
		// 업무구분 selectbox ajax
		model.addAttribute("workType", curriService.getWorkType());

		return "screening/addCurri";
	}

	// curriculum_no값으로 교육과정 조회
	@ResponseBody
	@RequestMapping(value = "/{curriculum_no}")
	public CurriAllVo viewCurriculum(@PathVariable String curriculum_no) {
		CurriculumVo curriculumVo = curriService.viewCurriculum(curriculum_no);
		List<ApplicantVo> applicantList = curriService.viewApplicantList(curriculum_no);
		List<ApplicantVo> studentList = curriService.viewStudentList(curriculum_no);
		CurriAllVo curriAllVo = new CurriAllVo(curriculumVo, applicantList, studentList);
		return curriAllVo;
	}

	// 패키지 보기 모달창-패키지 선택 시 패키지명 받아옴
	@ResponseBody
	@RequestMapping(value = "/viewPackageAjax")
	public CurriculumVo viewPackageAjax(@RequestParam("package_no") String package_no, Model model) {
		CurriculumVo packageVo = curriService.viewPackageAjax(package_no);
		return packageVo;
	}

	// 커리큘럼 추가
	@ResponseBody
	@RequestMapping(value = "/addCurri")
	public int addCurri(@RequestBody CurriculumVo curriVo) {
		int result = curriService.addCurri(curriVo);
		return result;
	}

	// 교육과정 수정
	@ResponseBody
	@RequestMapping(value = "/edit")
	public int edit(@RequestBody CurriculumVo curriVo) {
		System.out.println("EDIT curriVo"+curriVo);
		int result = curriService.edit(curriVo);
		return result;
	}

	// 기수부여
	@ResponseBody
	@RequestMapping(value = "/gisuGrant")
	public ApplicantVo gisuGrant(@RequestParam("applicant_no") int applicant_no) {
		ApplicantVo applicantVo = curriService.gisuGrant(applicant_no);
		return applicantVo;
	}

	// 기수 제거
	@ResponseBody
	@RequestMapping(value = "/gisuRemove")
	public ApplicantVo gisuRemove(@RequestParam("applicant_no") int applicant_no) {
		ApplicantVo applicantVo = curriService.gisuRemove(applicant_no);
		return applicantVo;
	}

	// 기수부여 저장 버튼(Flag = 1)
	@ResponseBody
	@RequestMapping(value = "/gisuGrantSave")
	public int gisuGrantSave(@RequestParam("applicant_no") int applicant_no) {
		int result = curriService.gisuGrantSave(applicant_no);
		return result;
	}

	// 기수부여 저장 버튼(Flag = 0)
	@ResponseBody
	@RequestMapping(value = "/gisuRemoveSave")
	public int gisuRemoveSave(@RequestParam("applicant_no") int applicant_no) {
		System.out.println(applicant_no);
		int result = curriService.gisuRemoveSave(applicant_no);
		return result;
	}

	@RequestMapping(value = "p")
	public String p() {
		return "ex/packmain";
	}

	@RequestMapping(value = "s")
	public String s() {
		return "ex/subject";
	}

}
