package com.sunny.promotion.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.promotion.dao.UserMapper;
import com.sunny.promotion.vo.UserVO;

@Service
public class UserService {
 
    @Autowired
    UserMapper userMapper;
    
    
    public UserVO getUserById(String id) throws Exception{
    		return userMapper.getUserById(id);
	}
    
    
    public boolean getUserByIdPwd(String id, String pw, String flag, HttpSession session) throws Exception{
    	
    	Map<String, Object> para = new HashMap<String, Object>();
        para.put("userId", id);
        para.put("userPw", pw);
        para.put("userAuth", flag);
        UserVO user = userMapper.getUserByIdPwd(para);
        if (user != null) {

            System.out.println("flag>> "+ flag);
        		if ("0".equals(flag)) {
        	        System.out.println("loginUser>> "+ user.getUser_name());
        			session.setAttribute("LoginUser", user);
        		}else if("1".equals(flag)) {
        	        System.out.println("LoginAdmin>> "+ user.getUser_name());
        			session.setAttribute("LoginAdmin", user);
        		}
        		return true;
        }
        return false;
    }
    
    public int insertUser(UserVO user) throws Exception{
		return userMapper.insertUser(user);
    }
    
    //get Users who joined the Promotion By PromoId
    public List<UserVO> getParticipateUsersByPromoId(String Promoid) throws Exception{
		return userMapper.getParticipateUsersByPromoId(Promoid);
    }
    
}