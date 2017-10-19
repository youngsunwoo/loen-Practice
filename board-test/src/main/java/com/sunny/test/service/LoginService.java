package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.LoginMapper;
import com.sunny.test.vo.UserVO;
 
@Service
public class LoginService {
 
    @Autowired
    LoginMapper loginMapper;
 
    public boolean getUserByIdPwd(String id, String pw, HttpSession session) throws Exception{
    	
	Map<String, Object> para = new HashMap<String, Object>();
    para.put("user_id", id);
    para.put("user_pw", pw);
    
    UserVO loginUser = loginMapper.getUserByIdPwd(para);

    
    if (loginUser != null) {
    		session.setAttribute("LoginUser", loginUser);
        return true;
    }
    
    return false;
    
}

}
