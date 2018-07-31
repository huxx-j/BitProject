package com.bitacademy.api.controller;

import com.bitacademy.service.ClassManagementService;
import com.bitacademy.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/api/cm")
public class ClassManagerApiController {

    @Autowired
    ClassManagementService classManagementService;

    //교육과정 셀렉트박스에 커리큘럼불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getCurri", method = RequestMethod.POST)
    public List<CurriculumVo> getCurri(@RequestParam("workType") String workType) {
        return classManagementService.getCurri(workType);
    }

    //교육과정검색에서 조회버튼 누르면 수업관리에 과정정보 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "getCurriInfo", method = RequestMethod.POST)
    public Map<String, Object> getCurriInfo(@RequestParam("currival") int curriculum_no) {
        return classManagementService.getCurriInfo(curriculum_no);
    }

    //수업일지에서 불러오기 버튼을 누르면 날짜에 맞는 수업일지를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getLectureReport", method = RequestMethod.POST)
    public List<LectureReportVo> getLectureReport(@RequestBody LectureReportVo lectureReportVo) {
        return  classManagementService.getLetureReport(lectureReportVo);
    }

    //입력한 수업일지를 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/saveLectureReport", method = RequestMethod.POST)
    public int saveLectureReport(@RequestBody LectureReportVo lectureReportVo) {
        System.out.println(lectureReportVo.toString());
        return classManagementService.saveLectureReport(lectureReportVo);
    }

    //프로젝트 상세에서 팀추가나 팀리스트를 누르면 팀원선택 모달창에 과정을 듣는 학생들 리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getMemberName", method = RequestMethod.POST)
    public List<UsersVo> getMemberName(@RequestParam("curriNo") int curriNo) {
        return classManagementService.getMemberName(curriNo);
    }

    //교육과정검색 조회버튼을 누르면 프로젝트 탭에 팀리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getTeamList", method = RequestMethod.POST)
    public List<ProjectVo> getTeamList(@RequestParam("currival") int currival) {
        return classManagementService.getTeamList(currival);
    }

    //팀리스트를 선택하면 팀상세정보를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getProjectDetail", method = RequestMethod.POST)
    public ProjectVo getProjectDetail(@RequestParam("project_no") int project_no) {
        return classManagementService.getProjectDetail(project_no);
    }

    //이론평가탭에서 커리큘럼 별 과목리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getSubjectList", method = RequestMethod.POST)
    public List<ScoreVo> getSubjectList(@RequestParam("currival") int curriNo) {
        return classManagementService.getSubjectList(curriNo);
    }

    //이론평가탭 과목별 학생리스트 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "getSutudentInScore", method = RequestMethod.POST)
    public List<ScoreVo> getSutudentInScore(@RequestBody ScoreVo scoreVo) {
        return classManagementService.getSutudentInScore(scoreVo);
    }

    //학생관리탭 학생 리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.POST)
    public List<UserInfoVo> getUserInfo(@RequestParam("curriNo") int currino) {
        return classManagementService.getUserInfo(currino);
    }

    //프로젝트 상세정보와 파일을 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/saveProjectDetail", method = {RequestMethod.GET,RequestMethod.POST})
    public int saveProjectDetail(MultipartHttpServletRequest multipartFile) {
        return classManagementService.saveProjectDetail(multipartFile);
    }

    //이론평가 점수와 파일을 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/saveScore", method = {RequestMethod.GET,RequestMethod.POST})
    public int saveScore(MultipartHttpServletRequest multipartFile) {
        return classManagementService.saveScore(multipartFile);
    }

    //이론평가 시험지를 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/saveTest", method = RequestMethod.POST)
    public int saveTest(MultipartHttpServletRequest multipartFile) {
        return classManagementService.saveTest(multipartFile);
    }

    //파일 유무 알려주는 코드?
    @ResponseBody
    @RequestMapping(value = "/getSisInfo", method = RequestMethod.POST)
    public FileVo getSisInfo(@RequestParam("sisNo") int sisNo) {
        return classManagementService.getSisInfo(sisNo);
    }
}
