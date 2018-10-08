package com.kosmo.lingopos.free;

public class FreeDTO {
	private int freeno;
	private String title;
	private String content;
	private java.sql.Timestamp postdate;
	private int count;
	private String id;
	public int getFreeno() {
		return freeno;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public java.sql.Timestamp getPostdate() {
		return postdate;
	}
	public int getCount() {
		return count;
	}
	public String getId() {
		return id;
	}
	public void setFreeno(int freeno) {
		this.freeno = freeno;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setPostdate(java.sql.Timestamp postdate) {
		this.postdate = postdate;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
