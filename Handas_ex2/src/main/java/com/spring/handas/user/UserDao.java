package com.spring.handas.user;

import java.util.ArrayList;

public interface UserDao {
	public String login(String userID);
	public String roleCheck(String userID);
	public int idCheck(String userID);
	public void join(UserDto dto);
	public UserDto read(String userID);
	public void update(UserDto dto);
	
	// 회원 리스트
	public ArrayList<UserDto> userList();
	
	// 회원탈퇴
	public void userDelete(String userID);
	
	// 등급변경
	public void roleUpdate(String role, String userID);
}
