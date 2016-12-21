package edu.mum.wap.carpool.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import edu.mum.wap.carpool.dao.PostDAO;
import edu.mum.wap.carpool.dao.UserAccountDAO;
import edu.mum.wap.carpool.model.Comment;
import edu.mum.wap.carpool.model.Post;
import edu.mum.wap.carpool.util.GlobalUtil;

public class PostDAOImpl implements PostDAO {
	UserAccountDAO userAccountDAO;
	
	public PostDAOImpl()
	{
		userAccountDAO= new UserAccountDAOImpl();
	}
	@Override
	public void createPost(Post post) throws Exception {
		
		Connection con=GlobalUtil.getDBConnection();
		
		String query="INSERT INTO `car-pool`.`posts`"
					+ "(`userid`,`post`,`posttype`,`datecreated`,`dateupdated`)VALUES"
						+ "(?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);";
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setInt(1, post.getUser().getUserId());
		stmt.setString(2, post.getPost());
		stmt.setString(3, post.getPostType());
		
		
		
				
	    System.out.println("the query: " + query);
	    stmt.executeUpdate();
	    con.close();
	}

	@Override
	public Post retrivePostById(String postId) throws Exception {
		
		return null;
	}

	@Override
	public List<Post> retrivePostByUser(String userId) throws Exception {
		
		return null;
	}

	@Override
	public List<Post> retrivePostByType(String type) throws Exception {
		
		Connection con=GlobalUtil.getDBConnection();
		
		List<Post> postList=new ArrayList();
		
		String query="SELECT * FROM `car-pool`.`posts` WHERE `posttype` =? ORDER BY `dateupdated` DESC;";
					
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setString(1, type);
		
		ResultSet rsPost=stmt.executeQuery();
		while(rsPost.next())
		{
			Post post=new Post();
			post.setPostid(rsPost.getInt("postid"));
			post.setPost(rsPost.getString("post"));
			post.setPostType(rsPost.getString("posttype"));	
			post.setUser(userAccountDAO.retriveUserById(rsPost.getInt("userid")));
			post.setDateCreated(rsPost.getDate("datecreated"));
			post.setDateUpdated(rsPost.getDate("dateupdated"));
			
			postList.add(post);
			
		}
		return postList;
	}

	@Override
	public void updatePost(Post post) throws Exception {
		
		
	}

	@Override
	public void deletePost(Post post) throws Exception {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Comment> retrivePostCommentsByPost(int postId) throws Exception {


		Connection con=GlobalUtil.getDBConnection();
		
		List<Comment> commentList=new ArrayList();
		
		String query="SELECT * FROM `car-pool`.`Comments` WHERE `postid` =? ORDER BY `dateupdated` DESC ;";
					
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setInt(1, postId);
		
		ResultSet rsComment=stmt.executeQuery();
		while(rsComment.next())
		{
			Comment comment=new Comment();
			comment.setCommentid(rsComment.getInt("commentid"));
			comment.setComment(rsComment.getString("comment"));	
			comment.setUser(userAccountDAO.retriveUserById(rsComment.getInt("userid")));
			comment.setDateCreated(rsComment.getDate("datecreated"));
			comment.setDateUpdated(rsComment.getDate("dateupdated"));
			
			commentList.add(comment);
			
		}
		return commentList;
		
		
	}
	@Override
	public void createPostComment(Comment comment) throws Exception {

Connection con=GlobalUtil.getDBConnection();
		
		String query="INSERT INTO `car-pool`.`comments`"
				+ "(`userid`,`postid`,`comment`,`datecreated`,`dateupdated`)"
				+ "VALUES(?,?,?, CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);";
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setInt(1, comment.getUser().getUserId());
		stmt.setInt(2, comment.getPost().getPostId());
		stmt.setString(3, comment.getComment());
		
		
		
				
	    System.out.println("the query: " + query);
	    stmt.executeUpdate();
	    con.close();
		
	}

}
