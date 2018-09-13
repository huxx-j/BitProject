package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.CurriculumCateVo;

@Controller
@RequestMapping(value="/applicant")
public class ApplicantController {

	@Autowired
	ApplicantService applicantService;

	//네비게이션에서 지원자관리 클릭할때
	@RequestMapping(value="/")
	public String applicantMain(Model model) {

		System.out.println("지원자관리 들어가요");
		List<CurriculumCateVo> curriCateList = applicantService.getCurriCateList();
		model.addAttribute("curriCateList",curriCateList);

		
		return "screening/applicantmanagement";
	}


}
