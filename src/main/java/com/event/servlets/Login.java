package com.event.servlets;

import java.io.IOException;

import com.event.dto.Users;
import com.event.dao.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(true);
		UsersDAO udao=new UsersDAOImpl();
		Users u=udao.getUsers(req.getParameter("email"), req.getParameter("password"));
		if(u!=null) {
			session.setAttribute("users", u);
			if(u.getRole().equals("Admin")) {
				req.setAttribute("success", "login successfull");
				RequestDispatcher rd=req.getRequestDispatcher("adminDashboard.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("success", "login successfull");
				RequestDispatcher rd=req.getRequestDispatcher("userDashboard.jsp");
				rd.forward(req, resp);
			}			
		}
		else {
			req.setAttribute("error", "failed to login");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}

}
