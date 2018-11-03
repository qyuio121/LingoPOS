package com.kosmo.lingopos.sale;

public class SaleDTO {
	private int salesno;
	private java.sql.Timestamp salesdate;
	private int salesprice;
	private int storeno;
	private String storename;
	
	
	public String getStorename() {
		return storename;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public int getSalesno() {
		return salesno;
	}
	public java.sql.Timestamp getSalesdate() {
		return salesdate;
	}
	public int getSalesprice() {
		return salesprice;
	}
	public int getStoreno() {
		return storeno;
	}
	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}
	public void setSalesdate(java.sql.Timestamp salesdate) {
		this.salesdate = salesdate;
	}
	public void setSalesprice(int salesprice) {
		this.salesprice = salesprice;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
}
