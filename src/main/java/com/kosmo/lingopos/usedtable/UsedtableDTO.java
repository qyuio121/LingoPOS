package com.kosmo.lingopos.usedtable;

public class UsedtableDTO {
	private int usedno;
	private java.sql.Timestamp startdate;
	private int tableno;
	private int people;
	private int storeno;
	public int getUsedno() {
		return usedno;
	}
	public java.sql.Timestamp getStartdate() {
		return startdate;
	}
	public int getTableno() {
		return tableno;
	}
	public int getPeople() {
		return people;
	}
	public int getStoreno() {
		return storeno;
	}
	public void setUsedno(int usedno) {
		this.usedno = usedno;
	}
	public void setStartdate(java.sql.Timestamp startdate) {
		this.startdate = startdate;
	}
	public void setTableno(int tableno) {
		this.tableno = tableno;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
}
