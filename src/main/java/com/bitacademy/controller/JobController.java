package com.bitacademy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.JobService;
import com.bitacademy.vo.GisuVo;
import com.bitacademy.vo.JobVo;



@Controller
public class JobController {

	@Autowired
	JobService jobService;

	@RequestMapping("/test")
	public String test(){
		System.out.println("/test");
		return "graduate/test";
	}

	@RequestMapping("/test1")
	public String test1(){
		System.out.println("/test1");
		return "graduate/test1";
	}

	@RequestMapping("/test2")
	public String test2(){
		System.out.println("/test2");
		return "graduate/test2";
	}

	@ResponseBody
	@RequestMapping(value = "/inquiry" , method=RequestMethod.POST)
	public String testsubmit(@RequestParam("radio") int radio
			,@RequestParam("date1") String date1, @RequestParam("date2") String date2) {

		System.out.println(radio +"/"+ date1 +"/"+ date2);

		List<JobVo> getJob = new ArrayList<JobVo>();
		getJob = jobService.getJob(radio, date1, date2);

		return "graduate/test";
	}


	@ResponseBody
	@RequestMapping(value = "/inquiry2" , method=RequestMethod.POST)
	public List<GisuVo> testsubmit(@RequestParam("gisu") String gisu
			,@RequestParam("name") String name) {

		System.out.println(gisu +"/"+ name);

		List<GisuVo> getGisu = new ArrayList<GisuVo>();
		getGisu = jobService.getGisu(gisu, name);

		return getGisu;
	}

}
