package com.kosmo.lingopos.userinfo;

public class UserinfoDTO {
	private String id;
	private String email;
	private String tel;
	private String region;
	private java.sql.Timestamp regidate;
	private int adminno;
	private String adminnick;
	private String ownerno;
	
	public String getOwnerno() {
		return ownerno;
	}
	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}
	public int getAdminno() {
		return adminno;
	}
	public String getAdminnick() {
		return adminnick;
	}
	public void setAdminno(int adminno) {
		this.adminno = adminno;
	}
	public void setAdminnick(String adminnick) {
		this.adminnick = adminnick;
	}
	public String getId() {
		return id;
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
