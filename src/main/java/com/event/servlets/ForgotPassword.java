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

@WebServlet("/forgotpassword")
public class ForgotPassword extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		UsersDAO udao=new UsersDAOImpl();
		Users u=udao.getUsers(Long.parseLong(req.getParameter("phone")), req.getParameter("email"));
		if(u!=null) {
			if(req.getParameter("password").equals(req.getParameter("confPass"))) {
				u.setPassword(req.getParameter("confPass"));
				if(udao.updateUsers(u)) {
					req.setAttribute("success", "Password Updated");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				else {
					req.setAttribute("error", "Failed to Update");
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
			}
			else {
				req.setAttribute("error", "Password Missmatch");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			req.setAttribute("error", "User not Found");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
}
