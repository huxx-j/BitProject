package com.bitacademy.service;

import com.bitacademy.dao.SubjectDao;
import com.bitacademy.vo.MaxdepthVo;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubjectService {
    @Autowired
    private SubjectDao subjectDao;

    public void add(SubjectVo subjectVo){
        System.out.println(subjectVo.toString());
        subjectDao.insert(subjectVo);
    }
    public List<SubjectCateVo> getcatelist(){

        return subjectDao.selectcatelist();
    }
    public List<SubjectVo> getsublist(){

        return subjectDao.selectsublist();
    }
    public List<MaxdepthVo> getmdlist(){
        return subjectDao.selectmdlist();
    }
}
