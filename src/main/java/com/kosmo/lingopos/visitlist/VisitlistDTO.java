package com.kosmo.lingopos.visitlist;

public class VisitlistDTO {
	private int visitno;
	private String id;
	private int storeno;
	private java.sql.Timestamp visitdate;
	private String email;
	private String tel;
	private String storename;
	private String address;
	
	public String getStorename() {
		return storename;
	}
	public String getAddress() {
		return address;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getVisitno() {
		return visitno;
	}
	public void setVisitno(int visitno) {
		this.visitno = visitno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStoreno() {
		return storeno;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public java.sql.Timestamp getVisitdate() {
		return visitdate;
	}
	public void setVisitdate(java.sql.Timestamp visitdate) {
		this.visitdate = visitdate;
	}
	
	
}
