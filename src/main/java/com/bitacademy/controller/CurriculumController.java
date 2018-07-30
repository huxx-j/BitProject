package com.bitacademy.controller;


import com.bitacademy.service.CurriculumService;
import com.bitacademy.vo.CurriculumVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value = "/curri")
public class CurriculumController {

	@Autowired
	private CurriculumService curriService;
	//교육과정관리 메인
	 @RequestMapping(value = "")
	 public String curriMain(Model model) {
		System.out.println(curriService.currilist());
		model.addAttribute("list",curriService.currilist());
		
		model.addAttribute("cateList", curriService.curriCateList());
		System.out.println(curriService.curriCateList());
		System.out.println("curriMain");
	
		return "screening/mainCurri";
	 }

	 // 교육과정 추가 버튼
	@RequestMapping(value = "/addCurriBtn")
	public String addCurriBtn(Model model) {
		model.addAttribute("list",curriService.currilist());
		
		model.addAttribute("cateList", curriService.curriCateList());
		return "screening/addCurri";
	}
	// 교육과정 추가
	@RequestMapping(value = "/addCurri")
	public String addCurri(@ModelAttribute CurriculumVo curriVo) {
		System.out.println("[curriController]addCurri IN"+curriVo.toString());
		curriService.addCurri(curriVo);
		
		return "redirect:/curri";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{curriculum_no}")
	public CurriculumVo viewCurriculum(@PathVariable String curriculum_no) {
		System.out.println("[curriController] IN");
		System.out.println("curriculum_no: " + curriculum_no);
		
		CurriculumVo curriVo = curriService.viewCurriculum(curriculum_no);
		System.out.println("curri toString" + curriVo);
		return curriVo;
	}
	
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
	@RequestMapping(value = "/edit/{curriculum_no}")
	public String edit(@ModelAttribute CurriculumVo curriVo) {
		System.out.println("[curriController] edit IN");
		curriService.edit(curriVo);
		return "redirect:/curri/{curriculum_no}";

	}
	
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
	
	
}
