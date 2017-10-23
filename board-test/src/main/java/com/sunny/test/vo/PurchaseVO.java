package com.sunny.test.vo;

import java.sql.Date;

public class PurchaseVO {
	
	private String PurchaseId;
	private Date PurchaseDate;
	private String UserId;
	private String ProductCode;
	private String state;
	
	public PurchaseVO() {
		super();
	}
	
	public PurchaseVO(String purchaseId, Date purchaseDate, String userId, String productCode, String state) {
		super();
		PurchaseId = purchaseId;
		PurchaseDate = purchaseDate;
		UserId = userId;
		ProductCode = productCode;
		this.state = state;
	}

	public String getPurchaseId() {
		return PurchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		PurchaseId = purchaseId;
	}

	public Date getPurchaseDate() {
		return PurchaseDate;
	}

	public void setPurchaseDate(Date purchaseDate) {
		PurchaseDate = purchaseDate;
	}

	public String getUserId() {
		return UserId;
	}

	public void setUserId(String userId) {
		UserId = userId;
	}

	public String getProductCode() {
		return ProductCode;
	}

	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	

}
