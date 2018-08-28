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

import com.bitacademy.service.JobService;
import com.bitacademy.vo.InterViewerVo;
import com.bitacademy.vo.JobCriteriaVo;
import com.bitacademy.vo.JobReqVo;
import com.bitacademy.vo.JobRequestVo;
import com.bitacademy.vo.ResultGridVo;

@Controller
@RequestMapping("/jobrequest")
public class JobController {

	@Autowired
	JobService jobService;

	/* 취업의뢰 메인 */
	@RequestMapping("/")
	public String jobrequestMain() {
		System.out.println("/취업의뢰 메인");
		return "graduate/jobrequest";
	}

	/* 취업의뢰 리스트 가져오기 */
	@ResponseBody
	@RequestMapping(value = "/jobRequestList", method = RequestMethod.POST)
	public ResultGridVo getJobRequestList(@ModelAttribute JobCriteriaVo jobCriteriaVo ) {

		System.out.println(jobCriteriaVo.toString());
		ResultGridVo resultGridVo = jobService.getJobRequestList(jobCriteriaVo);
		/*System.out.println(resultGridVo.toString());*/
		System.out.println(resultGridVo.getRows().size());
		return resultGridVo;
	}


	/* 구인업체 한번클릭했을때 */
	/*면접 지원자 리스트*/
	@ResponseBody
	@RequestMapping(value = "/getInterviewList", method = RequestMethod.POST)
	public List<InterViewerVo> getInterviewList(@RequestParam int request_no) {
		System.out.println(request_no);
		List<InterViewerVo> interViewerList = jobService.getInterviewList(request_no);
		System.out.println(interViewerList.toString());

		return interViewerList;
	}
	
	
	/* 두번클릭했을때 팝업 */
	/*취업의뢰기업 팝업 데이타는 로딩후 ajax로*/
	@RequestMapping("/jobRequestPopup")
	public String popJobRequestDetail(@RequestParam int company_no, Model model) {
		System.out.println("company_no: " + company_no);
		/*취업의뢰 히스토리만 전달*/
		List<JobReqVo> jobReqList = jobService.getJobReqList(company_no);
		model.addAttribute("jobReqList", jobReqList);
		return "graduate/pop_jobRequestDetail";
	}
	

	/*특정기업 취업의뢰 상세*/
	@ResponseBody
	@RequestMapping(value = "/getJobRequest", method = RequestMethod.POST)
	public JobRequestVo getJobRequest(@RequestParam("request_no") int request_no) {
		
		JobRequestVo jobRequestVo = jobService.getJobRequest(request_no);
		System.out.println("jobRequestVo: " + jobRequestVo.toString());
		return jobRequestVo;
	}
	
	
	/*면접지원자 삭제*/
	@ResponseBody
	@RequestMapping(value = "/delInterViewer", method = RequestMethod.POST)
	public int delInterViewer(@RequestParam("interview_no") int interview_no) {
		System.out.println(interview_no);
		/*int result = jobService.delInterViewer(interview_no);*/
		/*System.out.println(result);*/
		return 342;
	}
	
	/*취업의뢰 수정*/
	@RequestMapping(value = "/updateJobRequest", method = RequestMethod.POST)
	public String delInterViewer(@ModelAttribute JobRequestVo jobRequestVo) {
		int request_no = jobRequestVo.getRequest_no();
		int company_no = jobRequestVo.getCompany_no();
		System.out.println("=============================================");
		System.out.println(jobRequestVo.toString());
		jobService.updateJobRequest(jobRequestVo);
		System.out.println("=============================================");
		return "redirect:/jobrequest/jobRequestPopup?request_no="+ request_no + "&company_no=" + company_no; 
	}
	
	
	
	
	
	/*@RequestMapping("/jobRequestDetail")
	public String popJobRequestDetail(@RequestParam("request_no") int request_no, Model model) {
		
		//취업의뢰 상세정보(회사정보+구직정보 + 구직리스트(코드, 날자) 를 가져온다
		JobRequestVo jobRequestVo = jobService.getJobRequest(request_no);
		
		model.addAttribute("jobRequestVo", jobRequestVo);
		
		return "graduate/pop_jobRequestDetail";
	}*/
	
	
	
	
	
	
	

	
	
	
	
	/*
	 * @RequestMapping(value="/jobdetails") public JobVo
	 * jobdetails(@RequestParam("company_no")int company_no, Model model) {
	 * 
	 * System.out.println("company_no" + company_no);
	 * model.addAttribute("company_no", company_no); JobVo jobdetails =
	 * jobService.jobdetails(company_no);
	 * 
	 * return jobdetails; }
	 */
	
	
	

		
	
	/* modal */
	/*@ResponseBody
	@RequestMapping(value = "/choice", method = RequestMethod.POST)
	public List<InterViewerVo> getGisu(@ModelAttribute InterViewerVo gisuTableVo) {

		System.out.println(gisuTableVo.toString());
		List<InterViewerVo> getGisu = jobService.getGisu(gisuTableVo);
		System.out.println(getGisu.toString());

		return getGisu;
	}*/
	
	
	/* 취업의뢰리스트 한번클릭했을때 */
	/*@ResponseBody
	@RequestMapping(value = "/jobRequest", method = RequestMethod.POST)
	public JobVo getJobRequest(@RequestParam int request_no) {
		System.out.println(request_no);
		JobVo jobVo = jobService.getJobRequest(request_no);
		System.out.println(jobVo.toString());

		return jobVo;
	}*/
	
}
