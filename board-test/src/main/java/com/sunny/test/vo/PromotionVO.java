package com.sunny.test.vo;

import java.util.Date;

import javax.print.attribute.standard.DateTimeAtCompleted;

public class PromotionVO {
	
	private String Promo_id; // 생성일자_순번(4자리) (ex. 171019_0001)
	private Date create_date;
	private String user_id;
	private Date due_date; 
	private String state; //프로모션 상태 : 1-진행중, 2-강제종료, 3-기간만료종료 ;
	private String promo_type; // 1-나혼자 보상받기, 2-다같이 보상받기;
	private String benefit_code; // 01-할인쿠폰, 02-포인트정립...등;
	private String product_code; // 프로모션할 상품 코드 ;
	private String event_url;
	private String banner_url;
	private int join_count;
	
	

	public PromotionVO(){}
	
	
	
	public PromotionVO(String Promo_id, Date create_date, String user_id, Date due_date, String state,
			String promo_type, String benefit_code, String product_code, String event_url, String banner_url,
			int join_count) {
		super();
		Promo_id = Promo_id;
		this.create_date = create_date;
		this.user_id = user_id;
		this.due_date = due_date;
		this.state = state;
		this.promo_type = promo_type;
		this.benefit_code = benefit_code;
		this.product_code = product_code;
		this.event_url = event_url;
		this.banner_url = banner_url;
		this.join_count = join_count;
	}
	
	
	
	public PromotionVO(String promo_type, String benefit_code, String product_code) {
		super();
		this.promo_type = promo_type;
		this.benefit_code = benefit_code;
		this.product_code = product_code;
	}



	public String getPromo_id() {
		return Promo_id;
	}
	public void setPromo_id(String Promo_id) {
		Promo_id = Promo_id;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPromo_type() {
		return promo_type;
	}
	public void setPromo_type(String promo_type) {
		this.promo_type = promo_type;
	}
	public String getBenefit_code() {
		return benefit_code;
	}
	public void setBenefit_code(String benefit_code) {
		this.benefit_code = benefit_code;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getEvent_url() {
		return event_url;
	}
	public void setEvent_url(String event_url) {
		this.event_url = event_url;
	}
	public String getBanner_url() {
		return banner_url;
	}
	public void setBanner_url(String banner_url) {
		this.banner_url = banner_url;
	}
	public int getJoin_count() {
		return join_count;
	}
	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}
	
	
	

}
