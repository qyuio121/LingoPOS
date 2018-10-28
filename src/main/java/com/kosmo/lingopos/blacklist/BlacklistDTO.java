package com.kosmo.lingopos.blacklist;

public class BlacklistDTO {
	private int storeno;
	private String id;
	private int blackno;
	private String reason;
	private java.sql.Timestamp blackdate;
	private String email;
	private String tel;
	private String storename;
	private boolean added;
	
	
	public boolean isAdded() {
		return added;
	}
	public void setAdded(boolean added) {
		this.added = added;
	}
	public String getEmail() {
		return email;
	}
	public String getTel() {
		return tel;
	}
	public String getStorename() {
		return storename;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
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
}
