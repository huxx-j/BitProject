package com.bitacademy.security;

import com.bitacademy.vo.AuthVo;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
//        System.out.println("AuthInterceptor");
        //3. 접근 제어
        HttpSession session = request.getSession();
        if( session == null ) {
            response.sendRedirect(request.getContextPath() + "/user/loginform" );
            return false;
        }

        AuthVo authUser = (AuthVo)session.getAttribute( "authUser" );
        if( authUser == null ) {
            response.sendRedirect(
                    request.getContextPath() + "/user/loginform" );
            return false;
        }

        //4. 인증된 사용자
        return true;
    }

//        return super.preHandle(request, response, handler);
}

