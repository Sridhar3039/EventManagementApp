package com.event.servlets;

import java.io.IOException;

import com.event.dao.FeedbackDAO;
import com.event.dao.FeedbackDAOImpl;
import com.event.dao.UsersDAO;
import com.event.dao.UsersDAOImpl;
import com.event.dto.Feedback;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/feedback")
public class Feedbacks extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Feedback f=new Feedback();
		Users u=(Users) session.getAttribute("users");
		FeedbackDAO fdao=new FeedbackDAOImpl();
		f.setUser_id(u.getUser_id());
		f.setUser_name(u.getName());
		f.setRating(Integer.parseInt(req.getParameter("rating")));
		f.setComments(req.getParameter("feedback_text"));
		if(fdao.insertFeedback(f)) {
			req.setAttribute("success", "Thanks for Review");
			RequestDispatcher rd=req.getRequestDispatcher("userDashboard.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "failed to submit");
			RequestDispatcher rd=req.getRequestDispatcher("userDashboard.jsp");
			rd.forward(req, resp);
		}
	}

}
