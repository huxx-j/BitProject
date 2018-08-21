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
import com.bitacademy.vo.GisuTableVo;
import com.bitacademy.vo.JobCriteriaVo;
import com.bitacademy.vo.JobVo;
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


	/* 두번클릭했을때 팝업 */
	/*취업의뢰기업 상세정보 가져오기*/
	@RequestMapping("/jobRequestDetail")
	public String popJobRequestDetail(@RequestParam("company_no")int company_no, Model model) {
		
		JobVo companyVo = jobService.getCompany(company_no);
		List<JobVo> jobRequestList = jobService.getJobRequestListByComNo(company_no);
		System.out.println("test: " + jobRequestList.toString());
		
		model.addAttribute("companyVo", companyVo);
		model.addAttribute("jobRequestList", jobRequestList);
		
		return "graduate/pop_jobRequestDetail";
	}

	

	/*특정기업 취업의뢰 상세*/
	@ResponseBody
	@RequestMapping(value = "/jobRequest", method = RequestMethod.POST)
	public JobVo getJobRequest(@RequestParam("request_no") int request_no) {

		JobVo jobVo = jobService.getJobRequest(request_no);
		System.out.println("jobVo: " + jobVo.toString());
		return jobVo;
	}
	
	
	
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
	
	
	
	/* 구인업체 한번클릭했을때 */
	/*취업지원자 리스트*/
	@ResponseBody
	@RequestMapping(value = "/getInterviewList", method = RequestMethod.POST)
	public List<JobVo> getInterviewList(@RequestParam int request_no) {
		System.out.println(request_no);
		List<JobVo> searchList = jobService.getInterviewList(request_no);
		System.out.println(searchList.toString());

		return searchList;
	}
		
	
	/* modal */
	@ResponseBody
	@RequestMapping(value = "/choice", method = RequestMethod.POST)
	public List<GisuTableVo> getGisu(@ModelAttribute GisuTableVo gisuTableVo) {

		System.out.println(gisuTableVo.toString());
		List<GisuTableVo> getGisu = jobService.getGisu(gisuTableVo);
		System.out.println(getGisu.toString());

		return getGisu;
	}
	
	
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
