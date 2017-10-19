package com.sunny.test.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sunny.test.service.LoginService;
import com.sunny.test.service.PromoService;
import com.sunny.test.vo.UserVO;

@RestController
public class LoginController {
	
	 @Autowired
	 LoginService loginService;
	    
	 @RequestMapping("page1")
	    public String page1() {
	        return "page1";
	    }
	    // 세션 사용 안하는 화면
	    @RequestMapping("page2")
	    public String page2() {
	        return "page2";
	    }
	    // 로그인 화면
	    @RequestMapping("login")
	    public ModelAndView login() {
	            return new ModelAndView("Common/Login_form");    
	    }
	    // 로그아웃
	    @RequestMapping("logout")
	    public String logout(HttpSession session) {
	        session.setAttribute("LoginUser", null);
	        return "redirect:login";
	    }
	         
	    // 로그인 처리
	    @RequestMapping(value="loginProcess", method = RequestMethod.GET)
	    public Map<String, Object> loginProcess(HttpSession session, HttpServletRequest request) throws Exception{    
	    	
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("Login_OK_TEST");
	        
	        String id = request.getParameter("id");
    			String pw = request.getParameter("pw");
    			String pre_url = request.getHeader("referer");
 
    			final Map<String, Object> map = new HashMap<String, Object>();
    	        map.put("flagdata", loginService.getUserByIdPwd ( id, pw, session));
    	        
    	        return map;
    	         		
	    }
	
	   
	
}
