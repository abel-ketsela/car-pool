package edu.mum.wap.carpool.dao;

import java.util.List;

import edu.mum.wap.carpool.model.Post;

public interface PostDAO {
	
	public void createPost(Post post) throws Exception;;
	public Post retrivePostById(String postId) throws Exception;
	public List<Post> retrivePostByUser(String userId) throws Exception;
	public List<Post> retrivePostByType(String type) throws Exception;
	public void updatePost(Post post) throws Exception;
	public void deletePost(Post post) throws Exception;
	

}
