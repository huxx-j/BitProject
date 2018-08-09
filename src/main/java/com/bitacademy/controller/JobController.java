package com.bitacademy.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.JobService;
import com.bitacademy.vo.GisuTableVo;

import com.bitacademy.vo.JobSearchVo;
import com.bitacademy.vo.JobVo;




@Controller
@RequestMapping("/jobrequest")
public class JobController {

	@Autowired
	JobService jobService;

	/*취업의뢰 메인*/
	@RequestMapping("/")
	public String jobrequestMain(){
		System.out.println("/취업의뢰 메인");
		return "graduate/jobrequest";
	}


	/*기업정보 리스트 가져오기*/
	@ResponseBody
	@RequestMapping(value="/jobRequestList",method=RequestMethod.POST)
	public List<JobVo> jobRequestList(@ModelAttribute JobSearchVo jobSearchVo) {
		
		System.out.println(jobSearchVo.toString());
		List<JobVo> jobRequestList = jobService.jobRequestList(jobSearchVo);
		System.out.println(jobRequestList.toString());
		
		return jobRequestList;
	}

	@ResponseBody
	@RequestMapping(value="/getInterviewList",method=RequestMethod.POST)
	public List<JobVo> getInterviewList(@RequestParam int request_no){

		System.out.println(request_no);
		List<JobVo> searchList = jobService.getInterviewList(request_no);
		System.out.println(searchList.toString());

		return searchList;
	}


	/*modal*/
	@ResponseBody
	@RequestMapping(value = "/choice" , method=RequestMethod.POST)
	public List<GisuTableVo> getGisu(@ModelAttribute GisuTableVo gisuTableVo) {

		System.out.println(gisuTableVo.toString());
		List<GisuTableVo> getGisu = jobService.getGisu(gisuTableVo);
		System.out.println(getGisu.toString());
		
		return getGisu;
	}


	@RequestMapping("/test2")
	public String test2(){
		System.out.println("/test2");
		return "graduate/test2";
	}

	

}
