package com.sunny.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.UserMapper;
import com.sunny.test.vo.UserVO;

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
        
        return false;
    }
    
    
    public List<UserVO> getJoinUsersByPromoId(String Promoid) throws Exception{
		return userMapper.getJoinUsersByPromoId(Promoid);
}
    
}