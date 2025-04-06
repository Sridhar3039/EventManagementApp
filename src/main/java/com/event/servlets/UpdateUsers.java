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

@WebServlet("/updateUser")
public class UpdateUsers extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if (session == null || session.getAttribute("users") == null) {
            req.setAttribute("error", "please login to update");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
            return;
        }
		Users u=(Users)session.getAttribute("users");
		UsersDAO udao=new UsersDAOImpl();
		u.setUser_id(u.getUser_id());
		u.setName(req.getParameter("name"));
		u.setPhone(Long.parseLong(req.getParameter("phone")));
		u.setEmail(req.getParameter("mail"));
		if(udao.updateUsers(u)) {
			req.setAttribute("success", "Data Saved");
			RequestDispatcher rd=req.getRequestDispatcher("updateUser.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "failed to Saved");
			RequestDispatcher rd=req.getRequestDispatcher("updateUser.jsp");
			rd.forward(req, resp);
		}
	}

}
