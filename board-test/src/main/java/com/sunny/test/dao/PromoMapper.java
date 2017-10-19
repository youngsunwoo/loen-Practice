package com.sunny.test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sunny.test.vo.BenefitVO;

public interface PromoMapper {
    /* DB Select  */

    
    public List<BenefitVO>getBenefit(Map<String, Object> para)throws Exception; //추가
 
}

