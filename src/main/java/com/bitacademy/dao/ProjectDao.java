package com.bitacademy.dao;

import com.bitacademy.vo.FileVo;
import com.bitacademy.vo.ProjectMemberVo;
import com.bitacademy.vo.ProjectVo;
import com.bitacademy.vo.UsersVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ProjectDao {
    @Autowired
    SqlSession sqlSession;

    //팀원선택에 학생정보 가져오는 코드
    public List<UsersVo> getMemberNameList(int curriNo) {
        return sqlSession.selectList("project.getMemberNameList", curriNo);
    }

    //프로젝트 팀 리스트를 가져오는 코드
    public List<ProjectVo> getTeamList(int currival) {
        return sqlSession.selectList("project.getTeamList",currival);
    }

    //팀 멤버 리스트를 가져오는 코드
    public List<String> getTeamMemberList(int project_no) {
        return sqlSession.selectList("project.getTeamMemberList", project_no);
    }

    //프로젝트 상세정보 가져오는 코드
    public ProjectVo getProjectDetail(int project_no) {
        return sqlSession.selectOne("project.getProjectDetail", project_no);
    }

    //프로젝트 팀 멤버들의 유저번호를 가져오는 코드
    public List<String> getTeamMembersNo(int project_no) {
        return sqlSession.selectList("project.getTeamMembersNo", project_no);
    }

    //프로젝트 상세정보를 업데이트하는 코드
    public int updateProjectDetail(ProjectVo projectVo) {
        return sqlSession.update("project.updateProjectDetail", projectVo);
    }

    //프로젝트 상세정보를 저장하는코드
    public int addProjectDetail(ProjectVo projectVo) {
        return sqlSession.insert("project.addProjectDetail", projectVo);
    }

    //프로젝트 멤버를 저장하는 코드
    public int saveProjectMember(ProjectMemberVo projectMemberVo) {
        return sqlSession.insert("project.saveProjectMember", projectMemberVo);
    }

    //프로젝트 멤버를 지우는 코드
    public int deleteProjectMember(int project_no) {
        return sqlSession.delete("project.deleteProjectMember", project_no);
    }

    //프로젝트 파일을 저장하는 코드
    public int saveProjectFile(FileVo fileVo) {
        sqlSession.insert("project.saveProjectFile", fileVo);
        return fileVo.getFile_no();
    }

    //파일이름을 가져오는 코드
    public String getFileName(int file_no) {
        return sqlSession.selectOne("project.getFileName", file_no);
    }

    //파일정보를 업데이트하는 코드
    public int updateProjectFile(FileVo fileVo) {
        return sqlSession.update("project.updateProjectFile", fileVo);
    }

    //프로젝트 상세정보를 삭제하는 코드(실제 삭제는 안되고 state만 변경)
    public int delProjectDetail(int pjtNo) {
        return sqlSession.update("project.delProjectDetail", pjtNo);
    }
}
