package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.sunny.test.dao.PromoMapper;
import com.sunny.test.vo.BenefitVO;
 
@Service
public class PromoService {
 
    @Autowired
    PromoMapper promoMapper;
 
    /* select dual */
    public  List<BenefitVO>getBenefit(String promo_type, String benefit_code) throws Exception{
    	
    		Map<String, Object> para = new HashMap<String, Object>();
        para.put("promo_type", promo_type);
        para.put("benefit_code", benefit_code);
        
        return promoMapper.getBenefit(para);
    }
 
}
