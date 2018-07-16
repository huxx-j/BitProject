package com.bitacademy.controller;

import com.bitacademy.service.ClassManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cm", method = RequestMethod.GET)
public class ClassManagementController {

    @Autowired
    ClassManagementService classManagementService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(Model model){

        model.addAttribute("workType",classManagementService.getWorkType());
        model.addAttribute("date",classManagementService.getDate());
        String date = classManagementService.getDate();
//        System.out.println(date);

        return "/class/classmanagement";
    }
}
