package com.event.servlets;

import java.io.IOException;
import java.util.ArrayList;

import com.event.dao.EventsDAO;
import com.event.dao.EventsDAOImpl;
import com.event.dto.Events;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/eventDetails")
public class EventDetails extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		int event_id=Integer.parseInt(req.getParameter("event_id"));
		if(event_id!=0) {
			session.setAttribute("event_id", event_id);
			
			resp.sendRedirect("eventDetails.jsp");
		}
		
		else {
			req.setAttribute("error", "failed to book");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
		}
	}
}
