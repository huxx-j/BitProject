package com.bitacademy.service;

import com.bitacademy.dao.LoginDao;
import com.bitacademy.vo.AuthVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginService {
    @Autowired
    private LoginDao loginDao;
    public AuthVo login(String id, String password) {
        Map<String, String> authMap = new HashMap<>();
        authMap.put("id", id);
        authMap.put("pw",password);
//        AuthVo authVo  = new AuthVo();
//        authVo.setLoginID(id);
//        authVo.setPassword(password);
        return loginDao.login(authMap);
    }
}
