package com.bitacademy.controller;

import com.bitacademy.service.SubjectService;
import com.bitacademy.vo.MaxdepthVo;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.security.auth.Subject;
import java.util.List;

@Controller
@RequestMapping("/subject")
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    @RequestMapping("/main")
    public String mai1n2(Model model) {
        List<SubjectCateVo> list = subjectService.getcatelist();
        List<SubjectVo> sublist= subjectService.getsublist();
        List<MaxdepthVo> mdlist=subjectService.getmdlist();
        model.addAttribute("list", list);
        model.addAttribute("sublist", sublist);
        model.addAttribute("mdlist", mdlist);
        System.out.println(mdlist);
        System.out.println("/index");
        return "curridesign/subject";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String insert(@ModelAttribute SubjectVo subjectVo) {
        System.out.println("과목저장");
        subjectService.add(subjectVo);
        System.out.println(subjectVo.toString());
        return "redirect:/subject/main";
    }
}
