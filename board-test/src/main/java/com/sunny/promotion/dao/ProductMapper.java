package com.sunny.promotion.dao;

import java.util.List;

import com.sunny.promotion.vo.ProductVO;

public interface ProductMapper {
    /* DB Select  */

    public List<ProductVO>getAllProductList()throws Exception; 
 
    
    public ProductVO getProductInfo(String product_code)throws Exception; 
}

