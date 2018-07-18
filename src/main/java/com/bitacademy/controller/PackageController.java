package com.bitacademy.controller;

import com.bitacademy.service.PackageService;
import com.bitacademy.vo.PackageCateVo;
import com.bitacademy.vo.PackageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;


@Controller
@RequestMapping("/package")
public class PackageController {

    @Autowired
    private PackageService packageService;

    @RequestMapping("/main")
    public String main(Model model){
        List<PackageCateVo> list=packageService.getcatelist();
        System.out.println(list.toString());
        model.addAttribute("list",list);
        return "curridesign/packmain";
    }
    @RequestMapping("/step")
    public String step(Model model){
        return "curridesign/packstep";
    }

    @RequestMapping(value="/add" , method = RequestMethod.GET)
    public String insert(@ModelAttribute PackageVo packageVo, @RequestParam ("strPackageCate_no") String strPackageCate_no ,Model model){
        packageVo.setPackageCate_no(Integer.parseInt(strPackageCate_no));
        System.out.println("패키지설명 저장");
        System.out.println(packageVo.toString());
        model.addAttribute("PackageName",packageVo.getPackageName());
        model.addAttribute("TotalTime",packageVo.getTotalTime());
        System.out.println(packageVo.getPackageName());
        packageService.add(packageVo);
        return "curridesign/packstep";
    }
}