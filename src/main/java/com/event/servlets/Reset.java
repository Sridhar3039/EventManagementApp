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
import jakarta.servlet.http.HttpSession;

@WebServlet("/reset")
public class Reset extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		UsersDAO udao=new UsersDAOImpl();
		//PrintWriter out=resp.getWriter();
		Users u=udao.getUsers(Long.parseLong(req.getParameter("phone")), req.getParameter("email"));
		if(u!=null) {
			if(req.getParameter("password").equals(req.getParameter("confPass"))) {
				u.setPassword(req.getParameter("password"));
				if(udao.updateUsers(u)) {
					req.setAttribute("success", "Password Updated");
					RequestDispatcher rd=req.getRequestDispatcher("reset.jsp");
					rd.forward(req, resp);
							
				}
				else {
					req.setAttribute("error", "failed to Update");
					RequestDispatcher rd=req.getRequestDispatcher("reset.jsp");
					rd.forward(req, resp);
				}	
			}
			else {
				req.setAttribute("passerror", "Password mismatched");
				RequestDispatcher rd=req.getRequestDispatcher("reset.jsp");
				rd.forward(req, resp);
			}
		}
		else {
			req.setAttribute("notfound", "Student not found");
			RequestDispatcher rd=req.getRequestDispatcher("reset.jsp");
			rd.forward(req, resp);
		}
	}

}
