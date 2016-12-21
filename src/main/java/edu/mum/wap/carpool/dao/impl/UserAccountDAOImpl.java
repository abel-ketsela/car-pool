package edu.mum.wap.carpool.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
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
	    stmt.executeUpdate();
	    con.close();
		
		
	}

	@Override
	public User retriveUser(String loginId) throws Exception {
Connection con=GlobalUtil.getDBConnection();
		User user=null;
		String query="SELECT * "
						+ "FROM `car-pool`.`users` "
							+ "WHERE `users`.`email`=? ;";
		
		PreparedStatement stmt = con.prepareStatement(query);
		
		stmt.setString(1, loginId);
		
				
	    System.out.println("the query: " + query);
	    ResultSet rsUser=stmt.executeQuery();
	    if (rsUser.next())
	    {
	    	
	    	user=new User();
	    	user.setCity(rsUser.getString("city"));
	    	user.setDateCreated(rsUser.getDate("datecreated").toLocalDate());
	    	user.setDateOfBirth(rsUser.getDate("birthyear").toLocalDate());
	    	user.setDateUpdated(rsUser.getDate("dateupdated").toLocalDate());
	    	user.setEmail(rsUser.getString("email"));
	    	user.setFullName(rsUser.getString("fullname"));
	    	user.setGender(rsUser.getString("gender"));
	    	user.setPassword(rsUser.getString("password"));
	    	user.setState(rsUser.getString("state"));
	    	user.setStreet(rsUser.getString("street"));
	    	user.setUserId(rsUser.getInt("userid"));
	    	user.setZipCode(rsUser.getString("zipcode"));
	    	
	    	
	    	
	    }
	    
	    con.close();

	    return user;
		
	}
	
	@Override
	public User retriveUserById(int userId) throws Exception {
		Connection con=GlobalUtil.getDBConnection();
				User user=null;
				String query="SELECT * "
								+ "FROM `car-pool`.`users` "
									+ "WHERE `users`.`userId`=? ;";
				
				PreparedStatement stmt = con.prepareStatement(query);
				
				stmt.setInt(1, userId);
				
						
			    System.out.println("the query: " + query);
			    ResultSet rsUser=stmt.executeQuery();
			    if (rsUser.next())
			    {
			    	
			    	user=new User();
			    	user.setCity(rsUser.getString("city"));
			    	user.setDateCreated(rsUser.getDate("datecreated").toLocalDate());
			    	user.setDateOfBirth(rsUser.getDate("birthyear").toLocalDate());
			    	user.setDateUpdated(rsUser.getDate("dateupdated").toLocalDate());
			    	user.setEmail(rsUser.getString("email"));
			    	user.setFullName(rsUser.getString("fullname"));
			    	user.setGender(rsUser.getString("gender"));
			    	user.setPassword(rsUser.getString("password"));
			    	user.setState(rsUser.getString("state"));
			    	user.setStreet(rsUser.getString("street"));
			    	user.setUserId(rsUser.getInt("userid"));
			    	user.setZipCode(rsUser.getString("zipcode"));
			    	
			    	
			    	
			    }
			    
			    con.close();

			    return user;
				
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
