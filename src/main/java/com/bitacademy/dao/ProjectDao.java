package com.bitacademy.dao;

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


    public List<UsersVo> getMemberName(int curriNo) {
        return sqlSession.selectList("project.getMemberName", curriNo);
    }

    public List<ProjectVo> getTeamList(int currival) {
        return sqlSession.selectList("project.getTeamList",currival);
    }

    public List<String> getTeamMemberList(int project_no) {
        return sqlSession.selectList("project.getTeamMemberList", project_no);
    }

    public ProjectVo getProjectDetail(int project_no) {
        return sqlSession.selectOne("project.getProjectDetail", project_no);
    }

    public List<String> getTeamMembersNo(int project_no) {
        return sqlSession.selectList("project.getTeamMembersNo", project_no);
    }

    public int updateProjectDetail(ProjectVo projectVo) {
        return sqlSession.update("project.updateProjectDetail", projectVo);
    }

    public int saveProjectDetail(ProjectVo projectVo) {
        return sqlSession.insert("project.saveProjectDetail", projectVo);
    }

    public int saveProjectMember(ProjectMemberVo projectMemberVo) {
        return sqlSession.insert("project.saveProjectMember", projectMemberVo);
    }

    public int deleteProjectMember(int project_no) {
        return sqlSession.delete("project.deleteProjectMember", project_no);
    }
}
