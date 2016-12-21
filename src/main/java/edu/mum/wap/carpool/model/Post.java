package edu.mum.wap.carpool.model;

import java.io.Serializable;
import java.util.Date;

public class Post implements Serializable    {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int postId;
	private User user;
	private String post;
	private String postType;
	private Date dateCreated;
	private Date dateUpdated;
	
	
	////////////////// SETTER / GETTER //////////////////////
	
	
	

	public int getPostId() {
		return postId;
	}
	public void setPostid(int postid) {
		this.postId = postid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getPostType() {
		return postType;
	}
	public void setPostType(String postType) {
		this.postType = postType;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Date getDateUpdated() {
		return dateUpdated;
	}
	public void setDateUpdated(Date dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	
}
