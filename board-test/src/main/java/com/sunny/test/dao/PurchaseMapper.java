package com.sunny.test.dao;

import com.sunny.test.vo.PurchaseVO;

public interface PurchaseMapper {
	
	   public int InsertPurchase(PurchaseVO p)throws Exception; //추가
	   
	   public int getMaxPurchaseId(String insert_date)throws Exception; //추가

}
