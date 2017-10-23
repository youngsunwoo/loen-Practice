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
    @RequestMapping(value="Promotion/FormNewPromotion")      
    public ModelAndView promo() {
        return new ModelAndView("Promotion/make_Promo");        
    }
    
    //Insert Promotion Information to Database
    @RequestMapping(value="Promotion/insertPromotion", method = RequestMethod.POST)      
    public ModelAndView MakeNewPromotion(HttpServletRequest httpServletRequest) throws Exception{
    	
    		String promo_type = httpServletRequest.getParameter("promo_type");
		String benefit_code = httpServletRequest.getParameter("benefit_code");
		String product_code = httpServletRequest.getParameter("product_code");
		product_code = "00001";
					

			
		System.out.println("Controller > promo_type : "+ promo_type );
		
		promoService.insertPromotion(httpServletRequest.getSession(), promo_type, benefit_code, product_code);
	
        return new ModelAndView("Promotion/make_Promo");        
    }
    
        
    //get(show) Promotion Detail Information
    @RequestMapping(value="Promotion/Detail", method = RequestMethod.GET)      
    public ModelAndView promoDetail(@RequestParam String promotion_id, HttpSession session) throws Exception{
    		ModelAndView mav = new ModelAndView();

    		String promo_id = promotion_id;
    		PromotionVO  promotion = promoService.getPromotionById("171020_056");
    		UserVO ownUser = userService.getUserById(promotion.getUser_id());
    		ProductVO product = productService.getProductInfo(promotion.getProduct_code());
    		List<BenefitVO> benefits = promoService.getBenefit(promotion.getPromo_type(), promotion.getBenefit_code());
    		
    		System.out.println("프로모션아이디 : "+promotion.getPromo_id()+", 주최자아이디 : "+promotion.getUser_id());
    		System.out.println("주최자 이름 : "+ownUser.getUser_name()+", 상품명 : "+product.getproduct_name());

    		mav.addObject("promotion",promotion);
    		mav.addObject("ownUser",ownUser);
    		mav.addObject("benefits",benefits);
    		
    		mav.setViewName("test");
    		
    		return mav;
        
    }
    
    
    //Join to Promotion
    @RequestMapping(value="Promotion/JoinPromotion", method = RequestMethod.POST)      
    public ModelAndView JoinPromotion(HttpServletRequest httpServletRequest) throws Exception{
    	
    		String productCode = httpServletRequest.getParameter("productCode");
		String promoId = httpServletRequest.getParameter("promoId");
		
    		PurchaseVO purchase = new PurchaseVO(productCode);
    		
    		JoinListVO join = new JoinListVO(promoId);
		
    		System.out.println("productCode : "+productCode);
    		System.out.println("promoId : "+promoId);
		promoService.JoinPromotion(httpServletRequest.getSession(), purchase, join);
	
        return new ModelAndView("Promotion/make_Promo");        
    }
    
    
    //베네핏가져오기
    @RequestMapping(value="/getBenefitList", method = RequestMethod.GET)     
    public 	List<BenefitVO> getbenefit(HttpServletRequest httpServletRequest) throws Exception{
    		
    		String promo_type = httpServletRequest.getParameter("promo_type");
    		String benefit_code = httpServletRequest.getParameter("benefit_code");
    	
    		System.out.println("promo_type : " + promo_type + ",   benefit_code : " + benefit_code);

      	List<BenefitVO> benefits = promoService.getBenefit(promo_type, benefit_code);
        return benefits;
    }
    
   
}
