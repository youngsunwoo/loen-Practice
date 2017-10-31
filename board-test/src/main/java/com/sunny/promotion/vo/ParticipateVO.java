package com.sunny.promotion.vo;

import java.util.Date;

public class ParticipateVO {
	
	private String promoId;
	private String joinUserId;
	private String purchaseId;
	private Date   joinDate;
	private String joinFrom;
	
	public ParticipateVO() {
		super();
	}
	
	public ParticipateVO(String promoId) {
		super();
		this.promoId = promoId;
	}

	
	public ParticipateVO(String promoId, String joinUserId, String purchaseId, Date joinDate, String joinFrom) {
		super();
		this.promoId = promoId;
		this.joinUserId = joinUserId;
		this.purchaseId = purchaseId;
		this.joinDate = joinDate;
		this.joinFrom = joinFrom;
	}

	public String getPromoId() {
		return promoId;
	}

	public void setPromoId(String promoId) {
		this.promoId = promoId;
	}

	public String getJoinUserId() {
		return joinUserId;
	}

	public void setJoinUserId(String joinUserId) {
		this.joinUserId = joinUserId;
	}

	public String getPurchaseId() {
		return purchaseId;
	}

	public void setPurchaseId(String purchaseId) {
		this.purchaseId = purchaseId;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getJoinFrom() {
		return joinFrom;
	}

	public void setJoinFrom(String joinFrom) {
		this.joinFrom = joinFrom;
	}
	
	
}
