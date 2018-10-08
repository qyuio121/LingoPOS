package com.kosmo.lingopos.notice;

public class NoticeDTO {
	private int noticeno;
	private String title;
	private String content;
	private java.sql.Timestamp postdate;
	private int count;
	private int adminno;
	private String adminnick;
	public int getNoticeno() {
		return noticeno;
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
	public int getAdminno() {
		return adminno;
	}
	public String getAdminnick() {
		return adminnick;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
	public void setAdminno(int adminno) {
		this.adminno = adminno;
	}
	public void setAdminnick(String adminnick) {
		this.adminnick = adminnick;
	}
	
	
}
