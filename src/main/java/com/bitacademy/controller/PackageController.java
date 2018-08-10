package com.bitacademy.controller;

import com.bitacademy.service.PackageService;
import com.bitacademy.service.SubjectService;
import com.bitacademy.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/package")
public class PackageController {

    @Autowired
    private PackageService packageService;
    @Autowired
    private SubjectService subjectService;

    @ResponseBody
    @RequestMapping(value = "/stepajax", method = {RequestMethod.POST,RequestMethod.GET})
    public void stepajax(@RequestParam("no") int no) {
        List<StepInPackVo> steplist= packageService.getstep(no);
        List<SubInStepVo> sublist=new ArrayList<SubInStepVo>();
        //return packageVo;
//       return subjectService.getsub(no);
    }

    //카테고리 수정을 위한 함수 (제거, 드래그, 이름수정)
    @ResponseBody
    @RequestMapping(value = "/updateCate", method = {RequestMethod.POST,RequestMethod.GET})
    public void updateCate(@RequestParam("subjectCateVo") SubjectCateVo subjectCateVo) {
        packageService.UpdateCate(subjectCateVo);
    }

    @ResponseBody
    @RequestMapping(value = "/getPackageVo", method = {RequestMethod.POST,RequestMethod.GET})
    public PackageVo getPackageVo(@RequestParam("no") int no,Model model) {
        PackageVo packageVo = packageService.getpack(no);
        packageVo.setSteplist(packageService.getstep(packageVo.getPackage_no()));   //패키지 NO기준으로 단계 리스트 받아옴
        List<StepInPackVo> steplist=packageVo.getSteplist();
        steplist=packageService.getsublist(steplist);                   //받아온 단계리스트의 과목리스트를 받아옴
        packageVo.setSteplist(steplist);                                //과목리스트까지 담은 리스트를 PackageVo를 담아줌
        return packageVo;
}
    @RequestMapping(value = "/addPackageCate", method = RequestMethod.POST)
    public void addPackageCate(@RequestParam("PackageCate_no") int packageCate_no,@RequestParam("CateName") String CateName) {
        PackageCateVo packageCateVo=new PackageCateVo();
        packageCateVo.setPackageCate_no(packageCate_no);
        packageCateVo.setCateName(CateName);
        packageService.addcate(packageCateVo);
    }
    @RequestMapping("/")
    public String main(Model model){
        List<PackageCateVo> packcatelist=packageService.getcatelist();
        List<PackageVo> packlist=packageService.getpacklist();
        List<SubjectCateVo> subcatelist = subjectService.getcatelist();
        List<SubjectVo> sublist= subjectService.getsublist();
        model.addAttribute("subcatelist", subcatelist);
        model.addAttribute("sublist", sublist);
        model.addAttribute("packcatelist",packcatelist);
        model.addAttribute("packlist",packlist);
        return "curridesign/packmain";
    }

    @ResponseBody
    @RequestMapping(value="/addPackage" , method = {RequestMethod.POST,RequestMethod.GET})
    public int addPackage(@ModelAttribute PackageVo packageVo , Model model){
        System.out.println(packageVo);
       model.addAttribute("PackageName",packageVo.getPackageName());
       model.addAttribute("TotalTime",packageVo.getTotalTime());
       model.addAttribute("Package_no",packageVo.getPackage_no());
       int package_no=packageService.addPackage(packageVo);
        model.addAttribute("Package_no",package_no);
        return package_no;
    }

    @RequestMapping(value="/addStep" , method = {RequestMethod.GET,RequestMethod.POST})
    public String addStep(@ModelAttribute AllStepVo steplist){
        System.out.println(steplist);
      packageService.stepadd(steplist);
     return "redirect:/package/";
    }

    @RequestMapping(value="/deleteStep" , method = {RequestMethod.GET,RequestMethod.POST})
    public String deleteStep(@ModelAttribute AllStepVo steplist){
        System.out.println("delete?");
        System.out.println(steplist);
        packageService.stepadd(steplist);
        return "redirect:/package/";
    }


//    @ResponseBody
//    @RequestMapping(value = "/deleteSubInPack", method = {RequestMethod.POST,RequestMethod.GET})
//    public void deleteSubInPack(@RequestParam("no") int no) {
//    packageService.deleteSubInPack(no);
//    }
}