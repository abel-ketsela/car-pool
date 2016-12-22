package edu.mum.wap.carpool.dao;

import java.util.List;

import edu.mum.wap.carpool.model.Comment;
import edu.mum.wap.carpool.model.Post;

public interface PostDAO {
	
	public void createPost(Post post) throws Exception;
	public Post retrivePostById(String postId) throws Exception;
	public List<Post> retrivePostByUser(String userId) throws Exception;
	public List<Post> retrivePostByType(String type,int below) throws Exception;
	public List<Comment> retrivePostCommentsByPost(int postId) throws Exception;
	public void createPostComment(Comment comment) throws Exception;
	public void updatePost(Post post) throws Exception;
	public void deletePost(Post post) throws Exception;
	

}
