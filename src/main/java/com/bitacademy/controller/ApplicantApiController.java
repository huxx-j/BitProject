package com.bitacademy.controller;

import com.bitacademy.service.ApplicantService;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.PagerResponseVo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping(value="/api/apply")
public class ApplicantApiController {

	@Autowired
    ApplicantService applicantService;
	
	//선택된 업무구분과 관련된 수업이름 가져가기
	@ResponseBody
	@RequestMapping(value="/getCurriList", method=RequestMethod.POST)
	public List<CurriculumVo> getCurriList(@RequestParam("curriculumCate_no") String curriculumCate_no) {
		System.out.println("ajax-list :" + curriculumCate_no);
		List<CurriculumVo> list = applicantService.getCurriList(curriculumCate_no);
		/*System.out.println(list.toString());*/
		return list;
	}
	
	//선택된 업무구분과 radio조건반영된 관련된 수업이름 가져가기
	@ResponseBody
	@RequestMapping(value="/getCurriList_state", method=RequestMethod.POST)
	public List<CurriculumVo> getCurriList_state(@RequestParam("curriculumCate_no") String curriculumCate_no,
												@RequestParam("curriState") int curriState) {
		System.out.println("ajax-list :" + curriculumCate_no+","+curriState);
		List<CurriculumVo> list = applicantService.getCurriList_state(curriculumCate_no,curriState);
		System.out.println(list.toString());
		return list;
	}
	
	//조회버튼 클릭 후 그리드영역 학생(수료생)리스트 가져가기
	@ResponseBody
	@RequestMapping(value = "/getStudentList", method = RequestMethod.GET)
	public PagerResponseVo getStudentList(@RequestParam("curriculum_no") int curriculum_no, @RequestParam("page") int page, @RequestParam("rows") int rows, @RequestParam("sidx") String sidx, @RequestParam("sord") String sord){
		//우리가 설정하지 않아도 jqgrid에서 자동으로 파라미터 4개를 보내줌
		//파라미터 부분은 그대로 쓸것, Vo로 받아보려 시도 했으나 안됨
		System.out.println("page : " + page + ", rows : " + rows + ", sidx : " + sidx + ",sord : " + sord);
		return applicantService.getStudentList(curriculum_no, page, rows, sidx, sord); //service로 보냄
	}
	
	/*@ResponseBody
	@RequestMapping(value="/getStudentList",method=RequestMethod.GET)
	public List<ApplyUserVo> getStudentList(@RequestParam int curriculum_no ) {
		
		System.out.println(curriculum_no);
		
		List<ApplyUserVo> applyUserlist = applicantService.getStudentList(curriculum_no);
		
		System.out.println(applyUserlist.toString());
		return applyUserlist ;
	}
*/	
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

