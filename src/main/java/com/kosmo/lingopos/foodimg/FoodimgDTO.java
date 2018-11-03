package com.kosmo.lingopos.foodimg;

public class FoodimgDTO {
	private String img;
	private int imgno;
	private int storeno;
	private String name;
	private int price;
	private int count;
	private String storename;
	
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getImg() {
		return img;
	}
	public int getImgno() {
		return imgno;
	}
	public int getStoreno() {
		return storeno;
	}
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public int getCount() {
		return count;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setImgno(int imgno) {
		this.imgno = imgno;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
