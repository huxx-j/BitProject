package com.bitacademy.service;

import com.bitacademy.dao.PackageDao;
import com.bitacademy.vo.*;
import org.apache.ibatis.jdbc.Null;
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

    public void stepadd(AllStepVo steplist) {
        List<StepInPackVo> steplist2 = steplist.getSteplist();
        int package_no=steplist2.get(0).getPackage_no();
        int Level=steplist2.get(0).getLevel();
        AllStepVo allStepVo = new AllStepVo();
        List<StepInPackVo> steplist3 =new ArrayList<StepInPackVo>();

        for (int i = 0; i < steplist2.size(); i++) {
            List<SubInStepVo> sublist = steplist2.get(i).getSublist();
            StepInPackVo stepInPackVo = new StepInPackVo();
            List<SubInStepVo> sublist1 =new ArrayList<SubInStepVo>();
            stepInPackVo.setStepName(steplist2.get(i).getStepName());
            stepInPackVo.setLevel(Level);
            Level++;
            stepInPackVo.setPackage_no(package_no);
            steplist3.add(stepInPackVo);
            int step=packageDao.insertstep(stepInPackVo);

            for (int k = 0; k < sublist.size(); k++) {
                if (sublist.get(k).getSubHour() != 0) {
                    sublist.get(k).setStep_no(step);
                    if(sublist.get(k).getStep_no()==0) {
                        packageDao.insertsub(sublist.get(k));
                    }
                    else{
                        packageDao.updateSub(sublist.get(k));
                    }
                }
            }
            stepInPackVo.setSublist(sublist1);
        }
        allStepVo.setSteplist(steplist3);
    }

    public List<PackageVo> getpacklist() {
        return packageDao.selectpacklist();
    }

    public PackageVo getpack(int no) {
        return packageDao.selectpackage(no);
    }

    public void addcate(PackageCateVo packageCateVo) {
        packageDao.addcate(packageCateVo);
    }

    public List<StepInPackVo> getstep(int no) {
        return  packageDao.getstep(no);
    }

    public void UpdateCate(SubjectCateVo subjectCateVo) {
         packageDao.UpdateCate(subjectCateVo);

    }
}

