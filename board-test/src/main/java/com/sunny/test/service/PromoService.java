package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.sunny.test.dao.PromoMapper;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.PromotionVO;
 
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
    
    public  Boolean insertPromotion(String promo_type, String benefit_code, String procudt_code) throws Exception{
    	
    		//실행일자 구하기 (create_date)
    	
    		//해당일자의 max promorionId 구하기, +1 해서 신규 promorion_id 생 (promorion Id)
    	
    		//세션에서 user_id 가져오기 (user_id) 
    	
    		//due_date, state는 고정값으로 insert문에서 제어가능
    		//사실 max ID도 가능함
    	
    		//여기서 만들어서 다같이 객체로 쿼리에 넘겨버릴까? 
    		//받아온값들만 넘기고 쿼리에서 제어해서 저장할까? 
    		//          ㄴ> 넘길때 (1) 객체를 넘길까? (2) 맵을 생성새 넘길까?
    	 	//                        ㄴ> 생성자를 써야하나 setter를 써야하나..   
    	
    		//
    		//PromotionVO promotion = new PromotionVO();
    		
    		
    
		return true;
		//PromoMapper.getBenefit(para);
}
 
}
