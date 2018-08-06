package com.bitacademy.controller;

import com.bitacademy.service.TestService;
import com.bitacademy.vo.PagerRequestVo;
import com.bitacademy.vo.PagerResponseVo;
import com.bitacademy.vo.TestVo;
import jdk.nashorn.internal.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class MainController {
	//기본값
		@RequestMapping("/")
	public String mai1n(){
		System.out.println("/index1");
		return "ex/index_renew";
	}

	@RequestMapping("/11")
	public String mai1n2(){
		System.out.println("/index2");
		return "ex/subject";
	}
	@RequestMapping("/1")
	public String main1(){
		System.out.println("/index3");
		return "ex/packmain";
	}
	
	@RequestMapping("/12")
	public String index1(){
		System.out.println("/index4");
		return "ex/index_jqgrid2";
	}
	
	@RequestMapping("/test1")
	public String index11(){
		System.out.println("/index5");
		return "ex/index_renew1";
	}
	
	@RequestMapping("/14")
	public String index12(){
		System.out.println("/index6");
		return "ex/index_jqgrid";
	}

	@Autowired
	TestService testService;

	@ResponseBody
	@RequestMapping(value = "/jqtest", method = RequestMethod.POST)
	public PagerResponseVo jqtest(@RequestParam("page") int page, @RequestParam("rows") int rows, @RequestParam("sidx") String sidx, @RequestParam("sord") String sord){
//	public List<TestVo> jqtest(@RequestBody PagerRequestVo pagerRequestVo){
//		System.out.println(pagerRequestVo.toString());
		System.out.println("page > " + page);
		System.out.println("rows > " + rows);
		System.out.println("sidx > " + sidx);
		System.out.println("sord > " + sord);

		return testService.getInfoList(page, rows, sidx, sord);
	}


}
