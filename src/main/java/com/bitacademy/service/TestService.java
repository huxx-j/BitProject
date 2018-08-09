package com.bitacademy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitacademy.dao.TestDao;
import com.bitacademy.vo.PagerRequestVo;
import com.bitacademy.vo.PagerResponseVo;

@Service
public class TestService {
    @Autowired
    TestDao testDao;

    public PagerResponseVo getInfoList(int page, int rows, String sidx, String sord) {
        PagerResponseVo pagerResponseVo = new PagerResponseVo(); //리턴할 데이터를 담을 Vo
        int startNum = rows * (page - 1); //페이지 첫글의 번호
        PagerRequestVo pagerRequestVo = new PagerRequestVo(); //쿼리를 돌리기 위한 Vo선언 및 데이터 셋팅
        int records = testDao.getRecords(); //데이터의 총 개수를 가져옴
        pagerResponseVo.setPage(page); //리턴할 Vo에 현재페이지 셋팅
        pagerResponseVo.setRecords(records); //리턴할 Vo에 데이터의 총 개수 셋팅
        pagerResponseVo.setRows(testDao.getInfoList(pagerRequestVo)); //리턴할 Vo에 데이터를 리스트형태로 셋팅
        int total; //페이지수 변수 선언
        if (records % rows != 0) { //페이지수 계산
            total = (records / rows) + 1; //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이 아닐때 int형의 결과에 1을 더해줌
        } else {
            total = (records / rows); //데이터의 총 개수와 한 페이지에 나열할 데이터의 개수를 나눴을때 나머지가 0이면 int형의 결과를 그대로 씀
        }
        pagerResponseVo.setTotal(total); //페이지수 셋팅
        return pagerResponseVo; //페이징을 사용하기 위해선 page, records, rows, total 4개의 데이터를 반드시 셋팅하고 리턴해야함

    }
}
