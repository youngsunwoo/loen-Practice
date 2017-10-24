package com.sunny.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.sunny.test.service.UserService;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.ProductVO;
import com.sunny.test.vo.PromotionVO;
import com.sunny.test.vo.UserVO;


@RestController
public class UserController {
	
	 @Autowired
	 UserService userService;
	 
	 
		// 로그인 화면
	    @RequestMapping("join")
	    public ModelAndView join() {
	            return new ModelAndView("Common/join_form");    
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
	    	
	        String id = request.getParameter("id");
    			String pw = request.getParameter("pw");
    			String pre_url = request.getHeader("referer");
 
    			final Map<String, Object> map = new HashMap<String, Object>();
    	        map.put("flagdata", userService.getUserByIdPwd ( id, pw, session));
    	        
    	        return map;
    	         		
	    }

	   
	 // 회원가입
	    @RequestMapping(value="joinProcess")//, method = RequestMethod.POST)
	    public Map<String, Object> joinProcess(HttpSession session, HttpServletRequest request) throws Exception{    
	    	
	        ModelAndView mav = new ModelAndView();
	        mav.setViewName("index");
	        
	       // String id = request.getParameter("id");
    			//String pw = request.getParameter("pw");
 
    			UserVO newUser = new UserVO("user3", "1234", "LOEN", 32, "1", 0);
    			
    			if(userService.insertUser(newUser) != 0) {
    				System.out.println("UserController > JoinProcess > inserUser Functiont : "+newUser.getUser_name());
    			}
    			
    			
    			 final Map<String, Object> map = new HashMap<String, Object>();
    	        map.put("flagdata", "");
    	        
    	        return map;
    	         		
	    }
	   

}
