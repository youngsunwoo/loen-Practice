package com.sunny.test.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sunny.test.service.ProductService;
import com.sunny.test.service.PromoService;
import com.sunny.test.service.UserService;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.JoinListVO;
import com.sunny.test.vo.ProductVO;
import com.sunny.test.vo.PromotionVO;
import com.sunny.test.vo.PurchaseVO;
import com.sunny.test.vo.UserVO;
 
@RestController
public class PromotionController {
    
    @Autowired
    PromoService promoService;
    
    @Autowired
    UserService userService;
    

    @Autowired
    ProductService productService;
    
    
    @RequestMapping(value="/")      
    public ModelAndView root() {
         return new ModelAndView("index");        
    }
    
    
    
    //The Form to make Promotion
    @RequestMapping(value="test")      
    public ModelAndView test() {
        return new ModelAndView("Promotion/promotion_form");        
    }
    
    
    
    
    @RequestMapping(value="/test1")      
    public ModelAndView test1() throws Exception{
    		ModelAndView mav = new ModelAndView();

		mav.setViewName("test");     
         return mav ;      
    }
    
    
    //The Form to make Promotion
    @RequestMapping(value="Promotion/FormNewPromotion")      
    public ModelAndView promo() {
        return new ModelAndView("Promotion/promotion_form");        
    }
    
    //Insert Promotion Information to Database
    @RequestMapping(value="Promotion/insertPromotion", method = RequestMethod.POST)      
    public PromotionVO MakeNewPromotion(HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
    		String promo_type = request.getParameter("promo_type");
		String benefit_code = request.getParameter("benefit_code");
		String product_code = request.getParameter("product_code");

		return promoService.insertPromotion(request.getSession(), promo_type, benefit_code, product_code);
		
    }
    
        
    //get(show) Promotion Detail Information
    @RequestMapping(value="Promotion/Detail", method = RequestMethod.GET)      
    public ModelAndView promoDetail(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		PromotionVO  promotion = promoService.getPromotionById(promotion_id);
    		UserVO ownUser = userService.getUserById(promotion.getUser_id());
    		ProductVO product = productService.getProductInfo(promotion.getProduct_code());
    		List<BenefitVO> benefits = promoService.getBenefit(promotion.getPromo_type(), promotion.getBenefit_code());
    		
    		mav.addObject("promotion",promotion);
    		mav.addObject("ownUser",ownUser);
    		mav.addObject("product",product);

    		String benefits_json = new Gson().toJson(benefits);
    		
    		System.out.println(benefits_json);
    		mav.addObject("benefits",benefits_json);
    		
    		mav.setViewName("Promotion/promotion_Detail");
    		
    		return mav;
        
    }
    
    
    //get(show) Promotion Detail Information
    @RequestMapping(value="Promotion/SharePopup", method = RequestMethod.GET)      
    public ModelAndView sharePopup(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		mav.addObject("promotion_id",promotion_id);
    		
    		mav.setViewName("Promotion/sharePopup");
    		
    		return mav;
        
    }
    
    
    
    
    
    //Join to Promotion
    @RequestMapping(value="Promotion/JoinPromotion", method = RequestMethod.POST)      
    public ModelAndView JoinPromotion(HttpServletRequest request) throws Exception{
    	
    		String productCode = request.getParameter("productCode");
		String promoId = request.getParameter("promoId");
		
    		PurchaseVO purchase = new PurchaseVO(productCode);
    		
    		JoinListVO join = new JoinListVO(promoId);
		
    		System.out.println("productCode : "+productCode);
    		System.out.println("promoId : "+promoId);
		promoService.JoinPromotion(request.getSession(), purchase, join);
	
        return new ModelAndView("Promotion/make_Promo");        
    }
    
    
    
    //get Users who joined the Promotion By PromoId
    @RequestMapping(value="Promotion/Detail/JoinList", method = RequestMethod.GET)      
    public ModelAndView getJoinUsersByPromoId(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		String promo_id = promotion_id;
    		
    		List<UserVO> joinUsers = userService.getJoinUsersByPromoId(promotion_id);
    		
    		mav.addObject("joinUsers",joinUsers);
    		mav.setViewName("Promotion/JoinList");
    		return mav;
        
    }
    
    
    //베네핏가져오기
    @RequestMapping(value="/getBenefitList", method = RequestMethod.GET)     
    public 	List<BenefitVO> getbenefit(HttpServletRequest request) throws Exception{
    		
    		String promo_type = request.getParameter("promo_type");
    		String benefit_code = request.getParameter("benefit_code");

      	List<BenefitVO> benefits = promoService.getBenefit(promo_type, benefit_code);
        return benefits;
    }
    
   
}
