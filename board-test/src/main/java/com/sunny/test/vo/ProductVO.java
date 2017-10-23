package com.sunny.test.vo;

public class ProductVO {
	private String product_code;
	private String product_name;
	private int price;
	
	public ProductVO() {
		super();
	}
	
	public ProductVO(String product_code, String product_name, int price) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.price = price;
	}

	public String getProduct_code() {
		return product_code;
	}


	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getproduct_name() {
		return product_name;
	}

	public void setproduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
