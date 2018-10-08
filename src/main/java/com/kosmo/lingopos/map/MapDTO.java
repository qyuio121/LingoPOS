package com.kosmo.lingopos.map;

public class MapDTO {
	private int mapno;
	private double x;
	private double y;
	private int storeno;
	private String img;
	private String storename;
	private String address;
	private String tel;
	private String bigkind;
	public int getMapno() {
		return mapno;
	}
	public double getX() {
		return x;
	}
	public double getY() {
		return y;
	}
	public int getStoreno() {
		return storeno;
	}
	public String getImg() {
		return img;
	}
	public String getStorename() {
		return storename;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public String getBigkind() {
		return bigkind;
	}
	public void setMapno(int mapno) {
		this.mapno = mapno;
	}
	public void setX(double x) {
		this.x = x;
	}
	public void setY(double y) {
		this.y = y;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setBigkind(String bigkind) {
		this.bigkind = bigkind;
	}
}
