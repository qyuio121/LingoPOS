package com.kosmo.lingopos.qna;

public class QnaDTO {
	private int qnano;
	private int kind;
	private String title;
	private String content;
	private java.sql.Timestamp postdate;
	private String id;
	public int getQnano() {
		return qnano;
	}
	public int getKind() {
		return kind;
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
	public String getId() {
		return id;
	}
	public void setQnano(int qnano) {
		this.qnano = qnano;
	}
	public void setKind(int kind) {
		this.kind = kind;
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
	public void setId(String id) {
		this.id = id;
	}
	
	
}
