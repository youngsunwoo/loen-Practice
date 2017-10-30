package com.sunny.test.service;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.test.dao.PurchaseMapper;
import com.sunny.test.vo.PurchaseVO;
import com.sunny.test.vo.UserVO;
 
@Service
public class PurchaseService {
 
    @Autowired
    PurchaseMapper purchaseMapper;
 
    /*
    public int insertPurchase(HttpSession session, PurchaseVO purchase) throws Exception{
    	
    
	//구매 번호 가져오기  : 해당일자의 max PurchaseId 
	java.util.Date date = new java.util.Date(); 
	java.text.SimpleDateFormat ymd = new java.text.SimpleDateFormat("yyMMdd"); 
	String insertDate = ymd.format(date) + '%';

	String purchaseSeq = String.format("%03d", purchaseMapper.getMaxPurchaseId(insertDate));
	String purchaseId =  ymd.format(date) +"_"+purchaseSeq;	   
	purchase.setPurchaseId(purchaseId);
	
	
	purchase.setPurchaseDate(date);
	
	//로그인한 User정보받아오기 
	UserVO loginUser = (UserVO) session.getAttribute("LoginUser");
	String loginUserId = loginUser.getUser_id();
	purchase.setUserId(loginUserId);
	
	
	System.out.println("PurchaseService > insertPurchase > purchaseId" +  purchaseId);
	
	return purchaseMapper.InsertPurchase(purchase);
	
	
	}
    */
   
    
}
