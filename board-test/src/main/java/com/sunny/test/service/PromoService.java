package com.sunny.test.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
import com.sunny.test.dao.PromoMapper;
import com.sunny.test.dao.PurchaseMapper;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.JoinListVO;
import com.sunny.test.vo.PromotionVO;
import com.sunny.test.vo.PurchaseVO;
import com.sunny.test.vo.UserVO;
 
@Service
public class PromoService {
 
    @Autowired
    PromoMapper promoMapper;
    
    @Autowired
    PurchaseMapper purchaseMapper;
 
    /* select dual */
    public  List<BenefitVO>getBenefit(String promo_type, String benefit_code) throws Exception{
    	
    		Map<String, Object> para = new HashMap<String, Object>();
        para.put("promo_type", promo_type);
        para.put("benefit_code", benefit_code);
        
        return promoMapper.getBenefit(para);
    }
    
    //프로모션 아이디로 상세정보 가져오기  
    public PromotionVO getPromotionById(String promo_id) throws Exception{
    		return promoMapper.getPromotionById(promo_id);
    }
    
    public PromotionVO insertPromotion(HttpSession session, String promo_type, String benefit_code, String product_code) throws Exception{
    	
    		PromotionVO promotion  = new PromotionVO();  
    		
    		promotion.setPromo_type(promo_type);
    		promotion.setBenefit_code(benefit_code);
    		promotion.setProduct_code(product_code);
    		
    		//현재 일자 구하기 (create_date)
	    	java.util.Date date = new java.util.Date(); 
	    	java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyMMdd"); 
	    	
	    	promotion.setCreate_date(date);
	    	
    		//해당일자의 max promorionId 구하기, +1 해서 신규 promorion_id 생성  (promorion Id)
	    	String insertDate = ymd.format(date) + '%';

	    String promoSeq = String.format("%03d", promoMapper.getMaxPromoId(insertDate));
	    String promotionId =  ymd.format(date) +"_"+promoSeq;	    
	    promotion.setPromo_id(promotionId);
	    	
    		//세션에서 user_id 가져오기 (user_id) 
	    UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	    
	    promotion.setUser_id(loginUser.getUser_id());
	    promotion.setDue_date(date);
	    
	    promotion.toString();
	    
	   int result = promoMapper.InsertPromotion(promotion);
	   if (result > 0) {
	   		return promotion;
	   }
	   return null;
    }
    
    
    public int JoinPromotion(HttpSession session, PurchaseVO purchase, JoinListVO join) throws Exception{
    		
    		//////////////////////////////////
    		// 		   구매내역 Insert	    	   //
    		//////////////////////////////////
    	
    		//구매 번호 가져오기  : 해당일자의 max PurchaseId 
     	java.util.Date date = new java.util.Date(); 
     	java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyMMdd"); 
     	String insertDate = ymd.format(date) + '%';
    	
     	String purchaseSeq = String.format("%03d", purchaseMapper.getMaxPurchaseId(insertDate));
	    String purchaseId =  ymd.format(date) +"_"+purchaseSeq;	   
	    purchase.setPurchaseId(purchaseId);
	    

	    purchase.setPurchaseDate(date);
    	
	    //로그인한 User정보받아오기 
	    UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	    String loginUserId = loginUser.getUser_id();
	    purchase.setUserId(loginUserId);
	    
	    
	    System.out.println(purchaseId);
    		//구매 내역 insert 
	    System.out.println("purchaseMapper.InsertPurchase(purchase) : " + purchaseMapper.InsertPurchase(purchase));

		//////////////////////////////////
		// 		   조인내역 Insert	    	   //
		//////////////////////////////////
	    
	    join.setJoinUserID(loginUserId);	    
	    join.setPurchaseId(purchaseId);
	    join.setJoinDate(date);
	    
	    promoMapper.InsertJoinList(join);

		//////////////////////////////////
		// 		   프로모션 Update	    	   //
		//////////////////////////////////
	    
	    promoMapper.UpdatePromotionJoinCnt(join.getPromoId());
    	
   		return 1;
}
 
}
