package com.sunny.promotion.vo;

import java.text.SimpleDateFormat;
import java.util.Date;


public class PromotionVO {
	
	private String promoId; // 생성일자_순번(4자리) (ex. 171019_0001)
	private Date createDate;
	private String userId;
	private Date dueDate; 
	private String state; //프로모션 상태 : 1-진행중, 2-강제종료, 3-기간만료종료 ;
	private String promoType; // 1-나혼자 보상받기, 2-다같이 보상받기;
	private String benefitCode; // 01-할인쿠폰, 02-포인트정립...등;
	private String productCode; // 프로모션할 상품 코드 ;
	private String eventUrl;
	private String bannerPath;
	private int joinCnt;
	
	
	@Override
	public String toString() {
		return "PromotionVO [promId=" + promoId + ", createDate=" + createDate + ", userId=" + userId + ", dueDate="
				+ dueDate + ", state=" + state + ", promoType=" + promoType + ", benefitCode=" + benefitCode
				+ ", productCode=" + productCode + ", eventUrl=" + eventUrl + ", bannerPath=" + bannerPath
				+ ", joinCnt=" + joinCnt + "]";
	}


	public PromotionVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public PromotionVO(String promId, Date createDate, String userId, Date dueDate, String state, String promoType,
			String benefitCode, String productCode, String eventUrl, String bannerPath, int joinCnt) {
		super();
		this.promoId = promId;
		this.createDate = createDate;
		this.userId = userId;
		this.dueDate = dueDate;
		this.state = state;
		this.promoType = promoType;
		this.benefitCode = benefitCode;
		this.productCode = productCode;
		this.eventUrl = eventUrl;
		this.bannerPath = bannerPath;
		this.joinCnt = joinCnt;
	}


	public String getPromoId() {
		return promoId;
	}


	public void setPromId(String promoId) {
		this.promoId = promoId;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		
		//SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//testObject.setCreationDate(df.parse("2010-06-06 13:20:15"));
		this.createDate = createDate;
		
		
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getDueDate() {
		return dueDate;
	}
	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPromoType() {
		return promoType;
	}
	public void setPromoType(String promoType) {
		this.promoType = promoType;
	}
	public String getBenefitCode() {
		return benefitCode;
	}
	public void setBenefitCode(String benefitCode) {
		this.benefitCode = benefitCode;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getEventUrl() {
		return eventUrl;
	}


	public void setEventUrl(String eventUrl) {
		this.eventUrl = eventUrl;
	}


	public String getBannerPath() {
		return bannerPath;
	}


	public void setBannerPath(String bannerPath) {
		this.bannerPath = bannerPath;
	}


	public int getJoinCnt() {
		return joinCnt;
	}


	public void setJoinCnt(int joinCnt) {
		this.joinCnt = joinCnt;
	}

	
}
	
	