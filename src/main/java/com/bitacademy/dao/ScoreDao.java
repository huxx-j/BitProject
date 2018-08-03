package com.bitacademy.dao;

import com.bitacademy.vo.FileVo;
import com.bitacademy.vo.ScoreVo;
import com.bitacademy.vo.SubInStepVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ScoreDao {
    @Autowired
    SqlSession sqlSession;

    public List<ScoreVo> getSubjectList(int curriNo) {
        return sqlSession.selectList("score.getSubjectList", curriNo);
    }

    public List<ScoreVo> getStudentInScoreList(ScoreVo scoreVo) {
        return sqlSession.selectList("score.getStudentInScoreList", scoreVo);
    }

    public int addScore(ScoreVo scoreVo) {
        return sqlSession.insert("score.addScore", scoreVo);
    }

    public int addScoreFile(FileVo fileVo) {
        sqlSession.insert("score.addScoreFile", fileVo);
        return fileVo.getFile_no();
    }

    public List<Integer> chkSisNo(int subInStep_no) {
        return sqlSession.selectList("score.chkSisNo", subInStep_no);
    }

    public int updateScore(ScoreVo scoreVo) {
        return sqlSession.update("score.updateScore", scoreVo);
    }

    public int addTest(SubInStepVo subInStepVo) {
        return sqlSession.update("score.addTest", subInStepVo);
    }

    public List<FileVo> getSisInfo(int sisNo) {
        return sqlSession.selectList("score.getSisInfo", sisNo);
    }

    public int updateScoreFile(FileVo fileVo) {
        return sqlSession.update("score.updateScoreFile", fileVo);
    }
}
