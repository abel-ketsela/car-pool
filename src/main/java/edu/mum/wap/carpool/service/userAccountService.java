package edu.mum.wap.carpool.service;

import edu.mum.wap.carpool.model.User;

public interface UserAccountService {
	
	public void registerUser(User user) throws Exception;
	public User validateUser(String userName,String password);


}
