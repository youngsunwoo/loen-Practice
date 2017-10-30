package com.sunny.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.test.Authentication;
import com.sunny.test.service.ProductService;
import com.sunny.test.service.PromoService;
import com.sunny.test.service.UserService;
import com.sunny.test.vo.ParticipateListVO;
import com.sunny.test.vo.PurchaseVO;
 
@RestController
public class ParticipateController {
    
    @Autowired
    PromoService promoService;
    
    @Autowired
    UserService userService;

    @Autowired
    ProductService productService;
 
   
    //Paticipate to Promotion
    //프로모션참여 정보 저장 
    @Authentication
    @RequestMapping(value="Promotion/PaticipatePromotion", method = RequestMethod.POST)   
    public ParticipateListVO joinPromotion(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		
		PurchaseVO purchase = new PurchaseVO(productCode);
    		ParticipateListVO participate = new ParticipateListVO(promoId);
		
    		return promoService.participatePromotion(request.getSession(), purchase, participate);
    }
    
    //Participate 전 가능 여부 확인 
    @RequestMapping(value="Promotion/checkAbailable", method = RequestMethod.POST)   
    public int checkAbailable(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
    		return promoService.checkAbailable(request.getSession(), productCode, promoId);
    }
    
   
    
    
   
}
