package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.sunny.test.dao.PromoMapper;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.PromotionVO;
import com.sunny.test.vo.UserVO;
 
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
    
    
    public int insertTest() throws Exception{
    	
    		return promoMapper.insertTest();
    }
    
    public int insertPromotion(HttpSession session, String promo_type, String benefit_code, String product_code) throws Exception{
    	
    	
    		PromotionVO promotion  = new PromotionVO();  
    		
    		promotion.setPromo_type(promo_type);
    		promotion.setBenefit_code(benefit_code);
    		promotion.setProduct_code(product_code);
    		
    		//현재 일자 구하기 (create_date)
	    	java.util.Date date = new java.util.Date(); 
	    	java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    	java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyMMdd"); 
	    	String currentTime = sdf.format(date);
	    	
	    	promotion.setCreate_date(date);
	    	
    		//해당일자의 max promorionId 구하기, +1 해서 신규 promorion_id 생성  (promorion Id)
	    	String insertDate = ymd.format(date) + '%';
	    	
	    String promo_sqe = String.valueOf(promoMapper.getMaxPromoId(insertDate));
	    String promotion_id =  ymd.format(date) +"_"+promo_sqe;	    
	    promotion.setPromo_id(promotion_id);
	    	
    		//세션에서 user_id 가져오기 (user_id) 
	    UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	    
	    promotion.setUser_id(loginUser.getUser_id());
	    
	    
	    promotion.setDue_date(date);
	    
	    promotion.toString();
	    
	   return promoMapper.InsertPromotion(promotion);
}
 
}
