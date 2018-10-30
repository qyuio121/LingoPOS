package com.kosmo.lingopos.reservedtable;

public class ReservedtableDTO {
	private int reserveno;
	private java.sql.Timestamp startdate;
	private int tableno;
	private int storeno;
	private String id;
	private int people;
	private String tel;
	private String storename;
	private String address;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getReserveno() {
		return reserveno;
	}
	public java.sql.Timestamp getStartdate() {
		return startdate;
	}
	public int getTableno() {
		return tableno;
	}
	public int getStoreno() {
		return storeno;
	}
	public String getId() {
		return id;
	}
	public int getPeople() {
		return people;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public void setStartdate(java.sql.Timestamp startdate) {
		this.startdate = startdate;
	}
	public void setTableno(int tableno) {
		this.tableno = tableno;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	
	
}
