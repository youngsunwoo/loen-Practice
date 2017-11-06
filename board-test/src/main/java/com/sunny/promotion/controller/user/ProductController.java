package com.sunny.promotion.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.promotion.service.ProductService;
import com.sunny.promotion.vo.ProductVO;

@RestController
public class ProductController {
	

    @Autowired
    ProductService productService;
	
	
	 //전체 상품 List 가져오기 
    @RequestMapping(value="/getAllProductList", method = RequestMethod.GET)     
    public 	List<ProductVO> getAllProductList(HttpServletRequest request) throws Exception{    	
      	List<ProductVO> products = productService.getAllProductList();
        return products;
    }
    
    // 상품정보 가져오기 By Product_code
    @RequestMapping(value="/getProductInfo", method = RequestMethod.GET)     
    public ProductVO getProductInfo(HttpServletRequest request) throws Exception{    
    	
    		String product_code = request.getParameter("product_code");
    		
    		System.out.println("ProductController > getProductInfo > request.procudt_code > " + product_code);
    		
		System.out.println(productService.getProductInfo(product_code).toString());
		
      	ProductVO product = productService.getProductInfo(product_code);
      	
        return product;
    }
}
