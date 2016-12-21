package edu.mum.wap.carpool.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import edu.mum.wap.carpool.model.Comment;
import edu.mum.wap.carpool.model.Post;
import edu.mum.wap.carpool.model.User;
import edu.mum.wap.carpool.service.PostService;
import edu.mum.wap.carpool.service.impl.PostServiceImpl;

/**
 * Servlet implementation class PostController
 */
public class PostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostController() {
        super();
        postService=new PostServiceImpl();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("ACTION");
		HttpSession session=request.getSession(false);
		
		if (session!=null)
		{
			System.out.println(action);
			try
			{
			if (action.equals("POST.CREATE"))
			{
				Post post =new Post();

				
					
					post.setPost(request.getParameter("rideText"));
					post.setPostType(request.getParameter("rideType"));
					post.setUser((User)session.getAttribute("currentUser"));
					
					
					System.out.println(request.getParameter("rideType"));
					postService.createUserPost(post);
					System.out.println("Post Created ---");

				
			}
			else if (action.equals("POST.GET.REQUEST"))
			{
				response.setContentType("application/json");
				JSONArray jsonPostList=postService.getUserPostByType("REQUEST");
				ServletOutputStream outputStream = response.getOutputStream();
				outputStream.print(jsonPostList.toString());  
				
				
			}
			else if (action.equals("POST.GET.PROVIDE"))
			{
				response.setContentType("text/json");
				JSONArray jsonPostList=postService.getUserPostByType("PROVIDE");
				ServletOutputStream outputStream = response.getOutputStream();
				outputStream.print(jsonPostList.toString());  
				
				
			}
			else if (action.equals("POST.GET.COMMENTS"))
			{
				response.setContentType("text/json");
				JSONArray jsonCommentList=postService.getUserCommentsByPost(Integer.parseInt(request.getParameter("postId")));
				ServletOutputStream outputStream = response.getOutputStream();
				outputStream.print(jsonCommentList.toString());  
				
			
			}
			else if (action.equals("POST.ADD.COMMENTS"))
			{
				response.setContentType("text/json");
				Comment comment=new Comment();
				comment.setComment(request.getParameter("comment"));
				comment.setUser((User)session.getAttribute("currentUser"));
				Post post=new Post();
				post.setPostid(Integer.parseInt(request.getParameter("postId")));
				comment.setPost(post);
				
				postService.createPostComment(comment);
				
				JSONArray jsonCommentList=postService.getUserCommentsByPost(Integer.parseInt(request.getParameter("postId")));
				ServletOutputStream outputStream = response.getOutputStream();
				outputStream.print(jsonCommentList.toString());  
				
			
			}
			
			
			
			}
			catch (Exception ex)
			{
				System.out.println(ex);
			}
		}
		else
		{
			request.setAttribute("errorMsg", "We are sorry, your session has expired. Please login again !");
			request.getRequestDispatcher("/view/welcome.jsp")
										.forward(request, response);
		}
		
		
		
				
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
