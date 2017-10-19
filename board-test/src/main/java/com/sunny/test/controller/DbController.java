package com.sunny.test.controller;

import java.io.IOException;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sunny.test.service.ProductService;
import com.sunny.test.service.PromoService;
import com.sunny.test.vo.BenefitVO;
import com.sunny.test.vo.ProductVO;
 
@RestController
public class DbController {
    
    @Autowired
    PromoService promoService;
    

    @Autowired
    ProductService productService;
    
    @RequestMapping(value="/")      
    public ModelAndView root() {
         return new ModelAndView("index");        
    }

    //프로모션만들기 ( 입력폼 )
    @RequestMapping(value="Promotion/makeNewPromotion")      
    public ModelAndView promo() {
        return new ModelAndView("Promotion/make_Promo");        
    }
    
    //프로모션 만들기 ( 저장 )
    @RequestMapping(value="/insertPromotion", method = RequestMethod.POST)      
    public ModelAndView insertPromotion(HttpServletRequest httpServletRequest) {
    	
    		String promo_type = httpServletRequest.getParameter("promo_type");
		String benefit_code = httpServletRequest.getParameter("benefit_code");
		String product_code = httpServletRequest.getParameter("benefit_code");
		
		System.out.println(">>insertPromotion >>> promo_type : " + promo_type + ",    benefit_code : " + benefit_code+",   product_code : "+ product_code);
		
		//promoService.insertPromotion(promo_type,benefit_code,product_code)
    	
        return new ModelAndView("Promotion/make_Promo");        
    }
    
    //베네핏가져오기
    @RequestMapping(value="/getBenefitList", method = RequestMethod.GET)     
    public 	List<BenefitVO> getbenefit(HttpServletRequest httpServletRequest) throws Exception{
    		
    		String promo_type = httpServletRequest.getParameter("promo_type");
    		String benefit_code = httpServletRequest.getParameter("benefit_code");
    	
    		System.out.println("promo_type : " + promo_type + ",    benefit_code : " + benefit_code);

      	List<BenefitVO> benefits = promoService.getBenefit(promo_type, benefit_code);
        return benefits;
    }
    
    //전체 상품 List 가져오기 
    @RequestMapping(value="/getAllProductList", method = RequestMethod.GET)     
    public 	List<ProductVO> getAllProductList(HttpServletRequest httpServletRequest) throws Exception{    	
      	List<ProductVO> products = productService.getAllProductList();
        return products;
    }
    
    // 상품정보 가져오기 By Product_code
    @RequestMapping(value="/getProductInfo", method = RequestMethod.GET)     
    public ProductVO getProductInfo(HttpServletRequest httpServletRequest) throws Exception{    
    	
    		String product_code = httpServletRequest.getParameter("product_code");
    		
		System.out.println(productService.getProductInfo(product_code).toString());
		
      	ProductVO product = productService.getProductInfo(product_code);
      	
        return product;
    }
}
