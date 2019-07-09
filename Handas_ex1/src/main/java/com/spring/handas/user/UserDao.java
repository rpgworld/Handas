package com.spring.handas.user;

public interface UserDao {
	public String login(String userID);
	public int idCheck(String userID);
	public void join(String userID, String userPW, String userName, String address1, String address2, String address3, String userEmail);
	public UserDto read(String userID);
	public void update(String userPW, String userName, String address1, String address2, String address3, String userEmail, String userID);
}
