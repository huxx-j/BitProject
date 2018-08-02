package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitacademy.service.CompletionService;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping("/completion")
public class CompletionController {

	@Autowired
	CompletionService completionService;

	@RequestMapping("/")
	public String StudentMain(Model model) {

		System.out.println("수료생관리로 가요");
		List<CurriculumVo> curriList = completionService.getWorkType();
		model.addAttribute("curriList",curriList);

		return"graduate/completionmanagement";
	}//맨처음 업무구분 가져와 수료생관리 메인으로 넘어가기

}
