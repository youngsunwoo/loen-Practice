package com.sunny.test.dao;

import java.util.List;

import com.sunny.test.vo.ProductVO;

public interface ProductMapper {
    /* DB Select  */

    public List<ProductVO>getAllProductList()throws Exception; 
 
    
    public ProductVO getProductInfo(String product_code)throws Exception; 
}

