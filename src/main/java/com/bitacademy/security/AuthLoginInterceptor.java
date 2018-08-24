package com.bitacademy.security;

import com.bitacademy.service.LoginService;
import com.bitacademy.vo.AuthVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private LoginService loginService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

//        System.out.println("AuthLoginInterceptor");
        String id = request.getParameter( "id" );
        String password = request.getParameter( "password" );
//        System.out.println(id + " / " + password);
        // 데이터베이스에서 해당 UserVo 받아오기
        AuthVo authVo = loginService.login(id, password);

        // 이메일과 패쓰워드가 일치하지 않는 경우
        if( authVo == null ) {
            response.sendRedirect(request.getContextPath() + "/user/loginform?result=fail" );
            return false;
        } else {
            if(authVo.getAuthCode()!=1) {
                // 인증 처리
                HttpSession session = request.getSession( true );
                session.setAttribute( "authUser", authVo );
                response.sendRedirect(request.getContextPath()+"/"); //로그인이 되면 메인페이지로 보내줌

                return false;
            } else {
                response.sendRedirect(request.getContextPath() + "/user/loginform?result=noaccess" );
                return false;
            }
        }
    }
}

