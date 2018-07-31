package com.bitacademy.service;

import com.bitacademy.dao.SubjectDao;
//import com.bitacademy.vo.MaxdepthVo;
import com.bitacademy.vo.SubjectCateVo;
import com.bitacademy.vo.SubjectVo;
//import com.bitacademy.vo.TreeModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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

    public void UpdateCate(SubjectCateVo subjectCateVo) {
        if(subjectCateVo.getSubjectCate_no()>1000) {
            System.out.println(subjectCateVo.toString()+"ser");
            subjectDao.UpdateCate(subjectCateVo);
        }
        else if(subjectCateVo.getSubjectCate_no()<=1000){
            System.out.println(subjectCateVo.toString()+"ser");
            subjectDao.UpdateSubject(subjectCateVo);
        }

        //subjectDao.UpdateCate(subjectCateVo);

    }
    public List<SubjectVo> getsublist(){

        return subjectDao.selectsublist();
    }
//    public List<MaxdepthVo> getmdlist(){
//        return subjectDao.selectmdlist();
//    }
    public List<Integer> getnlist(){
        return subjectDao.selectnlist();
    }

//    public List<TreeModel> treeList() {
//
//        List<TreeModel> treeModel = new ArrayList<TreeModel>();
//
//        treeModel.add(new TreeModel("1", "0", "pNode 01", "true", null, null));
//        treeModel.add(new TreeModel("11", "1", "pNode 11", "true", null, null));
//        treeModel.add(new TreeModel("111","11","leaf 111(Naver)",null,null,"https://naver.com"));
//        treeModel.add(new TreeModel("112","11","leaf 112(Daum)",null,null,"http://daum.net"));
//        treeModel.add(new TreeModel("113","11","leaf 113(Google)",null,null,"google.co.kr"));
//        treeModel.add(new TreeModel("114","11","leaf 114(MSN)",null,null,"http://msn.com"));
//        treeModel.add(new TreeModel("12", "1", "pNode 12", null, null, null));
//        treeModel.add(new TreeModel("121", "12", "leaf node 121", null, null, null));
//        treeModel.add(new TreeModel("122", "12", "pleaf node 122", null, null, null));
//        treeModel.add(new TreeModel("123", "12", "leaf node 123", null, null, null));
//        treeModel.add(new TreeModel("124", "12", "leaf node 124", null, null, null));
//        treeModel.add(new TreeModel("13", "1", "pNode 13 - no child", null, "true", null));
//        treeModel.add(new TreeModel("2", "0", "pNode 02", null, null, null));
//        treeModel.add(new TreeModel("21", "2", "leaf node 21", null, null, null));
//        treeModel.add(new TreeModel("211", "21", "leaf node 211", null, null, null));
//        treeModel.add(new TreeModel("212", "21", "leaf node 212", null, null, null));
//        treeModel.add(new TreeModel("213", "21", "leaf node 213", null, null, null));
//        treeModel.add(new TreeModel("214", "21", "leaf node 214", null, null, null));
//        treeModel.add(new TreeModel("22", "2", "pNode 22", null, null, null));
//        treeModel.add(new TreeModel("221", "22", "leaf node 221", null, null, null));
//        treeModel.add(new TreeModel("222", "22", "leaf node 222", null, null, null));
//        treeModel.add(new TreeModel("223", "22", "leaf node 223", null, null, null));
//        treeModel.add(new TreeModel("224", "22", "leaf node 224", null, null, null));
//        treeModel.add(new TreeModel("23", "2", "pNode 23", null, null, null));
//        treeModel.add(new TreeModel("231", "23", "leaf node 231", null, null, null));
//        treeModel.add(new TreeModel("232", "23", "leaf node 232", null, null, null));
//        treeModel.add(new TreeModel("233", "23", "leaf node 233", null, null, null));
//        treeModel.add(new TreeModel("234", "23", "leaf node 234", null, null, null));
//        treeModel.add(new TreeModel("3", "0", "pNode 03 - no child", null, "true", null));
//        return treeModel;
//    }

    public SubjectVo getsub(int no) {
        return subjectDao.getsub(no);
    }

    public void addcate(SubjectCateVo subjectCateVo) {
        subjectDao.addcate(subjectCateVo);
    }
}
