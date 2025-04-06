package com.event.dao;

import java.util.ArrayList;

import com.event.dto.Users;

public interface UsersDAO {
	public boolean insertUsers(Users u);
	public boolean updateUsers(Users u);
	public boolean deleteUsers(Users u);
	public Users getUsers(String mail,String password);
	public Users getUsers(long phone,String mail);
	public ArrayList<Users>getUsers();

}
