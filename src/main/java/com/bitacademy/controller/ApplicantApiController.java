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
	public List<CurriculumVo> getcurri(@RequestParam("cateName") String cateName) {
		/*System.out.println("ajax-list :" + workType);*/
		List<CurriculumVo> list = applicantService.getCurriList(cateName);
		/*System.out.println(list.toString());*/
		return list;
	}//맨윗줄 업무구분관련된 수업이름 가져가기
	
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public List<ApplyUserVo> search(@RequestParam int selectValue ) {
		
		/*System.out.println("dkdjfk321321");
		System.out.println(selectValue);*/
		
		List<ApplyUserVo> applyUserlist = applicantService.search(selectValue);
		
		/*System.out.println(applyUserlist.toString());*/
		return applyUserlist ;
	}//조회하기 버튼 후 그리드영역 지원자 리스트 가져오기
	
	@ResponseBody
	@RequestMapping(value="/getAppliedList",method=RequestMethod.GET)
	public List<ApplyUserVo> getAppliedList(@RequestParam int user_no){
		
		/*System.out.println(user_no);*/
		List<ApplyUserVo> appliedList = applicantService.getAppliedList(user_no);
		/*System.out.println(appliedList.toString());*/
		
		return appliedList;
	}//선택된 사람의 과거 지원내역 가져가기
	
	@ResponseBody
	@RequestMapping(value="/apply_details", method=RequestMethod.GET)
	public ApplyUserVo apply_details(@RequestParam int curriculum_no,@RequestParam int user_no) {
		
		System.out.println("지원커리 상세내용");
		System.out.println(curriculum_no+","+user_no);
		ApplyUserVo applyVo = applicantService.apply_details(curriculum_no,user_no);
		/*System.out.println(applyVo.toString());*/
		
		return applyVo;
	}//선택된 과거 지원내역의 상세내용
	
	@ResponseBody
	@RequestMapping(value="/applyUpdate", method=RequestMethod.POST)
	public int applyUpdate(@RequestBody ApplyUserVo applyVo) {
		
		System.out.println("수정하러 컨트롤러");
		System.out.println(applyVo);
		int result = applicantService.applyUpdate(applyVo);

		return result;
	}//수정버튼 클릭 후 지원내역 수정
	
}

