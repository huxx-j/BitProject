package com.bitacademy.service;

import com.bitacademy.dao.PackageDao;
import com.bitacademy.vo.PackageCateVo;
import com.bitacademy.vo.PackageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PackageService {
    @Autowired
    private PackageDao packageDao;

    public List<PackageCateVo> getcatelist(){
        return packageDao.selectcatelist();
    }
    public void add(PackageVo packageVo){
        packageDao.insert(packageVo);
    }

}
