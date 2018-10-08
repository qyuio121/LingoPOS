package com.kosmo.lingopos.comment;

public class CommentDTO {
	private int commentno;
	private String comment;
	private java.sql.Timestamp commentdate;
	private String id;
	private int freeno;
	public int getCommentno() {
		return commentno;
	}
	public String getComment() {
		return comment;
	}
	public java.sql.Timestamp getCommentdate() {
		return commentdate;
	}
	public String getId() {
		return id;
	}
	public int getFreeno() {
		return freeno;
	}
	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setCommentdate(java.sql.Timestamp commentdate) {
		this.commentdate = commentdate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setFreeno(int freeno) {
		this.freeno = freeno;
	}

}
