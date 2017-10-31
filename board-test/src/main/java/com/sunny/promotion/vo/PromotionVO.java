package com.sunny.promotion.vo;

import java.util.Date;


public class PromotionVO {
	
	private String promo_id; // 생성일자_순번(4자리) (ex. 171019_0001)
	private Date create_date;
	private String user_id;
	private Date due_date; 
	private String state; //프로모션 상태 : 1-진행중, 2-강제종료, 3-기간만료종료 ;
	private String promo_type; // 1-나혼자 보상받기, 2-다같이 보상받기;
	private String benefit_code; // 01-할인쿠폰, 02-포인트정립...등;
	private String product_code; // 프로모션할 상품 코드 ;
	private String event_url;
	private String banner_path;
	private int join_cnt;
	
	

	public PromotionVO(){
		super();
	}
	

	
	public PromotionVO(String promo_id, Date create_date, String user_id, Date due_date, String state,
			String promo_type, String benefit_code, String product_code, String event_url, String banner_path,
			int join_cnt) {
		super();
		this.promo_id = promo_id;
		this.create_date = create_date;
		this.user_id = user_id;
		this.due_date = due_date;
		this.state = state;
		this.promo_type = promo_type;
		this.benefit_code = benefit_code;
		this.product_code = product_code;
		this.event_url = event_url;
		this.banner_path = banner_path;
		this.join_cnt = join_cnt;
	}
	
	
	
	@Override
	public String toString() {
		return "PromotionVO [promo_id=" + promo_id + ", create_date=" + create_date + ", user_id=" + user_id
				+ ", due_date=" + due_date + ", state=" + state + ", promo_type=" + promo_type + ", benefit_code="
				+ benefit_code + ", product_code=" + product_code + ", event_url=" + event_url + ", banner_path="
				+ banner_path + ", join_cnt=" + join_cnt + "]";
	}



	public PromotionVO(String promo_type, String benefit_code, String product_code) {
		super();
		this.promo_type = promo_type;
		this.benefit_code = benefit_code;
		this.product_code = product_code;
	}



	public String getPromo_id() {
		return promo_id;
	}
	public void setPromo_id(String promo_id) {
		this.promo_id = promo_id;
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
	public String getbanner_path() {
		return banner_path;
	}
	public void setbanner_path(String banner_path) {
		this.banner_path = banner_path;
	}
	public int getjoin_cnt() {
		return join_cnt;
	}
	public void setjoin_cnt(int join_cnt) {
		this.join_cnt = join_cnt;
	}
	
	
	

}
