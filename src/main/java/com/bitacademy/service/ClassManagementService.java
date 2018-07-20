package com.bitacademy.service;

import com.bitacademy.dao.*;
import com.bitacademy.util.FileUpload;
import com.bitacademy.vo.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
    @Autowired
    ScoreDao scoreDao;
    @Autowired
    UserInfoDao userInfoDao;

    public List<String> getWorkType() {
        return curriculumDao.getWorkType();
    }

    public List<CurriculumVo> getCurri(String workType) {
        return curriculumDao.getCurri(workType);
    }

    public Map<String, Object> getCurriInfo(int curriculum_no) {
        Map<String, Object> map = new HashMap<>();
        map.put("vo", curriculumDao.getCurriInfo(curriculum_no));
        map.put("gisu", gisuDao.getGisu(curriculum_no));
        return map;
    }

    public List<LectureReportVo> getLetureReport(LectureReportVo lectureReportVo) {
        return lectureReportDao.getLetureReport(lectureReportVo);
    }

    public String getDate() {
        return classManagementDao.getDate();
    }

    public int saveLectureReport(LectureReportVo lectureReportVo) {
        String lectureReport_no = lectureReportVo.getDate().replace("-", "") + "-" + lectureReportVo.getCurriculum_no() + "-" + lectureReportVo.getPeriod();
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
            projectVo.setMembersName(StringUtils.join(memberList, ", "));
            projectVo.setMembersNo(StringUtils.join(memberNoList, ","));
        }
        return teamList;
    }

    public ProjectVo getProjectDetail(int project_no) {
        List<String> memberList;
        List<String> memberNoList;
        ProjectVo projectVo = projectDao.getProjectDetail(project_no);
        memberList = projectDao.getTeamMemberList(projectVo.getProject_no());
        memberNoList = projectDao.getTeamMembersNo(projectVo.getProject_no());
        projectVo.setMembersName(StringUtils.join(memberList, ", "));
        projectVo.setMembersNo(StringUtils.join(memberNoList, ","));
        if (projectVo.getFile_no() != 0) {
            projectVo.setFileName("등록된 파일 : " + projectDao.getFileName(projectVo.getFile_no()));
        } else {
            projectVo.setFileName("등록된 파일이 없습니다.");
        }
        return projectVo;
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

    @Transactional
    public int saveProjectFile(MultipartHttpServletRequest multipartFile) {
        System.out.println("서비스");
        FileUpload fileUpload = new FileUpload();
        ProjectVo projectVo = new ProjectVo();
        ProjectMemberVo projectMemberVo = new ProjectMemberVo();

        FileVo fileVo = fileUpload.saveProjectFile(multipartFile);
        System.out.println("파일 처리 끝내고 서비스로 나옴");
        int file_no =0;
        if (!multipartFile.getFile("projectFile").isEmpty()) {
            if (fileVo.getFile_no() == 0) {
                file_no = projectDao.saveProjectFile(fileVo); //file_no 리턴
            } else {
                projectDao.updateProjectFile(fileVo);
            }
        }
        System.out.println("디비에 파일 정보 입력");
        int curriculum_no = Integer.parseInt(multipartFile.getParameter("detailCurriNo"));
        System.out.println("1");
        int project_no;
        System.out.println(multipartFile.getParameter("detailPjtNo"));
        if (!multipartFile.getParameter("detailPjtNo").equals("0")) {
            project_no = Integer.parseInt(multipartFile.getParameter("detailPjtNo"));
            projectVo.setProject_no(project_no);
            projectMemberVo.setProject_no(project_no);
        }
        System.out.println("2");
        String projectName = multipartFile.getParameter("detailProjectName");
        System.out.println("3");
        String outline = multipartFile.getParameter("outline");
        System.out.println("4");
        String focus = multipartFile.getParameter("focus");
        System.out.println("5");
        String applyField = multipartFile.getParameter("applyField");
        System.out.println("6");
        String useTechnique = multipartFile.getParameter("useTechnique");
        System.out.println("7");

        projectVo.setCurriculum_no(curriculum_no);
        projectVo.setProjectName(projectName);
        projectVo.setOutline(outline);
        projectVo.setFocus(focus);
        projectVo.setApplyField(applyField);
        projectVo.setUseTechnique(useTechnique);
        if (file_no != 0) {
            System.out.println("신규등록이 아님");
            projectVo.setFile_no(file_no);
        }

        System.out.println("프로젝트 정보 저장 시작");
        String[] memberNo = multipartFile.getParameter("membersId").split(",");
        System.out.println("프로젝트 정보 저장 시작2");

        if (projectVo.getProject_no() == 0) {
            System.out.println("프로젝트 신규등록 들어감");
            System.out.println(projectVo);
            projectDao.saveProjectDetail(projectVo);
            System.out.println("프로젝트 신규등록 나옴");
            projectMemberVo.setProject_no(projectVo.getProject_no());
        } else {
            System.out.println("프로젝트 업데이트 들어감");
            projectDao.updateProjectDetail(projectVo);
            System.out.println("프로젝트 업데이트 나옴");
        }
        System.out.println("프로젝트 멤버 삭제 들어감");
        projectDao.deleteProjectMember(projectVo.getProject_no());
        System.out.println("프로젝트 멤버 삭제 나옴");
        int count = 0;

        for (String i : memberNo) {
            projectMemberVo.setUser_no(Integer.parseInt(i));
            int c = projectDao.saveProjectMember(projectMemberVo);
            System.out.println(c + "번째 멤버 등록 성공");
            if (c != 0) {
                count++;
            }
        }
        System.out.println("프로젝트 등록 성공");
        return count;
    }
}

