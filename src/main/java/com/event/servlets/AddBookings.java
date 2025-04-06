package com.event.servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.event.dao.EventDetailsDAO;
import com.event.dao.EventDetailsDAOImpl;
import com.event.dao.EventOrdersDAO;
import com.event.dao.EventOrdersDAOImpl;
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
@WebServlet("/addBookings")
public class AddBookings extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		EventOrders eo=new EventOrders();
		EventOrdersDAO eodao=new EventOrdersDAOImpl();
		Users u=(Users)session.getAttribute("users");
		EventDetails ed=(EventDetails)session.getAttribute("eventDetails");
		eo.setUser_id(u.getUser_id());
		eo.setEvent_id(ed.getEvent_id());
		eo.setDetail_id(ed.getDetail_id());
		eo.setPrice(ed.getPrice());
		String startDate = req.getParameter("startDate");
        String startTime = req.getParameter("startTime");
        String endDate = req.getParameter("endDate");
        String endTime = req.getParameter("endTime");
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        LocalDateTime startDateTime = LocalDateTime.parse(startDate + "T" + startTime);
        LocalDateTime endDateTime = LocalDateTime.parse(endDate + "T" + endTime);
        eo.setStart_booking_date(startDateTime.format(formatter));
        eo.setEnd_booking_date(endDateTime.format(formatter));
		if(eodao.insertEventOrders(eo)) {
			session.setAttribute("eventOrders", eo);
			req.setAttribute("success", "Pleace wait for Confirmation");
			RequestDispatcher rd=req.getRequestDispatcher("bookings.jsp");
			rd.forward(req, resp);
		}
		else {
			req.setAttribute("error", "failed to book");
			RequestDispatcher rd=req.getRequestDispatcher("bookings.jsp");
			rd.forward(req, resp);
		}
	}

}
