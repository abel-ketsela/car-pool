package edu.mum.wap.carpool.util;

import java.sql.*;

public class  GlobalUtil {

	// JDBC driver name and database URL
	   static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	   static final String DB_URL = "jdbc:mysql://localhost:3306/car-pool";

	   //  Database credentials
	   static final String USER = "car-pool";
	   static final String PASS = "car-pool";
	   
	   static
	   {
		   try 
		   {
			   Class.forName(JDBC_DRIVER);
	       } 
		   catch (ClassNotFoundException ex) 
		   {
	            System.out.println("MySQL JDBC driver not found in DBConnection\n" + ex);
	            System.exit(0);
	       }
	   }
	   
	
	static public Connection getDBConnection()
	 {
		 try
		 {
			 Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
			 System.out.println("Database connection invoked");
			 return con;
		 }
		 catch (SQLException ex)
		 {
			 System.out.println("DBConnection Error --> "+ex);
	            
		 }
		 return null;
		
	 }
}
