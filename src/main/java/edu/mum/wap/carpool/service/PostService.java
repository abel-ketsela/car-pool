package edu.mum.wap.carpool.service;

import java.util.List;

import org.json.JSONArray;

import edu.mum.wap.carpool.model.Comment;
import edu.mum.wap.carpool.model.Post;

public interface PostService {
	
	public void createUserPost(Post post) throws Exception;
	public JSONArray getUserPostByType(String type,int below)throws Exception;
	public JSONArray getUserCommentsByPost(int postId)throws Exception;
	public void createPostComment(Comment comment) throws Exception;

}
