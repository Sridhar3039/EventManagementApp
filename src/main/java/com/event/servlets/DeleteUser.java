package com.event.servlets;

import java.io.IOException;

import com.event.dao.UsersDAO;
import com.event.dao.UsersDAOImpl;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteUser extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UsersDAO udao=new UsersDAOImpl();
		
		Users u1=new Users();
		
		u1.setUser_id(Integer.parseInt(req.getParameter("id")));
		
		if(udao.deleteUsers(u1)) {
			req.setAttribute("deletesuccess", "deleted succesfully");
			RequestDispatcher rd=req.getRequestDispatcher("viewuser.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("deleteFail", "failed to delete");
			RequestDispatcher rd=req.getRequestDispatcher("viewuser.jsp");
			rd.forward(req, resp);
		}
		
	}
}
