package com.sunny.test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sunny.test.vo.ProductVO;
import com.sunny.test.vo.UserVO;

public interface LoginMapper {
   /* DB Select  */

  //  public List<UserVO>getAllProductList()throws Exception; 
    
    public UserVO getUserByIdPwd(Map<String, Object> para)throws Exception; 
    
}

