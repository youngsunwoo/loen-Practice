package com.sunny.promotion.controller.user;

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

import com.sunny.promotion.service.UserService;
import com.sunny.promotion.vo.UserVO;


@RestController
public class UserController {
	
	 @Autowired
	 UserService userService; 
	 
		// 회원가입 화면 
	    @RequestMapping("join")
	    public ModelAndView join() {
	            return new ModelAndView("user/join_form");    
	    }
	    
	 	// 로그인 화면
	    @RequestMapping("login")
	    public ModelAndView login() {
	            return new ModelAndView("user/Login_form");    
	    }
	    
	    // 로그아웃
	    @RequestMapping("logout")
	    public String logout(HttpSession session) {
	        session.setAttribute("LoginUser", null);
	        return "redirect:login";
	    }
	    
	      
	    //로그인 처리
	    @RequestMapping(value="loginProcess", method = RequestMethod.GET)
	    public Map<String, Object> loginProcess(HttpSession session, HttpServletRequest request) throws Exception{    
	    	
	        String id = request.getParameter("id");
    			String pw = request.getParameter("pw");
    			String flag = request.getParameter("flag");
 
    			final Map<String, Object> map = new HashMap<String, Object>();
    	        map.put("flagdata", userService.getUserByIdPwd ( id, pw, flag, session));
    	        
    	        return map;
    	         		
	    }

	   
	    //회원가입
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
	   
	    //프로모션 참여자 정보 받기
	    //get Users who participated the Promotion By PromoId
	    @RequestMapping(value="Promotion/Detail/ParticipateList", method = RequestMethod.GET)      
	    public ModelAndView getJoinUsersByPromoId(@RequestParam String promotionId, HttpSession session) throws Exception{
	    		ModelAndView mav = new ModelAndView();

	    		List<UserVO> participateUsers = userService.getParticipateUsersByPromoId(promotionId);
	    		
	    		mav.addObject("joinUsers",participateUsers);
	    		mav.setViewName("Promotion/participateList");
	    		return mav;
	    }

}
