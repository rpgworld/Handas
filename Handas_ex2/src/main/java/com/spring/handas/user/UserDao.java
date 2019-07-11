package com.spring.handas.user;

public interface UserDao {
	public String login(String userID);
	public String roleCheck(String userID);
	public int idCheck(String userID);
	public void join(UserDto dto);
	public UserDto read(String userID);
	public void update(UserDto dto);
}
