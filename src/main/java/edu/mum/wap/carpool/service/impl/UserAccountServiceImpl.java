package edu.mum.wap.carpool.service.impl;

import java.sql.Connection;

import javax.servlet.annotation.WebServlet;

import edu.mum.wap.carpool.dao.UserAccountDAO;
import edu.mum.wap.carpool.dao.impl.UserAccountDAOImpl;
import edu.mum.wap.carpool.model.User;
import edu.mum.wap.carpool.service.UserAccountService;


public class UserAccountServiceImpl implements UserAccountService {
	
	UserAccountDAO userAccountDAO;

	public UserAccountServiceImpl()
	{
		userAccountDAO=new UserAccountDAOImpl();
	}

	@Override
	public void registerUser(User user) throws Exception {
		userAccountDAO.createUser(user);
		
	}

	@Override
	public User validateUser(String loginId, String password) throws Exception {
		
		return userAccountDAO.retriveUser(loginId);
		
	}
	
}
