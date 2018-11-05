package com.kosmo.lingopos.login;

public class LoginDTO {
	private String id;
	private String ownerno;
	private String adminno;
	private String storeno;
	private boolean isallowed;
	
	public boolean isIsallowed() {
		return isallowed;
	}
	public void setIsallowed(boolean isallowed) {
		this.isallowed = isallowed;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}
	public String getAdminno() {
		return adminno;
	}
	public void setAdminno(String adminno) {
		this.adminno = adminno;
	}
	public String getStoreno() {
		return storeno;
	}
	public void setStoreno(String storeno) {
		this.storeno = storeno;
	}
}
