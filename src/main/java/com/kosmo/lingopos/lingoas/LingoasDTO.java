package com.kosmo.lingopos.lingoas;

public class LingoasDTO {
	private java.sql.Timestamp asdate;
	private int asno;
	private String reason;
	private boolean ispaid;
	private int asprice;
	private int posno;
	public java.sql.Timestamp getAsdate() {
		return asdate;
	}
	public int getAsno() {
		return asno;
	}
	public String getReason() {
		return reason;
	}
	public boolean isIspaid() {
		return ispaid;
	}
	public int getAsprice() {
		return asprice;
	}
	public int getPosno() {
		return posno;
	}
	public void setAsdate(java.sql.Timestamp asdate) {
		this.asdate = asdate;
	}
	public void setAsno(int asno) {
		this.asno = asno;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setIspaid(boolean ispaid) {
		this.ispaid = ispaid;
	}
	public void setAsprice(int asprice) {
		this.asprice = asprice;
	}
	public void setPosno(int posno) {
		this.posno = posno;
	}
	
	
}
