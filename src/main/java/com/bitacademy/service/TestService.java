package com.bitacademy.service;

import com.bitacademy.dao.TestDao;
import com.bitacademy.vo.PagerRequestVo;
import com.bitacademy.vo.PagerResponseVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
    @Autowired
    TestDao testDao;

    public PagerResponseVo getInfoList(int page, int rows, String sidx, String sord) {
        PagerResponseVo pagerResponseVo = new PagerResponseVo();
        int startNum = rows * (page-1);
        PagerRequestVo pagerRequestVo = new PagerRequestVo(page, rows, sidx, sord, startNum);
        int records = testDao.getRecords();
         pagerResponseVo.setPage(page);
         pagerResponseVo.setRecords(records);
         pagerResponseVo.setRows(testDao.getInfoList(pagerRequestVo));
         int total;
         if (records%rows !=0) {
             total = (records/rows) +1;
         } else {
             total = (records/rows);
         }
         pagerResponseVo.setTotal(total);
         return pagerResponseVo;


//        return testDao.getInfoList(pagerRequestVo);
    }
}
