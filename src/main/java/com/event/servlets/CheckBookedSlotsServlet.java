package com.event.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import com.event.connection.Connector;
import com.google.gson.Gson;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checkBookedSlots")
public class CheckBookedSlotsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String date = req.getParameter("date");
        String detailId = req.getParameter("detailId");
        ArrayList<String> bookedSlots = new ArrayList<>();

        try (Connection con = Connector.requestConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "SELECT start_booking_date, end_booking_date FROM event_orders " +
                "WHERE detail_id=? AND (status='Pending' OR status='Confirmed') AND DATE(start_booking_date)=?");
            ps.setString(1, detailId);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

            while (rs.next()) {
                LocalDateTime start = LocalDateTime.parse(rs.getString("start_booking_date"), formatter);
                LocalDateTime end = LocalDateTime.parse(rs.getString("end_booking_date"), formatter);
                String startSlot = String.format("%02d:%02d", start.getHour(), start.getMinute());
                String endSlot = String.format("%02d:%02d", end.getHour(), end.getMinute());
                String slot = startSlot + "," + endSlot;
                bookedSlots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.setContentType("application/json");
        resp.getWriter().write(new Gson().toJson(bookedSlots));
    }
}
