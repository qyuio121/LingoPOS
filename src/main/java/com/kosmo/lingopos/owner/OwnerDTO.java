package com.kosmo.lingopos.owner;

public class OwnerDTO {
	private String ownerno;
	private String storename;
	private String storedoc;
	private String id;
	private boolean isallowed;
	private String tel;
	private java.sql.Timestamp regidate;
	private int storeno;
	
	
	public int getStoreno() {
		return storeno;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public String getTel() {
		return tel;
	}
	public java.sql.Timestamp getRegidate() {
		return regidate;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setRegidate(java.sql.Timestamp regidate) {
		this.regidate = regidate;
	}
	public String getOwnerno() {
		return ownerno;
	}
	public String getStorename() {
		return storename;
	}
	public String getStoredoc() {
		return storedoc;
	}
	public String getId() {
		return id;
	}
	public boolean isIsallowed() {
		return isallowed;
	}
	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public void setStoredoc(String storedoc) {
		this.storedoc = storedoc;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setIsallowed(boolean isallowed) {
		this.isallowed = isallowed;
	}
	
	
}
