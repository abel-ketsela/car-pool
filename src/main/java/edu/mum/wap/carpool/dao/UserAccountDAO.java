package edu.mum.wap.carpool.dao;

import edu.mum.wap.carpool.model.User;

public interface UserAccountDAO {
				
		public void createUser(User user) throws Exception;
		public User retriveUser(String email) throws Exception;
		public void updateUser(User user) throws Exception;
		public void deleteUser(User user) throws Exception;

		
}
