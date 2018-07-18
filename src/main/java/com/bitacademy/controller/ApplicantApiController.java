package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;

@Controller
@RequestMapping(value="/api/apply")
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
	public List<ApplyUserVo> search(@RequestParam int selectValue ) {
		
		System.out.println("dkdjfk321321");
		System.out.println(selectValue);
		
		List<ApplyUserVo> applyUserlist = applicantService.search(selectValue);
		
		System.out.println(applyUserlist.toString());
		
		return applyUserlist ;
	}
	
}
