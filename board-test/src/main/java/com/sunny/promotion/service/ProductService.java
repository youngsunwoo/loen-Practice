package com.sunny.promotion.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.promotion.dao.ProductMapper;
import com.sunny.promotion.vo.ProductVO;
 
@Service
public class ProductService {
 
    @Autowired
    ProductMapper productMapper;
 
    /* select All Product List */
    public  List<ProductVO>getAllProductList() throws Exception{
    	        return productMapper.getAllProductList();
    }
 
    public  ProductVO getProductInfo(String product_code) throws Exception{
        return productMapper.getProductInfo(product_code);
    }
}
