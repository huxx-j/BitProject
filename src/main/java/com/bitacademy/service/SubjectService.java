package com.bitacademy.service;

import com.bitacademy.dao.SubjectDao;
import com.bitacademy.vo.PackageCateVo;
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
        System.out.println(subjectVo);
        if(subjectVo.getSubject_no()==0) {
            subjectDao.insert(subjectVo);
        }
        else{
            subjectDao.UpdateSubject(subjectVo);
        }
    }


    public List<SubjectCateVo> getcatelist(){

        return subjectDao.selectcatelist();
    }

    public void UpdateCate(SubjectCateVo subjectCateVo) {
        if(subjectCateVo.getSubjectCate_no()>1000) {
            subjectDao.UpdateCate(subjectCateVo);
        }
        else if(subjectCateVo.getSubjectCate_no()<=1000){
            subjectDao.UpdateSubjectPid(subjectCateVo);
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

    public void delSubject(int no) {
        subjectDao.delSubject(no);
    }

    public void delCate(int id) {
        subjectDao.delCate(id);
        subjectDao.delChildCate(id);
        subjectDao.delChildSubject(id);
    }

    public SubjectCateVo getSubCate(int no) {
        return subjectDao.getSubCate(no);
    }

    public void updateSubject(SubjectVo subjectVo) {
        subjectDao.updateSubject(subjectVo);
    }

}
