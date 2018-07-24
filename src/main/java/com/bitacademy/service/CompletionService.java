package com.bitacademy.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.CompletionDao;
import com.bitacademy.vo.AfterServiceVo;
import com.bitacademy.vo.ApplyUserVo;
import com.bitacademy.vo.CurriculumVo;

@Service
public class CompletionService {

    @Autowired CompletionDao completionDao;

    public List<CurriculumVo> getFristWorkType(){


        return completionDao.getFristWorkType();
    }

    public List<CurriculumVo> getCurriList(String workType){


        return completionDao.getCurriList(workType);
    }

    public List<ApplyUserVo> search(int selectValue){

        return completionDao.search(selectValue);
    }

    public List<AfterServiceVo> afterServiceList(int user_no){

        return completionDao.afterServiceList(user_no);
    }

    public AfterServiceVo afterService_details(int afterService_no,int user_no) {

        Map<String,Integer> noMap = new HashMap<String,Integer>();
        noMap.put("afterService_no", afterService_no);
        noMap.put("user_no", user_no);

        return completionDao.afterService_details(noMap);
    }

}
