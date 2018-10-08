package com.kosmo.lingopos.user;

public class UserDTO {
	private String id;
	private String pwd;
	private String email;
	private String tel;
	private String region;
	private java.sql.Timestamp regidate;
	public String getId() {
		return id;
	}
	public String getPwd() {
		return pwd;
	}
	public String getEmail() {
		return email;
	}
	public String getTel() {
		return tel;
	}
	public String getRegion() {
		return region;
	}
	public java.sql.Timestamp getRegidate() {
		return regidate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public void setRegidate(java.sql.Timestamp regidate) {
		this.regidate = regidate;
	}
	
}
