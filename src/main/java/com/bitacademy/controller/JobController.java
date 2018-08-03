package com.bitacademy.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitacademy.service.JobService;
import com.bitacademy.vo.GisuVo;
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


	@ResponseBody
	@RequestMapping(value="/comSearch",method=RequestMethod.POST)
	public List<JobVo> comSearch(@ModelAttribute JobSearchVo jobSearchVo) {

		System.out.println(jobSearchVo.toString());

		List<JobVo> searchUserlist = jobService.comSearch(jobSearchVo);

		/*System.out.println(searchUserlist.toString());*/

		return null;
	}

	@ResponseBody
	@RequestMapping(value="/getSearchList",method=RequestMethod.POST)
	public List<JobVo> getSearchList(@RequestParam int commpany_no){

		System.out.println(commpany_no);
		List<JobVo> searchList = jobService.getSearchList(commpany_no);
		System.out.println(searchList.toString());

		return searchList;
	}









	/*modal*/
	@ResponseBody
	@RequestMapping(value = "/choice" , method=RequestMethod.POST)
	public List<GisuVo> testsubmit(@RequestParam("gisu") String gisu ,@RequestParam("name") String name) {

		System.out.println(gisu +"/"+ name);

		List<GisuVo> getGisu = new ArrayList<GisuVo>();
		getGisu = jobService.getGisu(gisu, name);

		return getGisu;
	}


	@RequestMapping("/test2")
	public String test2(){
		System.out.println("/test2");
		return "graduate/test2";
	}

	

}
