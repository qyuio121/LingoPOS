package com.kosmo.lingopos.owner;

public class OwnerDTO {
	private String ownerno;
	private String storename;
	private String storedoc;
	private String id;
	private boolean isallowed;
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
