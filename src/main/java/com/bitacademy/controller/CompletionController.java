package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitacademy.service.CompletionService;
import com.bitacademy.vo.CurriculumCateVo;

@Controller
@RequestMapping("/completion")
public class CompletionController {

	@Autowired
	CompletionService completionService;

	//네비게이션에서 수료생관리 클릭할때 
	@RequestMapping("/")
	public String completionMain(Model model) {

		System.out.println("수료생관리로 가요");
		
		//업무구분(커리큘럼카테고리) 리스트가져오기	
		List<CurriculumCateVo> curriCateList = completionService.getCurriCateList();
		System.out.println(curriCateList.toString());
		model.addAttribute("curriCateList",curriCateList);

		return"graduate/completionmanagement";
	}

	@RequestMapping("/p")
	public String p() {

		return"ex/packmain";
	}

	@RequestMapping("/s")
	public String s() {

		return"ex/subject";
	}

}
