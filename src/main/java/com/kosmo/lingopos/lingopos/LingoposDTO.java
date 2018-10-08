package com.kosmo.lingopos.lingopos;

public class LingoposDTO {
	private int posno;
	private java.sql.Timestamp productiondate;
	private java.sql.Timestamp outdate;
	
	public int getPosno() {
		return posno;
	}
	public java.sql.Timestamp getProductiondate() {
		return productiondate;
	}
	public java.sql.Timestamp getOutdate() {
		return outdate;
	}
	public void setPosno(int posno) {
		this.posno = posno;
	}
	public void setProductiondate(java.sql.Timestamp productiondate) {
		this.productiondate = productiondate;
	}
	public void setOutdate(java.sql.Timestamp outdate) {
		this.outdate = outdate;
	}
	
}
