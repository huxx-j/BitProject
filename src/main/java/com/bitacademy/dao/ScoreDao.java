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

    public List<ScoreVo> getSutudentInScore(ScoreVo scoreVo) {
        return sqlSession.selectList("score.getSutudentInScore", scoreVo);
    }

    public int saveScore(ScoreVo scoreVo) {
        return sqlSession.insert("score.saveScore", scoreVo);
    }

    public int saveScoreFile(FileVo fileVo) {
        sqlSession.insert("score.saveScoreFile", fileVo);
        return fileVo.getFile_no();
    }

    public List<Integer> chkSisNo(int subInStep_no) {
        return sqlSession.selectList("score.chkSisNo", subInStep_no);
    }

    public int updateScore(ScoreVo scoreVo) {
        return sqlSession.update("score.updateScore", scoreVo);
    }

    public int saveTest(SubInStepVo subInStepVo) {
        return sqlSession.update("score.saveTest", subInStepVo);
    }
}
