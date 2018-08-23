package com.bitacademy.service;

import com.bitacademy.dao.PackageDao;
import com.bitacademy.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PackageService {
    @Autowired
    private PackageDao packageDao;

    public List<StepInPackVo> getsublist(List<StepInPackVo> steplist) {
        for (int i = 0; i < steplist.size(); i++) {
             steplist.get(i).setSublist(packageDao.getsublist((steplist.get(i).getStep_no())));
        }
        return steplist;
    }
    public List<PackageCateVo> getcatelist() {
        return packageDao.selectcatelist();
    }

    public int addPackage(PackageVo packageVo) {
        return packageDao.insert(packageVo);
    }

    //화면에서 넘어온 단계, 과목 정보를 정렬해서 담아주는 코드(삭제후 삽입 진행)
    public void stepadd(AllStepVo steplist) {
        List<StepInPackVo> steplist2 = steplist.getSteplist();
        int package_no = steplist2.get(0).getPackage_no();
        for (int k = 0; k < steplist2.size(); k++) {
           packageDao.deleteSubInStep(steplist2.get(k).getStep_no());
       }
        packageDao.deleteStepInPack(package_no);
        int Level=steplist2.get(0).getLevel();
        AllStepVo allStepVo = new AllStepVo();
        List<StepInPackVo> steplist3 =new ArrayList<StepInPackVo>();

        for (int i = 0; i < steplist2.size(); i++) {
            if (steplist2.get(i).getLevel() != 0) {
                List<SubInStepVo> sublist = steplist2.get(i).getSublist();
                StepInPackVo stepInPackVo = new StepInPackVo();
                List<SubInStepVo> sublist1 = new ArrayList<SubInStepVo>();
                stepInPackVo.setStepName(steplist2.get(i).getStepName());
                stepInPackVo.setLevel(Level);
                Level++;
                stepInPackVo.setPackage_no(package_no);

                int step = packageDao.insertstep(stepInPackVo);

                for (int k = 0; k < sublist.size(); k++) {
                    if (sublist.get(k).getSubHour() != 0) {
                        sublist.get(k).setStep_no(step);
                        packageDao.insertsub(sublist.get(k));
                        sublist1.add(sublist.get(k));
                    }
                }
                stepInPackVo.setSublist(sublist1);
                steplist3.add(stepInPackVo);
            }
        }
        allStepVo.setSteplist(steplist3);
        System.out.println(allStepVo);
    }

    public List<PackageVo> getpacklist() {
        return packageDao.selectpacklist();
    }

    public PackageVo getpack(int no) {
        PackageVo packageVo=packageDao.selectpackage(no);
        packageVo.setReferenceCnt(packageDao.getReferenceCnt(no));
        PackageCateVo packageCateVo=packageDao.getPackCate(packageVo.getPackageCate_no());
        packageVo.setCateName(packageCateVo.getCateName());
        return packageVo;
    }

    public void addcate(PackageCateVo packageCateVo) {
        packageDao.addcate(packageCateVo);
    }

    public List<StepInPackVo> getstep(int no) {
        return  packageDao.getstep(no);
    }

    public void UpdateCate(PackageCateVo packageCateVo) {
         packageDao.UpdateCate(packageCateVo);

    }
    public void delCate(int id) {
        packageDao.delCate(id);
        packageDao.delChildCate(id);
    }
    public PackageCateVo getPackCate(int no) {
        return packageDao.getPackCate(no);
    }

    public void delPackage(int no) { packageDao.delPackage(no);
    }
//
//    public void deleteSubInPack(int no) {
//        packageDao.deleteSubInPack(no);
//    }
}

