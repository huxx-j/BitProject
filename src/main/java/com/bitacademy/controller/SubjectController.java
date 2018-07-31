package com.bitacademy.controller;

import com.bitacademy.service.SubjectService;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        List<Integer> nonlist=subjectService.getnlist();
        model.addAttribute("list", list);
        model.addAttribute("sublist", sublist);
        model.addAttribute("nonlist", nonlist);
        model.addAttribute("formatflag",0);
        System.out.println(nonlist);
        return "curridesign/subject";
    }
    @ResponseBody
    @RequestMapping(value = "/UpdateCate", method = {RequestMethod.POST,RequestMethod.GET})
    public void UpdateCate(@RequestBody SubjectCateVo subjectCateVo) {

        System.out.println(subjectCateVo.toString()+"Con");
        subjectService.UpdateCate(subjectCateVo);
    }
    @ResponseBody
    @RequestMapping(value = "/subajax", method = {RequestMethod.POST,RequestMethod.GET})
    public SubjectVo subajax(@RequestParam("no") int no ){
        System.out.println(subjectService.getsub(no));
        SubjectVo subjectVo = subjectService.getsub(no);
        System.out.println("요거? > " + subjectVo);
        return subjectVo;
//       return subjectService.getsub(no);
    }
    @ResponseBody
    @RequestMapping(value = "/addformat", method = {RequestMethod.POST,RequestMethod.GET})
    public void addformat(@RequestParam("formatflag") int formatflag ) {
        System.out.println(formatflag);
    }



    @RequestMapping(value = "/addcate", method = RequestMethod.POST)
    public void addcate(@RequestParam("SubjectCate_no") int subjectCate_no,@RequestParam("CateName") String CateName) {
        SubjectCateVo subjectCateVo=new SubjectCateVo();
        subjectCateVo.setSubjectCate_no(subjectCate_no);
        subjectCateVo.setCateName(CateName);
        System.out.println(subjectCateVo.toString());
        subjectService.addcate(subjectCateVo);
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String insert(@ModelAttribute SubjectVo subjectVo) {
        System.out.println("과목저장");
        subjectService.add(subjectVo);
        System.out.println(subjectVo.toString());
        return "redirect:/subject/main";
    }
}
