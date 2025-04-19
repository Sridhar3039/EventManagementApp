<%@page import="com.event.dto.EventDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventDetailsDAOImpl"%>
<%@page import="com.event.dao.EventDetailsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
  EventDetails details = (EventDetails) session.getAttribute("eventDetails");
  int[] fullDayEvents = {112, 113};
  boolean isFullDay = false;
  for (int fd : fullDayEvents) {
      if (fd==details.getEvent_id()) {
          isFullDay = true;
          break;
      }
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Event Booking</title>
  <style>
    body { font-family: sans-serif; margin: 20px; }
    .slot { margin: 5px; }
    .disabled { color: gray; pointer-events: none; }
  </style>
</head>
<body>
  <h2>Booking - <%=details.getDetail_type()%></h2>
  <p><%=details.getDetail_description()%></p>
  <p>Price: ₹<%=details.getPrice()%></p>

  <form action="addBookings" method="post" onsubmit="return prepareBookingData()">
    <input type="hidden" name="eventId" value="<%=details.getEvent_id()%>"/>
    <input type="hidden" name="detailId" value="<%=details.getDetail_id()%>"/>

    <label>Select Date: </label>
    <input type="date" id="bookingDate" name="bookingDate" onchange="checkFullDay()" required /><br/><br/>

    <% if (!isFullDay) { %>
      <label>Select Time Slot:</label><br/>
      <div id="slotsContainer">
        <label><input type="radio" name="slot" value="09:00,11:00" class="slot"/> 9:00 AM - 11:00 AM</label><br/>
        <label><input type="radio" name="slot" value="11:30,13:30" class="slot"/> 11:30 AM - 1:30 PM</label><br/>
        <label><input type="radio" name="slot" value="14:00,16:00" class="slot"/> 2:00 PM - 4:00 PM</label><br/>
        <label><input type="radio" name="slot" value="16:30,18:30" class="slot"/> 4:30 PM - 6:30 PM</label><br/>
        <label><input type="radio" name="slot" value="19:00,21:00" class="slot"/> 7:00 PM - 9:00 PM</label><br/>
      </div>
    <% } else { %>
      <input type="hidden" name="slot" value="06:00,06:00" />
      <p><b>Note:</b> Full-day event selected. Booking time will be from 6:00 AM to next day 6:00 AM.</p>
    <% } %>

    <br/><input type="submit" value="Confirm and Pay"/>
  </form>

  <script>
    function checkFullDay() {
      const selectedDate = document.getElementById("bookingDate").value;
      const isFullDay = <%=isFullDay%>;

      if (!isFullDay) {
        // For demo: simulate disabling slot (in real app, fetch from DB via AJAX)
        const disabledSlots = ["09:00,11:00"]; // hardcoded
        document.querySelectorAll('input[name="slot"]').forEach(slot => {
          slot.disabled = disabledSlots.includes(slot.value);
        });
      }
    }

    function prepareBookingData() {
      const isFullDay = <%=isFullDay%>;
      const date = document.getElementById("bookingDate").value;
      if (!isFullDay && !document.querySelector('input[name="slot"]:checked')) {
        alert("Please select a time slot.");
        return false;
      }
      return true;
    }
  </script>
</body>
</html>
