package com.kosmo.lingopos.review;

public class ReviewDTO {
	private String comment;
	private int reviewno;
	private int storeno;
	private String id;
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
