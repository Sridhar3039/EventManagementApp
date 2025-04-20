package com.event.servlets;

import java.io.IOException;

import com.event.dao.EventsDAO;
import com.event.dao.EventsDAOImpl;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateDetails extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		EventsDAO e=new EventsDAOImpl();
		int detail_id=Integer.parseInt(req.getParameter("detail_id"));
		if(detail_id!=0) {
			
			session.setAttribute("detail_id1", detail_id);
			resp.sendRedirect("updateEventDetails.jsp");
		}
		else {
			req.setAttribute("error", "failed to update");
			RequestDispatcher rd=req.getRequestDispatcher("adminDashboard.jsp");
			rd.forward(req, resp);
		}
	}
}
