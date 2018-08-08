package com.bitacademy.controller;

import com.bitacademy.service.ClassManagementService;
import com.bitacademy.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/class", method = RequestMethod.GET)
public class ClassManagementController {

    @Autowired
    ClassManagementService classManagementService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String classMain(Model model){
        model.addAttribute("cateName",classManagementService.getCateName());
        model.addAttribute("date",classManagementService.getDate());
        return "/class/classmanagement";
    }


    //ajax 시작

    //교육과정 셀렉트박스에 커리큘럼불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getCurriList", method = RequestMethod.POST)
    public List<CurriculumVo> getCurriList(@RequestParam("cateName") String cateName, @RequestParam("radioStat") String radioStat) {
        System.out.println(cateName);
        System.out.println(radioStat);
        return classManagementService.getCurriList(cateName, radioStat);
    }

    //교육과정검색에서 조회버튼 누르면 수업관리에 과정정보 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getCurriInfo", method = RequestMethod.POST)
    public Map<String, Object> getCurriInfo(@RequestParam("currival") int currival) {
        return classManagementService.getCurriInfo(currival);
    }

    //수업일지에서 불러오기 버튼을 누르면 날짜에 맞는 수업일지를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getLectureReportList", method = RequestMethod.POST)
    public List<LectureReportVo> getLectureReportList(@RequestBody LectureReportVo lectureReportVo) {
        return  classManagementService.getLetureReportList(lectureReportVo);
    }

    //입력한 수업일지를 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/addLectureReport", method = RequestMethod.POST)
    public int addLectureReport(@RequestBody LectureReportVo lectureReportVo) {
        System.out.println(lectureReportVo.toString());
        return classManagementService.addLectureReport(lectureReportVo);
    }

    //프로젝트 상세에서 팀추가나 팀리스트를 누르면 팀원선택 모달창에 과정을 듣는 학생들 리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getMemberNameList", method = RequestMethod.POST)
    public List<UsersVo> getMemberNameList(@RequestParam("curriNo") int curriNo) {
        return classManagementService.getMemberNameList(curriNo);
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
    @RequestMapping(value = "/getStudentInScoreList", method = RequestMethod.POST)
    public List<ScoreVo> getStudentInScoreList(@RequestBody ScoreVo scoreVo) {
        return classManagementService.getStudentInScoreList(scoreVo);
    }

    //학생관리탭 학생 리스트를 불러오는 코드
    @ResponseBody
    @RequestMapping(value = "/getUserInfoList", method = RequestMethod.POST)
    public List<UserInfoVo> getUserInfoList(@RequestParam("curriNo") int currino) {
        return classManagementService.getUserInfoList(currino);
    }

    //프로젝트 상세정보와 파일을 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/addProjectDetail", method = {RequestMethod.GET,RequestMethod.POST})
    public int addProjectDetail(MultipartHttpServletRequest multipartFile) {
        return classManagementService.addProjectDetail(multipartFile);
    }

    //이론평가 점수와 파일을 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/addScore", method = {RequestMethod.GET,RequestMethod.POST})
    public int addScore(MultipartHttpServletRequest multipartFile) {
        return classManagementService.addScore(multipartFile);
    }

    //이론평가 시험지를 저장하는 코드
    @ResponseBody
    @RequestMapping(value = "/addTest", method = RequestMethod.POST)
    public int addTest(MultipartHttpServletRequest multipartFile) {
        return classManagementService.addTest(multipartFile);
    }

    //파일 유무 알려주는 코드?
    @ResponseBody
    @RequestMapping(value = "/getSisInfo", method = RequestMethod.POST)
    public FileVo getSisInfo(@RequestParam("sisNo") int sisNo) {
        return classManagementService.getSisInfo(sisNo);
    }

    //프로젝트 상세정보를 삭제하는 코드(실제 삭제는 안되고 state만 변경)
    @ResponseBody
    @RequestMapping(value = "/delProjectDetail", method = RequestMethod.POST)
    public int delProjectDetail(@RequestParam("pjtNo") int pjtNo) {
        return classManagementService.delProjectDetail(pjtNo);
    }
}

