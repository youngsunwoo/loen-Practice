package com.sunny.test.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.PurchaseMapper;
 
@Service
public class PurchaseService {
 
    @Autowired
    PurchaseMapper purchaseMapper;
 
    
    /* Insert Purchase Info to Database When User buy new product */
   /* public int insertPurchase() throws Exception{
    		return purchaseMapper.InsertPurchase();
    }
    */
    
}
