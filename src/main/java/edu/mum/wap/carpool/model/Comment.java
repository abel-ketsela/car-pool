package edu.mum.wap.carpool.model;

import java.util.Date;

public class Comment {
	
	
	private int commentId;
	private User user;
	private Post post;
	private String comment;
	private Date dateCreated;
	private Date dateUpdated;
	
	/////////////////////SETTER / GETTER//////////////////////////
	public int getCommentId() {
		return commentId;
	}
	public void setCommentid(int commentid) {
		this.commentId = commentid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date datecreated) {
		this.dateCreated = datecreated;
	}
	public Date getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Date dateupdated) {
		this.dateUpdated = dateupdated;
	}	
	
	
	
}
