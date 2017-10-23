package com.sunny.test.dao;

import java.util.Map;

import com.sunny.test.vo.UserVO;

public interface UserMapper {
	
	  public UserVO getUserByIdPwd(Map<String, Object> para)throws Exception; 

	  public UserVO getUserById(String id)throws Exception; 

}
