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
@WebServlet("/signup")
public class Signup extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Users u=new Users();
		UsersDAO udao=new UsersDAOImpl();
		u.setName(req.getParameter("name"));
		u.setPhone(Long.parseLong(req.getParameter("phone")));
		u.setEmail(req.getParameter("mail"));
		if(req.getParameter("password").equals(req.getParameter("confPass"))) {
			u.setPassword(req.getParameter("confPass"));
			if(udao.insertUsers(u)) {
				req.setAttribute("success", "Data Saved");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
			else {
				req.setAttribute("error", "failed to save");
				RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
				rd.forward(req, resp);
			}
		}
	}

}
