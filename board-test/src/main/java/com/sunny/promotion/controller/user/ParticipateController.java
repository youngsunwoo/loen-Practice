package com.sunny.promotion.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.promotion.Authentication;
import com.sunny.promotion.service.ParticipateService;
import com.sunny.promotion.vo.ParticipateVO;
import com.sunny.promotion.vo.PurchaseVO;
 
@RestController
public class ParticipateController {
    
    @Autowired
    ParticipateService participateService;

    //Paticipate to Promotion
    //프로모션참여 정보 저장 
    @Authentication
    @RequestMapping(value="Promotion/PaticipatePromotion", method = RequestMethod.POST)   
    public ParticipateVO joinPromotion(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		String prehref = request.getParameter("prehref");

 	 	System.out.println("ParticipateService > checkAbailabl > productCode > "+productCode);
 	 	System.out.println("ParticipateService > checkAbailabl > promoId > "+promoId);
 	 	System.out.println("ParticipateService > checkAbailabl > prehref > "+prehref);
		
		PurchaseVO purchase = new PurchaseVO(productCode);
    		ParticipateVO participate = new ParticipateVO(promoId);
		
    		return participateService.participatePromotion(request.getSession(), purchase, participate);
    }
    
    //Participate 전 가능 여부 확인 
    @Authentication
    @RequestMapping(value="Promotion/checkAbailable", method = RequestMethod.POST)   
    public int checkAbailable(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		String prehref = request.getParameter("prehref");
		

 	 	System.out.println("ParticipateService > checkAbailabl > prehref > "+prehref);
		
    		return participateService.checkAbailable(request.getSession(), productCode, promoId);
    }
}
