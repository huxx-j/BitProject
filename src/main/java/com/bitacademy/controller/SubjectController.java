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


    @RequestMapping("/")
    public String subjectMain(Model model) {
        List<SubjectCateVo> list = subjectService.getcatelist();
        List<SubjectVo> sublist= subjectService.getsublist();
        List<Integer> nonlist=subjectService.getnlist();
        model.addAttribute("list", list);
        model.addAttribute("sublist", sublist);
        model.addAttribute("nonlist", nonlist);
        model.addAttribute("formatflag",0);
        return "curridesign/subject";
    }
    @ResponseBody
    @RequestMapping(value = "/updateCate", method = {RequestMethod.POST,RequestMethod.GET})
    public void updateCate(@RequestBody SubjectCateVo subjectCateVo) {
        subjectService.UpdateCate(subjectCateVo);
    }

    @ResponseBody
    @RequestMapping(value = "/getSubjectVo", method = {RequestMethod.POST,RequestMethod.GET})
    public SubjectVo getSubjecteVo(@RequestParam("no") int no ){
        SubjectVo subjectVo = subjectService.getsub(no);
        return subjectVo;
    }
    @ResponseBody
    @RequestMapping(value = "/getSubjectCate", method = {RequestMethod.POST,RequestMethod.GET})
    public SubjectCateVo getSubjectCate(@RequestParam("no") int no ){
        SubjectCateVo subjectCateVo = subjectService.getSubCate(no);
        return subjectCateVo;
    }
    @ResponseBody
    @RequestMapping(value = "/delSubject", method = {RequestMethod.POST,RequestMethod.GET})
    public void delSubject(@RequestParam("no") int no ){
        subjectService.delSubject(no);
    }
    @ResponseBody
    @RequestMapping(value = "/delCate", method = {RequestMethod.POST,RequestMethod.GET})
    public void delCate(@RequestParam("id") int id ){
        subjectService.delCate(id);
    }
//    @ResponseBody
//    @RequestMapping(value = "/addformat", method = {RequestMethod.POST,RequestMethod.GET})
//    public void addformat(@RequestParam("formatflag") int formatflag ) {
//        System.out.println(formatflag);
//    }


    //너 이거 왜 아작스니
    @RequestMapping(value = "/addSubjectCate", method = RequestMethod.POST)
    public void addcate(@RequestParam("SubjectCate_no") int subjectCate_no,@RequestParam("CateName") String CateName) {
        SubjectCateVo subjectCateVo=new SubjectCateVo();
        subjectCateVo.setSubjectCate_no(subjectCate_no);
        subjectCateVo.setCateName(CateName);
        subjectService.addcate(subjectCateVo);
    }
    @ResponseBody
    @RequestMapping(value = "/addSubject",method = {RequestMethod.POST,RequestMethod.GET})
    public String insert(@RequestBody SubjectVo subjectVo) {
        subjectService.add(subjectVo);
        return "redirect:/subject/";
    }
}
