package com.bitacademy.service;

import com.bitacademy.dao.SubjectDao;
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
        subjectDao.insert(subjectVo);
    }


    public List<SubjectCateVo> getcatelist(){

        return subjectDao.selectcatelist();
    }

    public void UpdateCate(SubjectCateVo subjectCateVo) {
        if(subjectCateVo.getSubjectCate_no()>1000) {
            subjectDao.UpdateCate(subjectCateVo);
        }
        else if(subjectCateVo.getSubjectCate_no()<=1000){
            subjectDao.UpdateSubject(subjectCateVo);
        }

        //subjectDao.UpdateCate(subjectCateVo);

    }
    public List<SubjectVo> getsublist(){

        return subjectDao.selectsublist();
    }

    public List<Integer> getnlist(){
        return subjectDao.selectnlist();
    }

    public SubjectVo getsub(int no) {
        return subjectDao.getsub(no);
    }

    public void addcate(SubjectCateVo subjectCateVo) {
        subjectDao.addcate(subjectCateVo);
    }
}
