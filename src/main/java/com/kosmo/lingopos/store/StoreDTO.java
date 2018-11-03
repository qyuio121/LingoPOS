package com.kosmo.lingopos.store;

public class StoreDTO {
	private String ownerno;
	private String id;
	private String storename;
	private String address;
	private String tel;
	private String opentime;
	private String closetime;
	private int tablenum;
	private String bigkind;
	private int storeno;
	private int atable;
	private int totalprice;
	
	
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getOwnerno() {
		return ownerno;
	}
	public String getId() {
		return id;
	}
	public String getStorename() {
		return storename;
	}
	public String getAddress() {
		return address;
	}
	public String getTel() {
		return tel;
	}
	public String getOpentime() {
		return opentime;
	}
	public String getClosetime() {
		return closetime;
	}
	public int getTablenum() {
		return tablenum;
	}
	public String getBigkind() {
		return bigkind;
	}
	public int getStoreno() {
		return storeno;
	}
	public int getAtable() {
		return atable;
	}
	public void setOwnerno(String ownerno) {
		this.ownerno = ownerno;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStorename(String storename) {
		this.storename = storename;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public void setOpentime(String opentime) {
		this.opentime = opentime;
	}
	public void setClosetime(String closetime) {
		this.closetime = closetime;
	}
	public void setTablenum(int tablenum) {
		this.tablenum = tablenum;
	}
	public void setBigkind(String bigkind) {
		this.bigkind = bigkind;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setAtable(int atable) {
		this.atable = atable;
	}
}
