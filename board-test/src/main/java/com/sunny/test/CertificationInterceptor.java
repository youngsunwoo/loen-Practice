package com.sunny.test;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sunny.test.vo.UserVO;

public class CertificationInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	    HttpSession session = request.getSession();
        UserVO loginVO = (UserVO) session.getAttribute("LoginUser");
        
        if(ObjectUtils.isEmpty(loginVO)){
            response.sendRedirect("/login");
            return false;
        }else{
        		//특정시간이 지나면 세션 만료 (초단위) 
            session.setMaxInactiveInterval(30*60);
        		return true;
        }
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
