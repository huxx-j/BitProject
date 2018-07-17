package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping(value="/api/cm")

public class ApplicantApiController {

	@Autowired
	ApplicantService applicantService;
	
	@ResponseBody
	@RequestMapping(value="/getcurri",method=RequestMethod.POST)
	public List<CurriculumVo> getcurri(@RequestParam("workType")String workType) {
		System.out.println("ajax-list : workType");
		List<CurriculumVo> list = applicantService.getCurriList(workType);
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public String search(@ModelAttribute CurriculumVo curriVo,@RequestParam("strcurriName") String strcurriculum_no,Model model) {
		
		curriVo.setCurriculum_no(Integer.parseInt(strcurriculum_no));
		System.out.println(curriVo.toString());		
		
		List<ApplyUserVo> applyUserlist = applicantService.search(curriVo);
		
		model.addAttribute("applyUserlist",applyUserlist);
		System.out.println(applyUserlist.toString());
		
		return  "redirect:/applicant/";
	}
	
}
