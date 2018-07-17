package com.bitacademy.service;

import com.bitacademy.dao.*;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.LectureReportVo;
import com.bitacademy.vo.ProjectVo;
import com.bitacademy.vo.UsersVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClassManagementService {

    @Autowired
    ClassManagementDao classManagementDao;

    @Autowired
    CurriculumDao curriculumDao;

    @Autowired
    GisuDao gisuDao;

    @Autowired
    LectureReportDao lectureReportDao;

    @Autowired
    ProjectDao projectDao;

    public List<String> getWorkType() {
        return curriculumDao.getWorkType();
    }

    public List<CurriculumVo> getCurri(String workType) {
        return curriculumDao.getCurri(workType);
    }

    public Map<String, Object> getCurriInfo(int curriculum_no) {
        Map<String, Object> map = new HashMap<>();
        map.put("vo",curriculumDao.getCurriInfo(curriculum_no));
        map.put("gisu",gisuDao.getGisu(curriculum_no));
        return map;
    }

    public List<LectureReportVo> getLetureReport(LectureReportVo lectureReportVo) {
        return lectureReportDao.getLetureReport(lectureReportVo);
    }

    public String getDate() {
        return classManagementDao.getDate();
    }

    public int saveLectureReport(LectureReportVo lectureReportVo) {
        String lectureReport_no = lectureReportVo.getDate().replace("-","")+"-"+lectureReportVo.getCurriculum_no()+"-"+lectureReportVo.getPeriod();
        lectureReportVo.setLectureReport_no(lectureReport_no);
        if (!lectureReportVo.getSubject().equals("") || !lectureReportVo.getContent().equals("") || !lectureReportVo.getInstructor().equals("") || !lectureReportVo.geteTC().equals("")) {
            return lectureReportDao.saveLetureReport(lectureReportVo);
        } else {
            return 0;
        }
    }

    public List<UsersVo> getMemberName(int curriNo) {
        return projectDao.getMemberName(curriNo);
    }

    public List<ProjectVo> getTeamList(int currival) {
        List<ProjectVo> teamList;
        List<String> memberList;

        teamList = projectDao.getTeamList(currival);

        for (ProjectVo projectVo : teamList) {
            memberList = projectDao.getTeamMemberList(projectVo.getProject_no());
            projectVo.setMembersName(StringUtils.join(memberList,", "));
        }


        return teamList;
    }
}
