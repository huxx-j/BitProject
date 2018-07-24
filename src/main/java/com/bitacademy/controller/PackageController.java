package com.bitacademy.controller;

import com.bitacademy.service.PackageService;
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
    @ResponseBody
    @RequestMapping(value = "/stepajax", method = {RequestMethod.POST,RequestMethod.GET})
    public void stepajax(@RequestParam("no") int no) {
        System.out.println(packageService.getstep(no));
        List<StepInPackVo> steplist= packageService.getstep(no);
        List<SubInStepVo> sublist=new ArrayList<SubInStepVo>();
        //return packageVo;
//       return subjectService.getsub(no);
    }
    @ResponseBody
    @RequestMapping(value = "/packajax", method = {RequestMethod.POST,RequestMethod.GET})
    public PackageVo packajax(@RequestParam("no") int no) {
        System.out.println(packageService.getpack(no));
        PackageVo packageVo = packageService.getpack(no);
        System.out.println("요거? > " + packageVo);
        return packageVo;
//       return subjectService.getsub(no);
    }
    @RequestMapping(value = "/addcate", method = RequestMethod.POST)
    public void packajax(@RequestParam("PackageCate_no") int packageCate_no,@RequestParam("CateName") String CateName) {
        PackageCateVo packageCateVo=new PackageCateVo();
        packageCateVo.setPackageCate_no(packageCate_no);
        packageCateVo.setCateName(CateName);
        System.out.println(packageCateVo.toString());
        packageService.addcate(packageCateVo);
    }
    @RequestMapping("/main")
    public String main(Model model){
        List<PackageCateVo> list=packageService.getcatelist();
        List<PackageVo> packlist=packageService.getpacklist();
        System.out.println(packlist.toString());
        model.addAttribute("list",list);
        model.addAttribute("packlist",packlist);
        return "curridesign/packmain";
    }
    @RequestMapping("/step")
    public String step(Model model){
        List<PackageCateVo> list=packageService.getcatelist();
        List<PackageVo> packlist=packageService.getpacklist();
        System.out.println(packlist.toString());
        model.addAttribute("list",list);
        model.addAttribute("packlist",packlist);
        return "curridesign/packstep";
    }

    @RequestMapping(value="/add" , method = RequestMethod.GET)
    public String insert(@ModelAttribute PackageVo packageVo, @RequestParam ("strPackageCate_no") String strPackageCate_no ,Model model){
        packageVo.setPackageCate_no(Integer.parseInt(strPackageCate_no));
        System.out.println("패키지설명 저장");
        System.out.println(packageVo.toString());
        model.addAttribute("PackageName",packageVo.getPackageName());
        model.addAttribute("TotalTime",packageVo.getTotalTime());
        model.addAttribute("Package_no",packageVo.getPackage_no());
        System.out.println(packageVo.getPackageName());
        int package_no=packageService.add(packageVo);
        model.addAttribute("Package_no",package_no);
        return "curridesign/packstep";
    }

    @RequestMapping(value="/stepadd" , method = RequestMethod.GET)
    public String insertstep(@ModelAttribute AllStepVo steplist){
        System.out.println("패키지단계 저장");
        System.out.println(steplist.toString());
        packageService.stepadd(steplist);
        return "curridesign/packstep";
    }
}