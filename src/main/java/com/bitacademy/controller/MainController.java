package com.bitacademy.controller;

import jdk.nashorn.internal.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "ex/index1";
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

	@ResponseBody
	@RequestMapping("/jqtest")
	public String jqtest(){
		System.out.println("sdfgsdf");
		String a = "{gisu: 'Kuka18', name: '하...', birth: '2018-08-05', gender: '남', result: '합격', phone: '010-958-9562'}";

			return a;
	}


}
