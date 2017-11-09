package com.sunny.promotion;


import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.util.ObjectUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.sunny.promotion.vo.UserVO;

public class CertificationInterceptor implements HandlerInterceptor {
	
	   

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HandlerMethod handerMethod = (HandlerMethod)handler;
		
		Authentication auth = handerMethod.getMethod().getDeclaredAnnotation(Authentication.class);
	
		if(auth != null) { //어노테이션 선언한경우 
			String attrName = "";
			String destinationUrl = ""; 
			
			if(auth.type().equals("ADMIN")) {  
				attrName = "LoginAdmin";
				destinationUrl = "/admin/login";
			}
			else {
				attrName = "LoginUser";
				destinationUrl = "/login";
			}
			
			HttpSession session = request.getSession();
	        UserVO AuthUser = (UserVO) session.getAttribute(attrName);
	        
	        if(ObjectUtils.isEmpty(AuthUser)){
	        	
				System.out.println("redirect Login Page");
				
				if(isAjaxRequest(request)) {
					response.sendError(503); 
					return false;
				}
				
				request.setAttribute("destination", request.getRequestURI());
        			RequestDispatcher dispatcher = request.getRequestDispatcher(destinationUrl);
        			dispatcher.forward(request, response);

    				return false;

	        }
		}
			return true;
		
		/*
	    HttpSession session = request.getSession();
        UserVO loginVO = (UserVO) session.getAttribute("LoginUser");
        
        if(ObjectUtils.isEmpty(loginVO)){
        	
		         //PrintWriter out = response.getWriter();
		        	 //out.println("<script>alert('로그인이 필요한 메뉴입니다.'); history.go(-1);</script>");
		         //out.flush();
		         
		         //response.sendRedirect("/login");
	        		request.setAttribute("destination", request.getRequestURI());
	        		RequestDispatcher dispatcher = request.getRequestDispatcher("/login");
	        		dispatcher.forward(request, response);
	            return false;
        }else{        		//특정시간이 지나면 세션 만료 (초단위) 
            session.setMaxInactiveInterval(30*60);
        		return true;
        }
        */
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
	  private boolean isAjaxRequest(HttpServletRequest request) {
	        String ajaxHeader = "AJAX";
	        System.out.println("======= call /sessionIntercepter request.getHeader(ajaxHeader) : " + request.getHeader(ajaxHeader) + "=======");
	        return request.getHeader(ajaxHeader) != null && request.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
	    }



}
