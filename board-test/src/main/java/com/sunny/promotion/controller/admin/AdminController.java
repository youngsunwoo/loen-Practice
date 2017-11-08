package com.sunny.promotion.controller.admin;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sunny.promotion.dao.ParticipateMapper;
import com.sunny.promotion.service.ParticipateService;
import com.sunny.promotion.service.ProductService;
import com.sunny.promotion.service.PromoService;
import com.sunny.promotion.service.UserService;
import com.sunny.promotion.vo.BenefitVO;
import com.sunny.promotion.vo.ProductVO;
import com.sunny.promotion.vo.PromotionVO;
import com.sunny.promotion.vo.UserVO;

@RestController
public class AdminController {
	
    @Autowired
    PromoService promoService;
    
    @Autowired
    UserService userService;
    
    @Autowired
    ProductService productService;
    
    @Autowired
    ParticipateService participateService;
	
	//get(show) Promotion Detail Information
    //프로모션 상세페이지 출력 (parameter : 프로모션 ID)
    @RequestMapping(value="Admin/Promotion/Detail", method = RequestMethod.GET)      
    public ModelAndView promoDetail(@RequestParam String promoId, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		PromotionVO  promotion = promoService.getPromotionById(promoId); 			//프로모션정보
    		mav.addObject("promotion",promotion);
    		
    		UserVO ownUser = userService.getUserById(promotion.getUserId());					//프로모션생user정보 
    		mav.addObject("ownUser",ownUser);
    		
    		ProductVO product = productService.getProductInfo(promotion.getProductCode());	//상품정보 
    		mav.addObject("product",product);
    		
    		Gson gson = new Gson();
    		
    		//Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    		
    		List<BenefitVO> benefits = promoService.getBenefit(promotion.getPromoType(), promotion.getBenefitCode()); //혜택상세정보
    		String benefits_json = gson.toJson(benefits);
    		mav.addObject("benefits",benefits_json);
    		
    		List<Map<String, Object>> participate =  participateService.getParticipateUserInfo(promoId);
    		String participate_json = gson.toJson(participate);
    		
    		System.out.println(participate_json);
    		mav.addObject("participateList",participate_json);
    		
    		mav.setViewName("admin/AdminPromoDetail");
    		
    		return mav;
        
    }
    
    @RequestMapping(value="testAdmin")      
    public ModelAndView promotionForm() {
        return new ModelAndView("/admin/test");        
    }
    
    @RequestMapping(value="testAdmin2")      
    public ModelAndView test22() {
        return new ModelAndView("/admin/searchPromo");        
    }
    
    @RequestMapping(value="test2")      
    public ModelAndView test2() {
        return new ModelAndView("/admin/AdminPromoEdit2");        
    }
    
	@RequestMapping(value = "/admin/promotion/list.json", method = RequestMethod.POST)
	public List<PromotionVO> search(HttpServletRequest request , @RequestParam Map<String, String> param) throws Exception{  
		System.out.println("=== AdminController > seaerch (/admin/promotion/list.json) > params ================");
		
		Iterator<String> iterator = param.keySet().iterator();
		    while (iterator.hasNext()) {
		        String key = iterator.next();
		        System.out.print("key="+key);
		        System.out.println(" value="+param.get(key));
		    }
	  	List<PromotionVO> promotions = promoService.getPromotionList(param);
	  	System.out.println(promotions.get(1).getCreateDate());
	    return promotions;
	}
	
	
	@RequestMapping(value = "/admin/promotion/participateList.json", method = RequestMethod.POST)
	public List<Map<String, Object>>  participateList(HttpServletRequest request , @RequestParam Map<String, String> param) throws Exception{  
		System.out.println("=== AdminController > seaerch (/admin/promotion/participateList.json) > params ================");
		
		
	  	List<Map<String, Object>> parcitipations = participateService.getParticipateListSearch(param);
	 
	    return parcitipations;
	}


}
