package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping("/applicant")
public class ApplicantController {
	
	@Autowired
	ApplicantService applicantService;

	@RequestMapping("/")
	public String applicantMain(Model model) {
		
		System.out.println("지원자관리 들어가요");
		List<CurriculumVo> curriList = applicantService.getCurriList();
		System.out.println("나왔");
		model.addAttribute("curriList",curriList);
		
		return "screening/applicantmanagement";
	}
	
/*	@RequestMapping("/serch")
	public String serch(@ModelAttribute CurriculumVo curriVo) {
		
		applicantService.serch(curriVo);
		
		return "";
	}*/
}
