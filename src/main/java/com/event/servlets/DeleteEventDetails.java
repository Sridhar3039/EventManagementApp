package com.event.servlets;

import java.io.IOException;

import com.event.dao.EventDetailsDAO;
import com.event.dao.EventDetailsDAOImpl;
import com.event.dao.UsersDAO;
import com.event.dao.UsersDAOImpl;
import com.event.dto.EventDetails;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class DeleteEventDetails extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EventDetailsDAO edao=new EventDetailsDAOImpl();
		
		EventDetails e1=new EventDetails();
		
		
		e1.setDetail_id(Integer.parseInt(req.getParameter("detail_id")));
		
		if(edao.deleteEventDetails(e1)) {
			req.setAttribute("deletesuccess", "deleted succesfully");
			RequestDispatcher rd=req.getRequestDispatcher("eventDetails.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("deleteFail", "failed to delete");
			RequestDispatcher rd=req.getRequestDispatcher("eventDetails.jsp");
			rd.forward(req, resp);
		}
		
	}
}
