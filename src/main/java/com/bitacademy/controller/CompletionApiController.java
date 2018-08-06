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
	
	
	//선택된 업무구분과 관련된 수업이름 가져가기
	@ResponseBody
	@RequestMapping(value="/getCurriList", method=RequestMethod.POST)
	public List<CurriculumVo> getCurriList(@RequestParam("curriculumCate_no") int curriculumCate_no) {
		System.out.println("ajax-list :" + curriculumCate_no);
		List<CurriculumVo> curriList = completionService.getCurriList(curriculumCate_no);
		System.out.println(curriList.toString());
		return curriList;
	}
	
	//조회버튼 클릭 후 그리드영역 학생(수료생)리스트 가져가기
	@ResponseBody
	@RequestMapping(value="/getStudentList",method=RequestMethod.GET)
	public List<ApplyUserVo> getStudentList(@RequestParam int curriculum_no ) {
		
		System.out.println(curriculum_no);
		
		List<ApplyUserVo> studentList = completionService.getStudentList(curriculum_no);
		
		/*System.out.println(applyUserlist.toString());*/
		return studentList ;
	}
	
	//선택된 학생의 취업정보 가져가기
	@ResponseBody
	@RequestMapping(value="/getUserCareerList",method=RequestMethod.GET)
	public List<UserCareerVo> getUserCareerList(@RequestParam int user_no){
		
		System.out.println(user_no);
		List<UserCareerVo> userCareerList = completionService.getUserCareerList(user_no);
		System.out.println(userCareerList.toString());
		
		return userCareerList;
	}
	
	@ResponseBody
	@RequestMapping(value="/getUserCareer", method=RequestMethod.POST)
	public UserCareerVo getUserCareer(@RequestParam int user_no,@RequestParam int userCareer_no) {
		
		System.out.println("지원커리 상세내용");
		System.out.println(user_no);
		System.out.println(userCareer_no);
		UserCareerVo userCareerVo = completionService.getUserCareer(user_no,userCareer_no);
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
