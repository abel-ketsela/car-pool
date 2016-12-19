package edu.mum.wap.carpool.model;

import java.util.Date;

public class Post {
	
	private int postId;
	private User user;
	private Post post;
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
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
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
