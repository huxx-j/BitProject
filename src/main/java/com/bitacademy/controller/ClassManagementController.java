package com.bitacademy.controller;

import com.bitacademy.service.ClassManagementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/cm", method = RequestMethod.GET)
public class ClassManagementController {

    @Autowired
    ClassManagementService classManagementService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main(){
        return "/classmanagement/classmanagement";
    }
}
