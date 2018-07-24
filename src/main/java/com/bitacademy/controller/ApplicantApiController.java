package com.bitacademy.controller;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value="/api/apply")
public class ApplicantApiController {

	@Autowired
    ApplicantService applicantService;
	
	@ResponseBody
	@RequestMapping(value="/getcurri", method=RequestMethod.GET)
	public List<CurriculumVo> getcurri(@RequestParam("workType") String workType) {
		System.out.println("ajax-list :" + workType);
		List<CurriculumVo> list = applicantService.getCurriList(workType);
		System.out.println(list.toString());
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public List<ApplyUserVo> search(@RequestParam int selectValue ) {
		
		System.out.println("dkdjfk321321");
		System.out.println(selectValue);
		
		List<ApplyUserVo> applyUserlist = applicantService.search(selectValue);
		
		System.out.println(applyUserlist.toString());
		
		return applyUserlist ;
	}
	
	@ResponseBody
	@RequestMapping(value="/getAppliedList",method=RequestMethod.GET)
	public List<ApplyUserVo> getAppliedList(@RequestParam int user_no){
		
		System.out.println(user_no);
		List<ApplyUserVo> appliedList = applicantService.getAppliedList(user_no);
		System.out.println(appliedList.toString());
		
		return appliedList;
	}
	
	@ResponseBody
	@RequestMapping(value="/apply_details", method=RequestMethod.GET)
	public ApplyUserVo apply_details(@RequestParam int curriculum_no,@RequestParam int user_no) {
		
		System.out.println("지원커리 상세내용");
		System.out.println(curriculum_no+","+user_no);
		ApplyUserVo applyVo = applicantService.apply_details(curriculum_no,user_no);
		System.out.println(applyVo.toString());
		
		return applyVo;
	}
	
	@ResponseBody
	@RequestMapping(value="/applyUpdate", method=RequestMethod.POST)
	public void applyUpdate(@RequestBody ApplyUserVo applyVo) {
		
		System.out.println("수정하러 컨트롤러");
		System.out.println(applyVo);
		applicantService.applyUpdate(applyVo);

	}
	
}

