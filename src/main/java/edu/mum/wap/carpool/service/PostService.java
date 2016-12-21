package edu.mum.wap.carpool.service;

import java.util.List;

import org.json.JSONArray;

import edu.mum.wap.carpool.model.Post;

public interface PostService {
	
	public void createUserPost(Post post) throws Exception;
	public JSONArray getUserPostByType(String type)throws Exception;
}
