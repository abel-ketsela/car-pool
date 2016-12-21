package edu.mum.wap.carpool.service.impl;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

import edu.mum.wap.carpool.dao.PostDAO;
import edu.mum.wap.carpool.dao.impl.PostDAOImpl;
import edu.mum.wap.carpool.model.Post;
import edu.mum.wap.carpool.service.PostService;

public class PostServiceImpl implements PostService {
	PostDAO postDAO;
	
	public PostServiceImpl()
	{
		postDAO=new PostDAOImpl();

	}
	
	@Override
	public void createUserPost(Post post) throws Exception {
			postDAO.createPost(post);
	}

	@Override
	public JSONArray getUserPostByType(String type) throws Exception {
		
		List<Post> postList =postDAO.retrivePostByType(type);
		JSONArray jsonPostList = new JSONArray();
		for (Post p : postList)
		{
			JSONObject jsonPostObj =new JSONObject();
			
			jsonPostObj.put("postId", p.getPostId());
			jsonPostObj.put("post", p.getPost());
			jsonPostObj.put("postType", p.getPostType());
			
			JSONObject jsonUserObj =new JSONObject();
			jsonUserObj.put("userId", p.getUser().getUserId());
			jsonUserObj.put("fullName", p.getUser().getFullName());
			jsonUserObj.put("email", p.getUser().getEmail());
			
			jsonPostObj.put("user", jsonUserObj);
			jsonPostObj.put("dateCreated", p.getDateCreated());
			jsonPostObj.put("dateUpdated", p.getDateCreated());
			
			jsonPostList.put(jsonPostObj);
		}
       

		
		return jsonPostList;
	}

}
