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


	//jqgrid 페이징 예제
	@Autowired
	TestService testService;

	@ResponseBody
	@RequestMapping(value = "/jqtest", method = RequestMethod.POST)
	public PagerResponseVo jqtest(@RequestParam("page") int page, @RequestParam("rows") int rows, @RequestParam("sidx") String sidx, @RequestParam("sord") String sord){
		//우리가 설정하지 않아도 jqgrid에서 자동으로 파라미터 4개를 보내줌
		//파라미터 부분은 그대로 쓸것, Vo로 받아보려 시도 했으나 안됨
		System.out.println("page : " + page + ", rows : " + rows + ", sidx : " + sidx + ",sord : " + sord);
		return testService.getInfoList(page, rows, sidx, sord); //service로 보냄
	}


}
