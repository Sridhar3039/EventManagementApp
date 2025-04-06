package com.event.servlets;

import java.io.IOException;

import com.event.dao.*;
import com.event.dto.EventDetails;
import com.event.dto.EventOrders;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bookings")
public class Bookings extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		if (session == null || session.getAttribute("users") == null) {
            req.setAttribute("error", "please login to book");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
            return;
        }
		EventDetailsDAO eddao=new EventDetailsDAOImpl();
		EventDetails ed=eddao.getEventDetails(Integer.parseInt(req.getParameter("detail_id")));
		if(ed!=null) {
			session.setAttribute("eventDetails", ed);
			resp.sendRedirect("bookings.jsp");
		}
		else {
			req.setAttribute("error", "failed to book");
			RequestDispatcher rd=req.getRequestDispatcher("bookings.jsp");
			rd.forward(req, resp);
		}
	}
}
