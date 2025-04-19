package com.event.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.event.connection.Connector;
import com.event.dao.EventOrdersDAO;
import com.event.dao.EventOrdersDAOImpl;
import com.event.dto.EventDetails;
import com.event.dto.EventOrders;
import com.event.dto.Events;
import com.event.dto.Users;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addBookings")
public class AddBookings extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("users") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        Users user = (Users) session.getAttribute("users");
        EventDetails details = (EventDetails) session.getAttribute("eventDetails");

        int eventId = Integer.parseInt(req.getParameter("eventId"));
        String bookingDate = req.getParameter("bookingDate");
        String[] timeSlot = req.getParameter("slot").split(",");
        String bookingType = (eventId==113) || (eventId==112)? "FullDay" : "TimeSlot";

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

        String start = bookingDate + " " + timeSlot[0];
        String end = bookingDate + " " + timeSlot[1];

        // For full-day booking, end date is next day 6:00 AM
        if (bookingType.equals("FullDay")) {
            LocalDateTime startDateTime = LocalDateTime.parse(start, dtf);
            LocalDateTime endDateTime = startDateTime.plusDays(1).withHour(6).withMinute(0);
            start = dtf.format(startDateTime);
            end = dtf.format(endDateTime);
        }

        EventOrders eo = new EventOrders();
        eo.setUser_id(user.getUser_id());
        eo.setEvent_id(details.getEvent_id());
        eo.setDetail_id(details.getDetail_id());
        eo.setPrice(details.getPrice());
        eo.setStart_booking_date(start);
        eo.setEnd_booking_date(end);
        eo.setBooking_type(bookingType); // Make sure you add a setter in EventOrders DTO

        EventOrdersDAO dao = new EventOrdersDAOImpl();
        boolean result = dao.insertEventOrders(eo);

        if (result) {
            req.setAttribute("success", "Booking confirmed!");
        } else {
            req.setAttribute("error", "Failed to book. Try again.");
        }

        RequestDispatcher rd = req.getRequestDispatcher("event_booking.jsp");
        rd.forward(req, resp);
    }
}