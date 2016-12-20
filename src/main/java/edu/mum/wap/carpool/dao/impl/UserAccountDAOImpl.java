package edu.mum.wap.carpool.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.Date;

import edu.mum.wap.carpool.dao.UserAccountDAO;
import edu.mum.wap.carpool.model.User;
import edu.mum.wap.carpool.util.GlobalUtil;

public class UserAccountDAOImpl implements UserAccountDAO  {

	@Override
	public void createUser(User user) throws Exception {
		
		Connection con=GlobalUtil.getDBConnection();
		
		String query="INSERT INTO `car-pool`.`users`"
				+ "(`fullname`,`gender`,`state`,`city`,`street`,`zipcode`,"
				+ "`birthyear`,`email`,`password`,`datecreated`,`dateupdated`)"
						+ "VALUES"
							+ "(?,?,?,?,?,?,?,?,?,CURRENT_TIMESTAMP,CURRENT_TIMESTAMP);";
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setString(1, user.getFullName());
		stmt.setString(2, user.getGender());
		stmt.setString(3, user.getState());
		stmt.setString(4, user.getCity());
		stmt.setString(5, user.getStreet());
		stmt.setString(6, user.getZipCode());
		stmt.setDate(7, Date.valueOf(user.getDateOfBirth()));
		stmt.setString(8, user.getEmail());
		stmt.setString(9, user.getPassword());
		
				
	    System.out.println("the query: " + query);
	    stmt.executeUpdate(query);
		
		
	}

	@Override
	public User retriveUser(String email) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(User user) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
