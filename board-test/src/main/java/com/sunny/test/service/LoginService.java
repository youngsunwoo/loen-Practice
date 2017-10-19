package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.LoginMapper;
import com.sunny.test.vo.UserVO;
 
@Service
public class LoginService {
 
    @Autowired
    LoginMapper loginMapper;
 
    public UserVO getUserByIdPwd(String id, String pw) throws Exception{
    	
	Map<String, Object> para = new HashMap<String, Object>();
    para.put("user_id", id);
    para.put("user_pw", pw);
    
    return loginMapper.getUserByIdPwd(para);
}

}
