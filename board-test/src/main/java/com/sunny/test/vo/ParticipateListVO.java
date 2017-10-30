package com.sunny.test.vo;

import java.util.Date;

public class ParticipateListVO {
	
	private String PromoId;
	private String JoinUserID;
	private String PurchaseId;
	private Date   JoinDate;
	private String JoinFrom;
	
	public ParticipateListVO() {
		super();
	}
	
	public ParticipateListVO(String promoId) {
		super();
		PromoId = promoId;
	}

	
	public ParticipateListVO(String promoId, String joinUserID, String purchaseId, Date joinDate, String joinFrom) {
		super();
		PromoId = promoId;
		JoinUserID = joinUserID;
		PurchaseId = purchaseId;
		JoinDate = joinDate;
		JoinFrom = joinFrom;
	}

	public String getPromoId() {
		return PromoId;
	}

	public void setPromoId(String promoId) {
		PromoId = promoId;
	}

	public String getJoinUserID() {
		return JoinUserID;
	}

	public void setJoinUserID(String joinUserID) {
		JoinUserID = joinUserID;
	}

	public String getPurchaseId() {
		return PurchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		PurchaseId = purchaseId;
	}

	public Date getJoinDate() {
		return JoinDate;
	}

	public void setJoinDate(Date joinDate) {
		JoinDate = joinDate;
	}

	public String getJoinFrom() {
		return JoinFrom;
	}

	public void setJoinFrom(String joinFrom) {
		JoinFrom = joinFrom;
	}
	
	
}
