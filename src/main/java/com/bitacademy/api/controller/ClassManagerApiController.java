package com.bitacademy.api.controller;

import com.bitacademy.service.ClassManagementService;
import com.bitacademy.vo.*;
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
    @RequestMapping(value = "/getCurri", method = RequestMethod.POST)
    public List<CurriculumVo> getCurri(@RequestParam("workType") String workType) {
        return classManagementService.getCurri(workType);
    }

    @ResponseBody
    @RequestMapping(value = "getCurriInfo", method = RequestMethod.POST)
    public Map<String, Object> getCurriInfo(@RequestParam("currival") int curriculum_no) {
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
//        System.out.println(curriNo);
        return classManagementService.getMemberName(curriNo);
    }

    @ResponseBody
    @RequestMapping(value = "/getTeamList", method = RequestMethod.POST)
    public List<ProjectVo> getTeamList(@RequestParam("currival") int currival) {
        return classManagementService.getTeamList(currival);
    }

    @ResponseBody
    @RequestMapping(value = "/getProjectDetail", method = RequestMethod.POST)
    public ProjectVo getProjectDetail(@RequestParam("project_no") int project_no) {
        return classManagementService.getProjectDetail(project_no);
    }

    @ResponseBody
    @RequestMapping(value = "/saveProjectDetail", method = RequestMethod.POST)
    public int saveProjectDetail(@RequestBody ProjectVo projectVo) {
//        System.out.println(projectVo.toString());
        return classManagementService.saveProjectDetail(projectVo);
//        System.out.println(projectVo.toString());
    }

    @ResponseBody
    @RequestMapping(value = "/getSubjectList", method = RequestMethod.POST)
    public List<ScoreVo> getSubjectList(@RequestParam("currival") int curriNo) {
        return classManagementService.getSubjectList(curriNo);
    }

    @ResponseBody
    @RequestMapping(value = "getSutudentInScore", method = RequestMethod.POST)
    public List<ScoreVo> getSutudentInScore(@RequestBody ScoreVo scoreVo) {
        return classManagementService.getSutudentInScore(scoreVo);
    }

    @ResponseBody
    @RequestMapping(value = "/saveScore", method = RequestMethod.POST)
    public int saveScore(@RequestBody ScoreVo scoreVo) {
        return classManagementService.saveScore(scoreVo);
    }

    @ResponseBody
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
    public List<UserInfoVo> getUserInfo(@RequestParam("curriNo") int currino) {
        return classManagementService.getUserInfo(currino);
    }

}
