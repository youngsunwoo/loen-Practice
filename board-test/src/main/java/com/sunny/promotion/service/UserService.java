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
    
    
    public boolean getUserByIdPwd(String id, String pw, HttpSession session) throws Exception{
    	
    	Map<String, Object> para = new HashMap<String, Object>();
        para.put("user_id", id);
        para.put("user_pw", pw);
        
        UserVO loginUser = userMapper.getUserByIdPwd(para);
        
        if (loginUser != null) {
        		session.setAttribute("LoginUser", loginUser);
            return true;
        }
        System.out.println("test");
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