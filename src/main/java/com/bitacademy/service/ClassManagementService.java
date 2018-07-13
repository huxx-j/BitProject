package com.bitacademy.service;

import com.bitacademy.dao.ClassManagementDao;
import com.bitacademy.dao.CurriculumDao;
import com.bitacademy.dao.GisuDao;
import com.bitacademy.dao.LectureReportDao;
import com.bitacademy.vo.CurriculumVo;
import com.bitacademy.vo.LectureReportVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public List<String> getWorkType() {
        return curriculumDao.getWorkType();
    }

    public List<CurriculumVo> getCurri(String workType) {
        return curriculumDao.getCurri(workType);
    }

    public Map<String, Object> getCurriInfo(int curriculum_no) {
        Map<String, Object> map = new HashMap<>();
        map.put("vo",curriculumDao.getCurriInfo(curriculum_no));
        map.put("gisu",gisuDao.getGisu(curriculum_no));
        return map;
    }

    public List<LectureReportVo> getLetureReport(LectureReportVo lectureReportVo) {
        return lectureReportDao.getLetureReport(lectureReportVo);
    }

    public String getDate() {
        return classManagementDao.getDate();
    }
}
