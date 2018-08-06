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

    //수업일지 붙러오는 코드
    public List<LectureReportVo> getLetureReportList(LectureReportVo lectureReportVo) {
        return sqlSession.selectList("lectureReport.getLectureReportList", lectureReportVo);
    }

    //수업일지 저장하는 코드
    public int addLetureReport(LectureReportVo lectureReportVo) {
        return sqlSession.insert("lectureReport.addLectureReport", lectureReportVo);
    }
}
