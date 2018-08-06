package com.bitacademy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.CurriculumService;
import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriAllVo;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping(value = "/curri")
public class CurriculumController {

	@Autowired
	private CurriculumService curriService;
	//교육과정관리 메인(카테고리 탭 포함)
	 @RequestMapping(value = "")
	 public String curriMain(Model model) {
		model.addAttribute("list",curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		System.out.println("curriMain");
		return "screening/mainCurri";
	 }

	 // 교육과정 추가 버튼
	@RequestMapping(value = "/addCurriForm")
	public String addCurriForm(Model model) {
		model.addAttribute("list",curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		return "screening/addCurri";
	}
	// 교육과정 추가
	@RequestMapping(value = "/addCurri")
	public String addCurri(@ModelAttribute CurriculumVo curriVo) {
//		System.out.println("[curriController]addCurri IN"+curriVo.toString());
		curriService.addCurri(curriVo);
		
		return "redirect:/curri";
	}
	
	//curriculum_no값으로 교육과정 조회
	@ResponseBody
	@RequestMapping(value = "/{curriculum_no}")
	public CurriAllVo viewCurriculum(@PathVariable String curriculum_no) {
		CurriculumVo curriculumVo = curriService.viewCurriculum(curriculum_no);
		List<ApplicantVo> applicantList = curriService.viewApplicantList(curriculum_no);
		
		
		CurriAllVo curriAllVo = new CurriAllVo(curriculumVo, applicantList);
//		System.out.println(curriAllVo.toString());
		return curriAllVo;
	}
	
	//CurriInfo 페이지에서 패키지보기 모달창
	@ResponseBody
	@RequestMapping(value = "/viewPackageAjax")
	public CurriculumVo viewPackageAjax(@RequestParam ("package_no") String package_no) {
		
		CurriculumVo packageVo = curriService.viewPackageAjax(package_no);
		
		return packageVo;
	}
//	//지원자관리탭 (curriculum_no값으로 지원자 조회)
//	@ResponseBody
//	@RequestMapping(value = "viewApplicantList/{curriculum_no}")
//	public List<ApplicantVo> viewApplicantList(@PathVariable int curriculum_no) {
//		System.out.println("[curriController] IN");
//		System.out.println("curriculum_no: " + curriculum_no);
//		
//		System.out.println("지원자목록" + applicantVo);
//		return applicantVo;
//	}
	
//	@RequestMapping(value = "/{curriculum_no}")
//	public String viewCurriculum(@PathVariable String curriculum_no, Model model) {
//		System.out.println("[curriController] IN");
//		System.out.println("curriculum_no" + curriculum_no);
//		CurriculumVo curriVo = curriService.viewCurriculum(curriculum_no);
//		model.addAttribute("curri", curriVo);
//		System.out.println("curri toString" + curriVo);
//		
//		
//		System.out.println("curriController] studentManagement IN");
//		List<ApplicantVo> applicantList = curriService.studentManagement(curriculum_no);
//		model.addAttribute("applicantList", applicantList);
//		System.out.println("[curriController] studentManagement OUT" + applicantList.toString());
//		return "screening/index_curri";
//	}
	
	//교육과정 수정
	@ResponseBody
	@RequestMapping(value = "/edit")
	public int edit(@ModelAttribute CurriculumVo curriVo) {
		System.out.println("[curriController] edit IN");
		System.out.println(curriVo.toString());
		int result = curriService.edit(curriVo);
		return result;

	}
//	//교육과정 수정
//	@ResponseBody
//	@RequestMapping(value = "/edit/{curriculum_no}")
//	public CurriculumVo edit(@ModelAttribute CurriculumVo curriVo) {
//		System.out.println("[curriController] edit IN");
//		curriService.edit(curriVo);
//		return curriVo;
//
//	}

	//기수부여
	@ResponseBody
	@RequestMapping(value = "/gisuGrant")
	public String gisuGrant(@RequestParam(value = "valueArrTest[]") List<String> valueArr) {
		
		return "screening/mainCurri";
	}
//	@RequestMapping("/student")
//	public String studentManagement(Model model) {
//		System.out.println("curriController] studentManagement IN");
//		List<ApplicantVo> applicantList = curriService.studentManagement();
//		model.addAttribute("applicantList", applicantList);
//		System.out.println("[curriController] studentManagement OUT" + applicantList.toString());
//		return "screening/index_curri";
//	}
	
	@RequestMapping(value = "p")
	public String p() {
		return "ex/packmain";
	}
	@RequestMapping(value = "s")
	public String s() {
		return "ex/subject";
	}
}
