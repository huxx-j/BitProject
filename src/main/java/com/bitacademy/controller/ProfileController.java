package com.bitacademy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/profile")
public class ProfileController {
	
	/* 프로필 팝업 메인 */
	@RequestMapping("/")
	public String popProfile() {
		System.out.println("/프로필메인");
		return "profile/pop_profile2";
	}
	
	

}
