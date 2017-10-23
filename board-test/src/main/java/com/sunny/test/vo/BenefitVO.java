package com.sunny.test.vo;

public class BenefitVO {
	private int goal_cnt;
	private int offer;
	private String unit;
	
	public BenefitVO() {
		super();
	}
	
	public BenefitVO(int goal_cnt, int offer, String unit) {
		super();
		this.goal_cnt = goal_cnt;
		this.offer = offer;
		this.unit = unit;
	}
	
	@Override
	public String toString() {
		return "BenefitVO [goal_cnt=" + goal_cnt + ", offer=" + offer + ", unit=" + unit + "]";
	}

	public int getGoal_cnt() {
		return goal_cnt;
	}
	public void setGoal_cnt(int goal_cnt) {
		this.goal_cnt = goal_cnt;
	}
	public int getOffer() {
		return offer;
	}
	public void setOffer(int offer) {
		this.offer = offer;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	
	
	
}
