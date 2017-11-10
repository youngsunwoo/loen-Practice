package com.sunny.promotion.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.sunny.promotion.service.PromoService;
import com.sunny.promotion.dao.ParticipateMapper;
import com.sunny.promotion.dao.PromoMapper;
import com.sunny.promotion.dao.PurchaseMapper;
import com.sunny.promotion.vo.BenefitVO;
import com.sunny.promotion.vo.ParticipateVO;
import com.sunny.promotion.vo.PromotionVO;
import com.sunny.promotion.vo.PurchaseVO;
import com.sunny.promotion.vo.UserVO;

 
@Service
public class ParticipateService {
 
    @Autowired
    PromoMapper promoMapper;
    
    @Autowired
    PurchaseMapper purchaseMapper;
    
    @Autowired
    ParticipateMapper participateMapper;
    
    @Autowired
    PromoService promoService;

    
    public int checkAbailable(HttpSession session, String productCd, String promotionId)  throws Exception{
    		
	  	UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	    		
	  	Map<String, Object> purchasePram = new HashMap<String, Object>();
	    		    
	 	purchasePram.put("userId", loginUser.getUser_id());
 	 	purchasePram.put("productCd", productCd);
 	 	
 		 	
 	 	int purchaseChk = purchaseMapper.getInfoByUseridProductcd(purchasePram);
 	 	

	  	Map<String, String> participatePram = new HashMap<String, String>();
	    		    
	  	participatePram.put("userId", loginUser.getUser_id());
	  	participatePram.put("promotionId", promotionId);
    		 
 	 	int participateChk = participateMapper.getInfoUseridPromoId(participatePram);
 	 	
 	 	System.out.println("purchaseChk ==> " + purchaseChk); 	 	
 	 	System.out.println("getInfoUseridPromoId ==> "+ participateChk);
   
    		//유효한 동일상품 구매내역, 해당 프로모션 참가이력이 없으면 
    		if(purchaseChk + participateChk == 0) {
    			return 0;
    		}//유효한 동일상품 구매 내역이 있는 경우 
    		else if (purchaseChk == 1 ) {
    			return 1;
    		}//프로모션 참가내역이 있는 경우 
    		else{
    			return 2;
    		}
    	
    }
   
    public ParticipateVO participatePromotion(HttpSession session, PurchaseVO purchase, ParticipateVO participate) throws Exception{
    		int result = 0;
    	
		//******************* 구매내역 Insert*******************//
    		//오늘 날짜 확인
     	java.util.Date date = new java.util.Date(); 
	    purchase.setPurchaseDate(date);
	    //구매 번호 가져오기  : 해당일자의 max PurchaseId 
     	java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyMMdd"); 
     	String insertDate = ymd.format(date) + '%';
     	String purchaseSeq = String.format("%03d", purchaseMapper.getMaxPurchaseId(insertDate));
	    String purchaseId =  ymd.format(date) +"_"+purchaseSeq;
	    purchase.setPurchaseId(purchaseId);
	    //로그인한 User정보받아오기 
	    UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	    String loginUserId = loginUser.getUser_id();
	    purchase.setUserId(loginUserId);
	    
	    //구매 내역 insert 
	    result += purchaseMapper.InsertPurchase(purchase);
	    System.out.println("result1 >> "+result);

		//******************* 조인내역 Insert*******************//
	    participate.setJoinUserId(loginUserId);	    
	    participate.setPurchaseId(purchaseId);
	    participate.setJoinDate(date);
	    
	    result  +=  participateMapper.InsertParticipateList(participate);
	    System.out.println("result2 >> "+result);

		//*******************프로모션 Cnt Update*******************//
	    	result +=  promoMapper.UpdatePromotionJoinCnt(participate.getPromoId());

		System.out.println("result3 >> "+result);
	    //프로모션 혜택 마지막 인원수 검색
	    if (result > 2) {
			    PromotionVO promotion = promoMapper.getPromotionById(participate.getPromoId());
			    List<BenefitVO> benefits = 	promoService.getBenefit(promotion.getPromoType(),   promotion.getBenefitCode());
			    int maxCnt = benefits.get(benefits.size()-1).getGoal_cnt();
			    
				    if  (maxCnt == promotion.getJoinCnt()) {
				     	result +=  promoMapper.terminatePromotion(participate.getPromoId());

					    System.out.println("result4 >> "+result);
				     	  if (result > 3) {
							    return participate;
				    			}
				     	  return null;
				    }
				    return participate;
		 }
		   
		   
	  return null;
}
 
    public List<Map<String, Object>> getParticipateUserInfo(String promotionId) throws Exception{
    		return participateMapper.getParticipateUserInfo(promotionId);
    }
    
    
    public List<Map<String, Object>> getParticipateListSearch(Map<String, String> param) throws Exception{
    		return participateMapper.getParticipateListSearch(param);
    }
    
}
