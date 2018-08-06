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

    //과목 리스트를 가져오는 코드
    public List<ScoreVo> getSubjectList(int curriNo) {
        return sqlSession.selectList("score.getSubjectList", curriNo);
    }

    //이론평가 학생점수 리스트를 가져오는 코드
    public List<ScoreVo> getStudentInScoreList(ScoreVo scoreVo) {
        return sqlSession.selectList("score.getStudentInScoreList", scoreVo);
    }

    //점수정보를 저장하는 코드
    public int addScore(ScoreVo scoreVo) {
        return sqlSession.insert("score.addScore", scoreVo);
    }

    //평가파일을 저장하는 코드
    public int addScoreFile(FileVo fileVo) {
        sqlSession.insert("score.addScoreFile", fileVo);
        return fileVo.getFile_no();
    }

    //선택한 과목이 신규작성인지 과거 작성이력이 있는지 확인하는 코드
    public List<Integer> chkSisNo(int subInStep_no) {
        return sqlSession.selectList("score.chkSisNo", subInStep_no);
    }

    //점수정보를 업데이트하는 코드
    public int updateScore(ScoreVo scoreVo) {
        return sqlSession.update("score.updateScore", scoreVo);
    }

    //시험지 파일정보를 저장하는 코드
    public int addTest(SubInStepVo subInStepVo) {
        return sqlSession.update("score.addTest", subInStepVo);
    }

    //평가파일 리스트를 가져오는 코드
    public List<FileVo> getSisInfo(int sisNo) {
        return sqlSession.selectList("score.getSisInfo", sisNo);
    }

    //평가파일 업데이트하는 코드
    public int updateScoreFile(FileVo fileVo) {
        return sqlSession.update("score.updateScoreFile", fileVo);
    }
}
