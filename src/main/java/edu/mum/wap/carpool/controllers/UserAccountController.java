package edu.mum.wap.carpool.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.mum.wap.carpool.model.User;
import edu.mum.wap.carpool.service.UserAccountService;
import edu.mum.wap.carpool.service.impl.UserAccountServiceImpl;

/**
 * Servlet implementation class UserAccountController
 */
public class UserAccountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserAccountService userAccountService;
	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM/dd/yyyy"); 
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserAccountController() {
        super();
        userAccountService=new UserAccountServiceImpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action=request.getParameter("ACTION");
		
		System.out.println(action);
		try
		{
		if (action.equals("USER.CREATE"))
		{
			User user =new User();

			
				user.setDateOfBirth(LocalDate.parse(request.getParameter("dob"),dtf));
				user.setCity(request.getParameter("city"));
				user.setEmail(request.getParameter("email"));
				user.setFullName(request.getParameter("fullname"));
				user.setGender(request.getParameter("gender"));
				user.setPassword(request.getParameter("password"));
				user.setState(request.getParameter("state"));
				user.setStreet(request.getParameter("street"));
				user.setUserId(0);
				user.setZipCode(request.getParameter("zipCode"));
				
				
				this.userAccountService.registerUser(user);
				System.out.println("User Created ---");

			
		}
		else if (action.equals("USER.LOGIN"))
		{
			System.out.println(request.getParameter("loginId")+"/"+request.getParameter("password"));
			User user=this.userAccountService.validateUser(request.getParameter("loginId"),request.getParameter("password"));
			
			if (user!=null)
			{
				//System.out.println("Test"+user.getPassword());
				request.getSession().setMaxInactiveInterval(30*60);
				request.getSession().setAttribute("currentUser", user);
				request.getRequestDispatcher("/view/index.jsp")
				.forward(request, response);
				
			}
			else
			{
				request.setAttribute("errorMsg", "Invalid Login or Password, PLease try again");
				request.getRequestDispatcher("/view/welcome.jsp")
											.forward(request, response);
			}
		}
		
		
		}
		catch (Exception ex)
		{
			System.out.println(ex);
		}
		
				
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
