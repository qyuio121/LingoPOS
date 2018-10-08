package com.kosmo.lingopos.saleslist;

public class SaleslistDTO {
	private int listno;
	private String product;
	private int qty;
	private int price;
	private int salesno;
	public int getListno() {
		return listno;
	}
	public String getProduct() {
		return product;
	}
	public int getQty() {
		return qty;
	}
	public int getPrice() {
		return price;
	}
	public int getSalesno() {
		return salesno;
	}
	public void setListno(int listno) {
		this.listno = listno;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}
}
