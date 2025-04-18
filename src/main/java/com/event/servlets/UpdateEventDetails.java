package com.event.servlets;

import java.io.IOException;

import com.event.dao.EventDetailsDAO;
import com.event.dao.EventDetailsDAOImpl;
import com.event.dto.EventDetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/updateEventDetails")
public class UpdateEventDetails extends HttpServlet{

	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
		HttpSession session=req.getSession(false);
		EventDetailsDAO edao=new EventDetailsDAOImpl();
		EventDetails e=new EventDetails();
		e.setEvent_id(Integer.parseInt(req.getParameter("event_id")));
		e.setDetail_id(Integer.parseInt(req.getParameter("detail_id")));
		e.setDetail_type(req.getParameter("detail_type"));
		e.setDetail_description(req.getParameter("detail_description"));
		e.setPrice(Double.parseDouble(req.getParameter("price")));
		e.setRoom_capacity(Integer.parseInt(req.getParameter("room_capacity")));
		e.setImage_url(req.getParameter("image_url"));
		if(edao.updateEventDetails(e)) {
			req.setAttribute("udsuccess", "updated successfully");
			RequestDispatcher rd=req.getRequestDispatcher("updateEvent2.jsp");
			rd.forward(req, resp);
			
		}
		else {
			req.setAttribute("udfail", "failed to update");
			RequestDispatcher rd=req.getRequestDispatcher("updateEvent2.jsp");
			rd.forward(req, resp);
			
		}
		
	}
}
