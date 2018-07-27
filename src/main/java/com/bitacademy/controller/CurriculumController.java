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

    @RequestMapping(value = "")
    public String curriMain(Model model) {
        System.out.println(curriService.currilist());
        model.addAttribute("list", curriService.currilist());

        model.addAttribute("cateList", curriService.curriCateList());
        System.out.println(curriService.curriCateList());
        System.out.println("curriMain");

        return "screening/index_curri";
    }

    // 교육과정 추가 버튼
    @RequestMapping(value = "/addCurriBtn")
    public String addCurriBtn() {

        return "screening/addCurri";
    }

    @RequestMapping(value = "/addCurri")
    public String addCurri(@ModelAttribute CurriculumVo curriVo) {
        System.out.println("[curriController]addCurri IN" + curriVo.toString());
        curriService.addCurri(curriVo);

        return "redirect:/curri";
    }

    // 패키지 보기 버튼
    @RequestMapping(value = "/curriPopUp")
    public String popUp() {

        return "screening/curriPopUp";

    }

    @ResponseBody
    @RequestMapping(value = "/{curriculum_no}")
    public CurriculumVo viewCurriculum(@PathVariable String curriculum_no, Model model) {
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

    /////////////////////////////////////////////////
    //					 수정 버튼  			   //
    /////////////////////////////////////////////////
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

        return "screening/index_curri";
    }
//	@RequestMapping("/{curriculum_no}")
//	public String studentManagement(Model model, @PathVariable String curriculum_no) {
//		System.out.println("curriController] studentManagement IN");
//		List<ApplicantVo> applicantList = curriService.studentManagement(curriculum_no);
//		model.addAttribute("applicantList", applicantList);
//		System.out.println("[curriController] studentManagement OUT" + applicantList.toString());
//		return "screening/index_curri";
//	}
//	@RequestMapping("/student")
//	public String studentManagement(Model model) {
//		System.out.println("curriController] studentManagement IN");
//		List<ApplicantVo> applicantList = curriService.studentManagement();
//		model.addAttribute("applicantList", applicantList);
//		System.out.println("[curriController] studentManagement OUT" + applicantList.toString());
//		return "screening/index_curri";
//	}

//	@RequestMapping(value = "/curriInfo")
//	public String viewCurriculum(Model model) {
//		System.out.println("[curriController] IN");
//		List<CurriculumVo> curriList = curriService.viewCurriculum();
//		model.addAttribute("curriList", curriList);
//		
//		return "screening/index_curri";
//	}
//	
//	@ResponseBody
//	@RequestMapping(value = "/curriInfo")
//	public String viewCurriculumInfo(Model model, @RequestParam("curriculum_no") int curriculum_no) {
//		System.out.println("[curriController] IN");
//		
//		//1안
//		List<CurriculumVo> curriList = curriService.viewCurriculumInfo(curriculum_no);
////		model.addAttribute("curriList", curriList);
//		model.addAttribute("curri", curriList.get(0));
//		
//		//2안
//		
//		
//		
//		return "screening/index_curri";
//	}


//	원래꺼
//	@RequestMapping(value = "")
//	public String viewCurriculum(Model model) {
//		System.out.println("[curriController] IN");
//		List<CurriculumVo> curriList = curriService.viewCurriculum();
//		model.addAttribute("curriList", curriList);
//		System.out.println("curriList toString" + curriList.toString());
//		//////////////////student management//////////////////////////////////////
//		List<ApplicantVo> applicantList = curriService.studentManagement();
//		model.addAttribute("applicantList", applicantList);
//		System.out.println(applicantList.toString());
//		
//		return "screening/index_curri";
//	}
//	
//	
}
