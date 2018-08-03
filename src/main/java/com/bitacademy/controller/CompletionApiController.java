package com.bitacademy.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.CompletionService;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.UserCareerVo;

@Controller
@RequestMapping(value = "/api/completion")

public class CompletionApiController {
	
	@Autowired
    CompletionService completionService;
	
	@ResponseBody
	@RequestMapping(value="/getcurri", method=RequestMethod.GET)
	public List<CurriculumVo> getcurri(@RequestParam("cateName") String cateName) {
		System.out.println("ajax-list :" + cateName);
		List<CurriculumVo> list = completionService.getCurriList(cateName);
		System.out.println(list.toString());
		return list;
	}//선택된 업무구분과 관련된 수업이름 가져가기
	
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public List<ApplyUserVo> search(@RequestParam int selectValue ) {
		
		System.out.println("dkdjfk321321");
		System.out.println(selectValue);
		
		List<ApplyUserVo> applyUserlist = completionService.search(selectValue);
		
		/*System.out.println(applyUserlist.toString());*/
		
		return applyUserlist ;
	}//조회버튼 클릭 후 그리드영역 학생리스트 가져가기
	
	@ResponseBody
	@RequestMapping(value="/afterServiceList",method=RequestMethod.GET)
	public List<UserCareerVo> userCareerList(@RequestParam int user_no){
		
		System.out.println(user_no);
		List<UserCareerVo> userCareerList = completionService.afterServiceList(user_no);
		System.out.println(userCareerList.toString());
		
		return userCareerList;
	}//선택된 학생의 취업정보 가져가기
	
	@ResponseBody
	@RequestMapping(value="/afterService_details", method=RequestMethod.GET)
	public UserCareerVo afterService_details(@RequestParam int user_no,@RequestParam int userCareer_no) {
		
		System.out.println("지원커리 상세내용");
		System.out.println(user_no);
		System.out.println(userCareer_no);
		UserCareerVo userCareerVo = completionService.afterService_details(user_no,userCareer_no);
		System.out.println(userCareerVo.toString());
		
		return userCareerVo;
	}//클릭된 취업내용 상세내역 가져가기

	@ResponseBody
	@RequestMapping(value="/afterServiceUpdate", method=RequestMethod.POST)
	public int afterServiceUpdate(@ModelAttribute UserCareerVo userCareerVo) {

		System.out.println("취업정보 수정");
		System.out.println(userCareerVo);
		return completionService.afterServiceUpdate(userCareerVo);

	}//수정버튼 클릭 후 취업상세내용 업데이트하기

	@ResponseBody
	@RequestMapping(value="/afterServiceAdd", method=RequestMethod.POST)
	public int afterServiceAdd(@ModelAttribute UserCareerVo userCareerVo) {

		System.out.println("취업정보 추가");
		System.out.println(userCareerVo);
		return completionService.afterServiceAdd(userCareerVo);
	}//저장 버튼 클릭 후 취업내용 추가하기

}
