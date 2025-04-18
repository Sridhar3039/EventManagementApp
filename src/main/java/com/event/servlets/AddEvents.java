package com.event.servlets;

import java.io.IOException;

import com.event.dao.EventDetailsDAO;
import com.event.dao.EventDetailsDAOImpl;
import com.event.dto.EventDetails;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/addevent")
public class AddEvents extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession(false);
		if (session == null || session.getAttribute("users") == null) {
            req.setAttribute("error", "please login to update");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
            return;
        }
		EventDetails e=new EventDetails();
		EventDetailsDAO edao=new EventDetailsDAOImpl();
		
		
		e.setEvent_id(Integer.parseInt(req.getParameter("eventid")));
		e.setDetail_type(req.getParameter("detailtype"));
		e.setDetail_description(req.getParameter("detaildescription"));
		e.setPrice(Double.parseDouble(req.getParameter("price")));
		e.setRoom_capacity(Integer.parseInt(req.getParameter("roomcapacity")));
		e.setImage_url(req.getParameter("imageurl"));
		
		if(edao.insertEventDetails(e)) {
			req.setAttribute("eventadded", "event added successfully");
			RequestDispatcher rd=req.getRequestDispatcher("addevents.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("eventfailed", "failed to add event");
			RequestDispatcher rd=req.getRequestDispatcher("addevents.jap");
			rd.forward(req, resp);
		}
		
	}
}
