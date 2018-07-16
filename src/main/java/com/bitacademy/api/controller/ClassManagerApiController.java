package com.bitacademy.api.controller;

import com.bitacademy.service.ClassManagementService;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.LectureReportVo;
import com.bitacademy.vo.UsersVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/api/cm")
public class ClassManagerApiController {

    @Autowired
    ClassManagementService classManagementService;

    @ResponseBody
    @RequestMapping(value = "/getcurri", method = RequestMethod.POST)
    public List<CurriculumVo> getCurri(@RequestParam("workType") String workType) {
        return classManagementService.getCurri(workType);
    }

    @ResponseBody
    @RequestMapping(value = "getcurriinfo", method = RequestMethod.POST)
    public Map<String, Object> getCurriInfo(@RequestParam("currival") int curriculum_no) {
//        System.out.println(curriculum_no);

        return classManagementService.getCurriInfo(curriculum_no);
    }

    @ResponseBody
    @RequestMapping(value = "/getLectureReport", method = RequestMethod.POST)
    public List<LectureReportVo> getLectureReport(@RequestBody LectureReportVo lectureReportVo) {
//        System.out.println(lectureReportVo.toString());
        List<LectureReportVo> list = classManagementService.getLetureReport(lectureReportVo);
//        System.out.println(list.toString());
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/saveLectureReport", method = RequestMethod.POST)
    public int saveLectureReport(@RequestBody LectureReportVo lectureReportVo) {
//        System.out.println(lectureReportVo);
//        System.out.println(1);
        return classManagementService.saveLectureReport(lectureReportVo);
    }
    @ResponseBody
    @RequestMapping(value = "/getMemberName", method = RequestMethod.POST)
    public List<UsersVo> getMemberName(@RequestParam("curriNo") int curriNo) {
        System.out.println(curriNo);
        return classManagementService.getMemberName(curriNo);

    }

}
