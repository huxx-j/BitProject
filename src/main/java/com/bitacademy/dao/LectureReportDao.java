package com.bitacademy.dao;

import com.bitacademy.vo.LectureReportVo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LectureReportDao {
    @Autowired
    SqlSession sqlSession;

    public List<LectureReportVo> getLetureReport(LectureReportVo lectureReportVo) {
        return sqlSession.selectList("lectureReport.getLectureReport", lectureReportVo);
    }

    public int saveLetureReport(LectureReportVo lectureReportVo) {
        return sqlSession.insert("lectureReport.saveLectureReport", lectureReportVo);
    }
}
