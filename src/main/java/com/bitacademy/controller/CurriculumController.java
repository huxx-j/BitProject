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
import com.bitacademy.service.PackageService;
import com.bitacademy.vo.ApplicantVo;
import com.bitacademy.vo.CurriAllVo;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping(value = "/curri")
public class CurriculumController {

	@Autowired
	private CurriculumService curriService;
//	private PackageService packageService;

	// 교육과정관리 메인(카테고리 탭 포함)
	@RequestMapping(value = "")
	public String curriMain(Model model) {
		model.addAttribute("list", curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		System.out.println("curriMain");
		return "screening/mainCurri";
	}

	// 교육과정 추가 버튼
	@RequestMapping(value = "/addCurriForm")
	public String addCurriForm(Model model) {
		System.out.println("form");
		model.addAttribute("list", curriService.currilist());
		model.addAttribute("cateList", curriService.curriCateList());
		
		return "screening/addCurri";
	}

	// curriculum_no값으로 교육과정 조회
	@ResponseBody
	@RequestMapping(value = "/{curriculum_no}")
	public CurriAllVo viewCurriculum(@PathVariable String curriculum_no) {
		CurriculumVo curriculumVo = curriService.viewCurriculum(curriculum_no);
		List<ApplicantVo> applicantList = curriService.viewApplicantList(curriculum_no);

		CurriAllVo curriAllVo = new CurriAllVo(curriculumVo, applicantList);
		// System.out.println(curriAllVo.toString());
		return curriAllVo;
	}

	// CurriInfo 페이지에서 패키지보기 모달창
	@ResponseBody
	@RequestMapping(value = "/viewPackageAjax")
	public CurriculumVo viewPackageAjax(@RequestParam("package_no") String package_no, Model model) {
		CurriculumVo packageVo = curriService.viewPackageAjax(package_no);
//		model.addAttribute("packageCateList", packageService.getcatelist());
//		model.addAttribute("packageList", packageService.getpacklist());
		return packageVo;
	}

	// 커리큘럼 추가
	@ResponseBody
	@RequestMapping(value = "/addCurri")
	public int addCurri(@ModelAttribute CurriculumVo curriVo) {
		System.out.println("curriVo=" + curriVo.toString());
		int result = curriService.addCurri(curriVo);
		return result;
	}

	// 커리큘럼 추가 페이지 패키지보기 모달창

	// 교육과정 수정
	@ResponseBody
	@RequestMapping(value = "/edit")
	public int edit(@ModelAttribute CurriculumVo curriVo) {
		System.out.println("[curriController] edit IN");
		System.out.println(curriVo.toString());
		int result = curriService.edit(curriVo);
		return result;
	}

	// 기수부여
	@ResponseBody
	@RequestMapping(value = "/gisuGrant")
	public String gisuGrant(@RequestParam(value = "valueArrTest[]") List<String> valueArr) {

		return "screening/mainCurri";
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
