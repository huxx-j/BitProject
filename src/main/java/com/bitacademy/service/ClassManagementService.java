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

    //페이지 로딩할때 업무구분 불러오는 코드
    public List<String> getCateName() {
        return classManagementDao.getCateName();
    }

    //페이지 로딩시 오늘 날짜를 불러오는 코드 (강의일자 디폴트)
    public String getDate() {
        return classManagementDao.getDate();
    }
    //업무구분에 따라 커리큘럼 리스트 불러오는 코드
    public List<CurriculumVo> getCurriList(String cateName, String radioStat) {
        Map<String, Object> map = new HashMap<>();
        map.put("cateName", cateName);
        map.put("radioStat", radioStat);
        return classManagementDao.getCurriList(map);
    }

    //교육과정검색 조회버튼 눌렀을때 수업관리에 과정정보 불러오는 코드
    public CurriculumVo getCurriInfo(int curriculum_no) {
//        Map<String, Object> returnMap = new HashMap<>();
//        returnMap.put("vo", classManagementDao.getCurriInfo(curriculum_no));
//        returnMap.put("gisu", gisuDao.getGisu(curriculum_no));
//        return returnMap;
        return classManagementDao.getCurriInfo(curriculum_no);
    }

    //날짜와 커리큘럼에 따라 수업일지 불러오는 코드
    public List<LectureReportVo> getLetureReportList(LectureReportVo lectureReportVo) {
        return lectureReportDao.getLetureReportList(lectureReportVo);
    }

    //수업일지를 저장이나 업데이트 하는 코드
    public int addLectureReport(LectureReportVo lectureReportVo) {
        String lectureReport_no = lectureReportVo.getClassDate().replace("-", "") + "-" + lectureReportVo.getCurriculum_no() + "-" + lectureReportVo.getPeriod();
        lectureReportVo.setLectureReport_no(lectureReport_no);
        if (!lectureReportVo.getSubject().equals("") || !lectureReportVo.getContent().equals("") || !lectureReportVo.getTeacher().equals("") || !lectureReportVo.getEtc().equals("")) {
            return lectureReportDao.addLetureReport(lectureReportVo);
        } else {
            return 0;
        }
    }

    //팀원선택 모달에 팀원 리스트를 불러오는 코드
    public List<UsersVo> getMemberNameList(int curriNo) {
        return projectDao.getMemberNameList(curriNo);
    }

    //커리큘럼에 따라 팀리스트를 불러오는 코드
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

    //프로젝트 상세정보를 불러오는 코드
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

    //이론평가탭 과정에 따라 과목리스트를 가져오는 코드
    public List<ScoreVo> getSubjectList(int curriNo) {
        return scoreDao.getSubjectList(curriNo);
    }

    //과목별 점수 리스트를 불러오는 코드
    public List<ScoreVo> getStudentInScoreList(ScoreVo scoreVo) {
        List<Integer> list = scoreDao.chkSisNo(scoreVo.getSubInStep_no());
        if (list.isEmpty()) {
            scoreVo.setSubInStep_no(0);
            List<ScoreVo> scoreVoList = scoreDao.getStudentInScoreList(scoreVo);
            for (ScoreVo aScoreVoList : scoreVoList) {
                aScoreVoList.setFileName("등록된 파일이 없습니다.");
            }
            return scoreVoList;
        }
        return scoreDao.getStudentInScoreList(scoreVo);
    }

    //학생관리 탭 학생정보를 불러오는 코드
    public List<UserInfoVo> getUserInfoList(int currino) {
        return userInfoDao.getUserInfoList(currino);
    }

    //프로젝트 상세정보를 저장 업데이트 하는 코드 파일업로드도 포함
    @Transactional
    public int addProjectDetail(MultipartHttpServletRequest multipartFile) {
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
//        System.out.println(projectVo.toString());
        String[] memberNo = multipartFile.getParameter("membersId").split(",");

        if (projectVo.getProject_no() == 0) {
            projectDao.addProjectDetail(projectVo);
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

    //이론평가 점수와 파일을 저장하는 코드
    @Transactional
    public int addScore(MultipartHttpServletRequest multipartFile) {
        ScoreVo scoreVo = new ScoreVo();
        FileUpload fileUpload = new FileUpload();
        int file_no;
        if (!multipartFile.getFile("studTestFile").isEmpty()) {
            String saveDir = directoryGenerator.DirectoryGenerator(multipartFile, "score");
            MultipartFile file = multipartFile.getFile("studTestFile");
            FileVo fileVo = fileUpload.saveScoreFile(file, saveDir);
            file_no = scoreDao.addScoreFile(fileVo);
        } else {
            file_no = 0;
        }
        int score_no = Integer.parseInt(multipartFile.getParameter("iScoreNo"));
        int score;
        if (multipartFile.getParameter("hScore").equals("")) {
            score = 0;
        } else {
            score = Integer.parseInt(multipartFile.getParameter("hScore"));
        }
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
            return scoreDao.addScore(scoreVo);
        } else {
            return scoreDao.updateScore(scoreVo);
        }
    }

    //이론평가 시험지를 저장하는 코드
    @Transactional
    public int addTest(MultipartHttpServletRequest multipartFile) {
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
                file_no = scoreDao.addScoreFile(fileVo);
            }
        } else {
            file_no = 0;
        }

        int testSisNo = Integer.parseInt(multipartFile.getParameter("testSisNo"));
        subInStepVo.setSubInStep_no(testSisNo);
        subInStepVo.setFile_no(file_no);
        if (file_no!=0) {
            return scoreDao.addTest(subInStepVo);
        } else {
            return 1;
        }
    }

    //이론평가탭에 학생별 파일이 있는지 찾는 코드
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

    //프로젝트 상세정보를 삭제하는 코드(실제 삭제는 안되고 state만 변경)
    public int delProjectDetail(int pjtNo) {
        return projectDao.delProjectDetail(pjtNo);
    }
}


