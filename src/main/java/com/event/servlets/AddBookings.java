package com.event.servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.format.DateTimeFormatterBuilder;
import java.time.format.DateTimeFormatterBuilder;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

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
public class AddBookings extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("users") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        try {
            EventOrders eo = new EventOrders();
            EventOrdersDAO eodao = new EventOrdersDAOImpl();

            Users u = (Users) session.getAttribute("users");
            EventDetails ed = (EventDetails) session.getAttribute("eventDetails");

            eo.setUser_id(u.getUser_id());
            eo.setEvent_id(ed.getEvent_id());
            eo.setDetail_id(ed.getDetail_id());
            eo.setPrice(ed.getPrice());
            eo.setStatus("Pending");

            // Get date and time parameters
            String startDate = req.getParameter("startDate");
            String startTime = req.getParameter("startTime");
            String endDate = req.getParameter("endDate");
            String endTime = req.getParameter("endTime");

            System.out.println("Start Date: " + startDate);
            System.out.println("Start Time: " + startTime);
            System.out.println("End Date: " + endDate);
            System.out.println("End Time: " + endTime);

            // Check for empty times
            if (startTime == null || startTime.isEmpty() || startTime.equals(":")) {
                startTime = "00:00";
            }

            if (endTime == null || endTime.isEmpty() || endTime.equals(":")) {
                endTime = "01:00";
            }

            // Convert to 24-hour format if needed
            if (startTime.contains("AM") || startTime.contains("PM")) {
                startTime = convertTo24HourFormat(startTime);
                endTime = convertTo24HourFormat(endTime);
            }

            // Parse and format datetime
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
            LocalDateTime startDateTime = LocalDateTime.parse(startDate + "T" + startTime);
            LocalDateTime endDateTime = LocalDateTime.parse(endDate + "T" + endTime);

            eo.setStart_booking_date(startDateTime.format(formatter));
            eo.setEnd_booking_date(endDateTime.format(formatter));

            // Save booking
            boolean success=eodao.insertEventOrders(eo);
            if (success) {
                req.setAttribute("success", "Booking added successfully!");
                RequestDispatcher rd = req.getRequestDispatcher("bookings.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("error", "Failed to add booking. Please try again.");
                RequestDispatcher rd = req.getRequestDispatcher("bookings.jsp");
                rd.forward(req, resp);
            }

        } catch (DateTimeParseException e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid date or time format.");
            req.getRequestDispatcher("bookings.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Something went wrong. Please try again.");
            req.getRequestDispatcher("bookings.jsp").forward(req, resp);
        }
    }

    private String convertTo24HourFormat(String time12h) {
        DateTimeFormatter dtf12 = DateTimeFormatter.ofPattern("hh:mm a");
        DateTimeFormatter dtf24 = DateTimeFormatter.ofPattern("HH:mm");

        LocalTime time = LocalTime.parse(time12h.toUpperCase(), dtf12);
        return time.format(dtf24);
    }
}
