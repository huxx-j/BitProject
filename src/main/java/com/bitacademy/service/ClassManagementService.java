package com.bitacademy.service;

import com.bitacademy.dao.*;
import com.bitacademy.vo.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClassManagementService {

    @Autowired ClassManagementDao classManagementDao;
    @Autowired CurriculumDao curriculumDao;
    @Autowired GisuDao gisuDao;
    @Autowired LectureReportDao lectureReportDao;
    @Autowired ProjectDao projectDao;
    @Autowired ScoreDao scoreDao;
    @Autowired UserInfoDao userInfoDao;

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
        List<String> memberNoList;
        teamList = projectDao.getTeamList(currival);
        for (ProjectVo projectVo : teamList) {
            memberList = projectDao.getTeamMemberList(projectVo.getProject_no());
            memberNoList = projectDao.getTeamMembersNo(projectVo.getProject_no());
            projectVo.setMembersName(StringUtils.join(memberList,", "));
            projectVo.setMembersNo(StringUtils.join(memberNoList,","));
        }
        return teamList;
    }

    public ProjectVo getProjectDetail(int project_no) {
        List<String> memberList;
        List<String> memberNoList;
        ProjectVo projectVo = projectDao.getProjectDetail(project_no);
        memberList = projectDao.getTeamMemberList(projectVo.getProject_no());
        memberNoList = projectDao.getTeamMembersNo(projectVo.getProject_no());
        projectVo.setMembersName(StringUtils.join(memberList,", "));
        projectVo.setMembersNo(StringUtils.join(memberNoList,","));

        return projectVo;
    }

    @Transactional
    public int saveProjectDetail(ProjectVo projectVo) {
        ProjectMemberVo projectMemberVo = new ProjectMemberVo();
        String[] memberNo = projectVo.getMembersNo().split(",");
        projectMemberVo.setProject_no(projectVo.getProject_no());

        if (projectVo.getProject_no()==0) {
            projectDao.saveProjectDetail(projectVo);
            projectMemberVo.setProject_no(projectVo.getProject_no());
        } else {
            projectDao.updateProjectDetail(projectVo);
        }
        projectDao.deleteProjectMember(projectVo.getProject_no());
        int count=0;

        for (String i : memberNo) {
            projectMemberVo.setUser_no(Integer.parseInt(i));
            int c = projectDao.saveProjectMember(projectMemberVo);
            if (c!=0){
                count++;
            }
        }
        return count;
    }

    public List<ScoreVo> getSubjectList(int curriNo) {
        return scoreDao.getSubjectList(curriNo);
    }

    public List<ScoreVo> getSutudentInScore(ScoreVo scoreVo) {
        return scoreDao.getSutudentInScore(scoreVo);
    }

    public int saveScore(ScoreVo scoreVo) {
        return scoreDao.saveScore(scoreVo);
    }

    public List<UserInfoVo> getUserInfo(int currino) {
        return userInfoDao.getUserInfo(currino);
    }
}
