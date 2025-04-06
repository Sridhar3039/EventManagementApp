package com.event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.event.dto.Users;
import com.event.connection.Connector;

public class UsersDAOImpl implements UsersDAO {
	public Connection con;
	public UsersDAOImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public boolean insertUsers(Users u) {
		String query="INSERT INTO users (name, email, password, phone) VALUES (?, ?, ?, ?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setLong(4, u.getPhone());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean updateUsers(Users u) {
		String query="UPDATE users SET name=?, email=?, password=?, phone=?, role=? WHERE user_id=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, u.getName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setLong(4, u.getPhone());
            ps.setString(5, u.getRole());
            ps.setInt(6, u.getUser_id());
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public boolean deleteUsers(Users u) {
		String query = "DELETE FROM users WHERE user_id=?";
		int i=0;
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, u.getUser_id());
            i=ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(i>0) {
        	return true;
        }
        else {
        	return false;
        }
	}

	@Override
	public Users getUsers(String mail, String password) {
		String query="SELECT * FROM users WHERE email=? AND password=?";
		Users u=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, mail);
            ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new Users();
				u.setUser_id(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setRole(rs.getString("role"));
				u.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public Users getUsers(long phone, String mail) {
		String query="SELECT * FROM users WHERE phone=? AND email=?";
		Users u=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new Users();
				u.setUser_id(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setRole(rs.getString("role"));
				u.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public ArrayList<Users> getUsers() {
		String query="SELECT * FROM users";
		ArrayList<Users> userList=new ArrayList<Users>();
		Users u=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				u=new Users();
				u.setUser_id(rs.getInt("user_id"));
				u.setName(rs.getString("name"));
				u.setEmail(rs.getString("email"));
				u.setPhone(rs.getLong("phone"));
				u.setRole(rs.getString("role"));
				u.setPassword(rs.getString("password"));	
				userList.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}

}
