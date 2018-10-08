package com.kosmo.lingopos.blacklist;

public class BlacklistDTO {
	private int storeno;
	private String id;
	private int blackno;
	private String reason;
	private java.sql.Timestamp blackdate;
	private boolean added;
	public int getStoreno() {
		return storeno;
	}
	public String getId() {
		return id;
	}
	public int getBlackno() {
		return blackno;
	}
	public String getReason() {
		return reason;
	}
	public java.sql.Timestamp getBlackdate() {
		return blackdate;
	}
	public boolean isAdded() {
		return added;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setBlackno(int blackno) {
		this.blackno = blackno;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public void setBlackdate(java.sql.Timestamp blackdate) {
		this.blackdate = blackdate;
	}
	public void setAdded(boolean added) {
		this.added = added;
	}
}
