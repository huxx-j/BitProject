package com.bitacademy.service;

import com.bitacademy.dao.*;
import com.bitacademy.util.DirectoryGenerator;
import com.bitacademy.util.FileUpload;
import com.bitacademy.vo.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ClassManagementService {

    @Autowired private ClassManagementDao classManagementDao;
    @Autowired private CurriculumDao curriculumDao;
    @Autowired private GisuDao gisuDao;
    @Autowired private LectureReportDao lectureReportDao;
    @Autowired private ProjectDao projectDao;
    @Autowired private ScoreDao scoreDao;
    @Autowired private UserInfoDao userInfoDao;
    @Autowired private DirectoryGenerator directoryGenerator;

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
        List<Integer> list = scoreDao.chkSisNo(scoreVo.getSubInStep_no());
        if (list.isEmpty()) {
            scoreVo.setSubInStep_no(0);
            List<ScoreVo> scoreVoList = scoreDao.getSutudentInScore(scoreVo);
            for (ScoreVo aScoreVoList : scoreVoList) {
                aScoreVoList.setFileName("등록된 파일이 없습니다.");
            }
            return scoreVoList;
        }
//        List<ScoreVo> scoreList = scoreDao.getSutudentInScore(scoreVo);
//        for (ScoreVo score : scoreList) {
//
//        }
//        return scoreList;
        return scoreDao.getSutudentInScore(scoreVo);
    }

//    public int saveScore(ScoreVo scoreVo) {
//        return scoreDao.saveScore(scoreVo);
//    }

    public List<UserInfoVo> getUserInfo(int currino) {
        return userInfoDao.getUserInfo(currino);
    }

    @Transactional
    public int saveProjectDetail(MultipartHttpServletRequest multipartFile) {
        FileUpload fileUpload = new FileUpload();
        ProjectVo projectVo = new ProjectVo();
        ProjectMemberVo projectMemberVo = new ProjectMemberVo();
        int projectNo = 0;
        int file_no = 0;
        if (!multipartFile.getFile("projectFile").isEmpty()) {
            String saveDir = directoryGenerator.DirectoryGenerator(multipartFile, "project");
            FileVo fileVo = fileUpload.saveProjectFile(multipartFile, saveDir);
            if (fileVo.getFile_no() == 0) {
                file_no = projectDao.saveProjectFile(fileVo); //file_no 리턴
            } else {
                projectDao.updateProjectFile(fileVo);
            }
        }

//            FileVo fileVo = fileUpload.saveProjectFile(multipartFile);
//        int file_no = 0;
//        if (!multipartFile.getFile("projectFile").isEmpty()) {
//            if (fileVo.getFile_no() == 0) {
//                file_no = projectDao.saveProjectFile(fileVo); //file_no 리턴
//            } else {
//                projectDao.updateProjectFile(fileVo);
//            }
//        }
        int curriculum_no = Integer.parseInt(multipartFile.getParameter("detailCurriNo"));
        int project_no;
        if (!multipartFile.getParameter("detailPjtNo").equals("0")) {
            project_no = Integer.parseInt(multipartFile.getParameter("detailPjtNo"));
            projectVo.setProject_no(project_no);
            projectMemberVo.setProject_no(project_no);
            projectNo = project_no;
        }
        String projectName = multipartFile.getParameter("detailProjectName");
        String outline = multipartFile.getParameter("outline");
        String focus = multipartFile.getParameter("focus");
        String applyField = multipartFile.getParameter("applyField");
        String useTechnique = multipartFile.getParameter("useTechnique");

        projectVo.setCurriculum_no(curriculum_no);
        projectVo.setProjectName(projectName);
        projectVo.setOutline(outline);
        projectVo.setFocus(focus);
        projectVo.setApplyField(applyField);
        projectVo.setUseTechnique(useTechnique);
        if (file_no != 0) {
            projectVo.setFile_no(file_no);
        }

        String[] memberNo = multipartFile.getParameter("membersId").split(",");

        if (projectVo.getProject_no() == 0) {
            projectDao.saveProjectDetail(projectVo);
            projectMemberVo.setProject_no(projectVo.getProject_no());
            projectNo = projectVo.getProject_no();
        } else {
            projectDao.updateProjectDetail(projectVo);
        }
        projectDao.deleteProjectMember(projectVo.getProject_no());

        for (String i : memberNo) {
            projectMemberVo.setUser_no(Integer.parseInt(i));
            projectDao.saveProjectMember(projectMemberVo);
        }

        return projectNo;
    }

    @Transactional
    public int saveScore(MultipartHttpServletRequest multipartFile) {
        ScoreVo scoreVo = new ScoreVo();
        FileUpload fileUpload = new FileUpload();
        int file_no;
        if (!multipartFile.getFile("studTestFile").isEmpty()) {
            String saveDir = directoryGenerator.DirectoryGenerator(multipartFile, "score");
            MultipartFile file = multipartFile.getFile("studTestFile");
            FileVo fileVo = fileUpload.saveScoreFile(file, saveDir);
            file_no = scoreDao.saveScoreFile(fileVo);
        } else {
            file_no = 0;
        }
        int score_no = Integer.parseInt(multipartFile.getParameter("iScoreNo"));
        int score = Integer.parseInt(multipartFile.getParameter("hScore"));
        int user_no = Integer.parseInt(multipartFile.getParameter("iUserNo"));
        int sis_no = Integer.parseInt(multipartFile.getParameter("iSisNo"));
        int curri_no = Integer.parseInt(multipartFile.getParameter("iCurriNo"));

        scoreVo.setScore_no(score_no);
        scoreVo.setCurriculum_no(curri_no);
        scoreVo.setSubInStep_no(sis_no);
        scoreVo.setUser_no(user_no);
        scoreVo.setScore(score);
        scoreVo.setFile_no(file_no);

        if (scoreVo.getScore_no() == 0) {
            return scoreDao.saveScore(scoreVo);
        } else {
            return scoreDao.updateScore(scoreVo);

// return scoreDao.updateScore(scoreVo);
        }
//        return 1;
    }

    @Transactional
    public int saveTest(MultipartHttpServletRequest multipartFile) {
        SubInStepVo subInStepVo = new SubInStepVo();
        FileUpload fileUpload = new FileUpload();
        int file_no;
        if (!multipartFile.getFile("testFile").isEmpty()) {
            String saveDir = directoryGenerator.DirectoryGenerator(multipartFile, "test");
            MultipartFile file = multipartFile.getFile("testFile");
            FileVo fileVo = fileUpload.saveScoreFile(file, saveDir);
            if (Integer.parseInt(multipartFile.getParameter("testFileNo"))!=0){
                file_no = Integer.parseInt(multipartFile.getParameter("testFileNo"));
                fileVo.setFile_no(file_no);
                return scoreDao.updateScoreFile(fileVo);
            } else {
                file_no = scoreDao.saveScoreFile(fileVo);
            }
        } else {
//            System.out.println("파일없음");
            file_no = 0;
        }

        int testSisNo = Integer.parseInt(multipartFile.getParameter("testSisNo"));
//        System.out.println(testSisNo);
        subInStepVo.setSubInStep_no(testSisNo);
        subInStepVo.setFile_no(file_no);
        if (file_no!=0) {
            return scoreDao.saveTest(subInStepVo);
        } else {
            return 1;
        }
    }

    public FileVo getSisInfo(int sisNo) {
        List<FileVo> list = scoreDao.getSisInfo(sisNo);
        FileVo fileVo = new FileVo();
        if (list.isEmpty()) {
            fileVo.setFile_no(0);
            fileVo.setFileName("등록된 파일이 없습니다.");
        } else {
            fileVo.setFile_no(list.get(0).getFile_no());
            fileVo.setFileName("등록된 파일 : " + list.get(0).getFileName());
        }
        return fileVo;
    }
}


