package com.kosmo.lingopos.review;

public class ReviewDTO {
	private String comment;
	private int reviewno;
	private int storeno;
	private String id;
	private java.sql.Timestamp postdate;
	
	public java.sql.Timestamp getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Timestamp postdate) {
		this.postdate = postdate;
	}
	public String getComment() {
		return comment;
	}
	public int getReviewno() {
		return reviewno;
	}
	public int getStoreno() {
		return storeno;
	}
	public String getId() {
		return id;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public void setStoreno(int storeno) {
		this.storeno = storeno;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
