<%@page import="com.event.dto.EventOrders"%>
<%@page import="com.event.dao.EventOrdersDAOImpl"%>
<%@page import="com.event.dao.EventOrdersDAO"%>
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Event Booking</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    :root {
      --primary-color: rgb(59, 121, 183);
      --secondary-color: rgb(154, 194, 235);
      --accent-color: rgb(65, 65, 142);
      --text-color: #333;
      --light-bg: rgba(255, 255, 255, 0.9);
      --border-radius: 12px;
      --box-shadow: 0 10px 30px rgba(0, 0, 0, 0.15);
      --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
    }
    
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    body {
      background-image: url("/EventManagementApp/img/eventDetails_bg.jpg");
      background-repeat: no-repeat;
      background-size: cover;
      background-attachment: fixed;
      color: var(--text-color);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 30px 20px;
    }
    
    .booking-card {
      width: 100%;
      max-width: 1100px;
      background-color: var(--light-bg);
      border-radius: var(--border-radius);
      overflow: hidden;
      box-shadow: var(--box-shadow);
      display: grid;
      grid-template-columns: 1fr 1fr;
      position: relative;
      animation: fadeIn 0.6s ease-out;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .event-details-section {
      padding: 60px;
      background-color: var(--secondary-color);
      position: relative;
      overflow: hidden;
    }
    
    .event-details-section::before {
      content: '';
      position: absolute;
      top: -50px;
      right: -50px;
      width: 100px;
      height: 100px;
      background-color: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
    }
    
    .event-title {
      font-size: 2.2rem;
      margin-bottom: 20px;
      color: var(--text-color);
      position: relative;
      padding-bottom: 15px;
    }
    
    .event-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 80px;
      height: 4px;
      background-color: var(--primary-color);
      border-radius: 2px;
    }
    
    .event-description {
      margin-bottom: 25px;
      line-height: 1.6;
      color: var(--text-color);
      font-size: 1.05rem;
    }
    
    .event-meta {
      background-color: rgba(255, 255, 255, 0.3);
      border-radius: var(--border-radius);
      padding: 20px;
      margin-top: 30px;
    }
    
    .meta-item {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }
    
    .meta-item:last-child {
      margin-bottom: 0;
    }
    
    .meta-icon {
      width: 40px;
      height: 40px;
      background-color: var(--primary-color);
      border-radius: 50%;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-right: 15px;
    }
    
    .meta-icon i {
      color: white;
      font-size: 1.2rem;
    }
    
    .meta-text {
      font-weight: 600;
      color: var(--text-color);
    }
    
    .booking-section {
      padding: 40px;
      background-color: white;
      position: relative;
    }
    
    .booking-title {
      font-size: 1.8rem;
      margin-bottom: 25px;
      color: var(--primary-color);
    }
    
    .form-group {
      margin-bottom: 25px;
    }
    
    .form-label {
      display: block;
      margin-bottom: 10px;
      font-weight: 600;
      color: var(--text-color);
    }
    
    .date-input {
      width: 100%;
      padding: 14px;
      border: 2px solid #e0e0e0;
      border-radius: var(--border-radius);
      font-size: 1rem;
      transition: var(--transition);
      background-color: white;
    }
    
    .date-input:focus {
      border-color: var(--primary-color);
      outline: none;
      box-shadow: 0 0 0 3px rgba(59, 121, 183, 0.2);
    }
    
    .slots-container {
      margin-top: 20px;
    }
    
    .slots-title {
      font-size: 1.1rem;
      margin-bottom: 15px;
      color: var(--text-color);
      font-weight: 600;
    }
    
    .slots-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
      gap: 12px;
      margin-bottom: 25px;
    }
    
    .slot-option {
      position: relative;
    }
    
    .slot-option input[type="radio"] {
      position: absolute;
      opacity: 0;
      width: 0;
      height: 0;
    }
    
    .slot-option label {
      display: block;
      padding: 12px 10px;
      background-color: var(--secondary-color);
      color: var(--text-color);
      border-radius: 8px;
      text-align: center;
      cursor: pointer;
      transition: var(--transition);
      font-weight: 500;
      border: 2px solid transparent;
    }
    
    .slot-option input[type="radio"]:checked + label {
      background-color: var(--primary-color);
      color: white;
      border-color: var(--accent-color);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .slot-option input[type="radio"]:disabled + label {
      background-color: #f0f0f0;
      color: #999;
      cursor: not-allowed;
      opacity: 0.7;
    }
    
    .slot-option label:hover:not(:disabled) {
      background-color: #d0e2f5;
      transform: translateY(-2px);
    }
    
    .book-button {
      width: 100%;
      padding: 16px;
      background-color: var(--primary-color);
      color: white;
      border: none;
      border-radius: var(--border-radius);
      font-size: 1.1rem;
      font-weight: 600;
      cursor: pointer;
      transition: var(--transition);
      margin-top: 15px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .book-button:hover {
      background-color: var(--accent-color);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    
    .book-button i {
      margin-right: 10px;
    }
    
    .back-button {
      position: absolute;
      top: 20px;
      left: 20px;
      width: 45px;
      height: 45px;
      border-radius: 50%;
      background-color: white;
      border: none;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      display: flex;
      justify-content: center;
      align-items: center;
      cursor: pointer;
      transition: var(--transition);
      z-index: 10;
    }
    
    .back-button:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    
    .event-image {
      position: absolute;
      top: 20px;
      right: 20px;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      border: 4px solid white;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .alert {
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
      font-weight: 500;
      animation: slideIn 0.3s ease-out;
    }
    
    @keyframes slideIn {
      from { opacity: 0; transform: translateY(-10px); }
      to { opacity: 1; transform: translateY(0); }
    }
    
    .alert-success {
      background-color: rgba(76, 175, 80, 0.2);
      color: #2e7d32;
      border: 1px solid #2e7d32;
    }
    
    .alert-danger {
      background-color: rgba(244, 67, 54, 0.2);
      color: #d32f2f;
      border: 1px solid #d32f2f;
    }
    
    .full-day-note {
      background-color: rgba(255, 193, 7, 0.2);
      color: #ff8f00;
      border: 1px solid #ff8f00;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
      font-weight: 500;
    }
    
    /* Responsive Design */
    @media (max-width: 992px) {
      .booking-card {
        grid-template-columns: 1fr;
        max-width: 600px;
      }
      
      .event-title {
        font-size: 1.8rem;
      }
      
      .booking-title {
        font-size: 1.6rem;
      }
    }
    
    @media (max-width: 768px) {
      .slots-grid {
        grid-template-columns: repeat(2, 1fr);
      }
      
      .event-details-section, .booking-section {
        padding: 30px;
      }
      
      .event-image {
        width: 70px;
        height: 70px;
      }
    }
    
    @media (max-width: 576px) {
      .slots-grid {
        grid-template-columns: 1fr;
      }
      
      .event-details-section, .booking-section {
        padding: 25px;
      }
      
      .event-title {
        font-size: 1.6rem;
      }
      
      .booking-title {
        font-size: 1.4rem;
      }
      
      .event-image {
        width: 60px;
        height: 60px;
        top: 15px;
        right: 15px;
      }
      
      .back-button {
        width: 40px;
        height: 40px;
        top: 15px;
        left: 15px;
      }
    }
  </style>
</head>
<body>
  <div class="booking-card">
    <button class="back-button" onclick="goBack()">
      <i class="fas fa-arrow-left" style="color: var(--primary-color);"></i>
    </button>
    
    <div class="event-details-section">
      <h1 class="event-title"><%= details.getDetail_type() %></h1>
      <p class="event-description"><%= details.getDetail_description() %></p>
      
      <div class="event-meta">
        <% if(details.getRoom_capacity() > 0) { %>
        <div class="meta-item">
          <div class="meta-icon">
            <i class="fas fa-users"></i>
          </div>
          <div class="meta-text">Capacity: <%= details.getRoom_capacity() %> members</div>
        </div>
        <% } %>
        
        <div class="meta-item">
          <div class="meta-icon">
            <i class="fas fa-tag"></i>
          </div>
          <div class="meta-text">Price: ₹<%= details.getPrice() %></div>
        </div>
      </div>
    </div>
    
    <div class="booking-section">
      <img class="event-image" src="/EventManagementApp/img/<%= details.getImage_url() %>" alt="<%= details.getDetail_type() %>">
      
      <h2 class="booking-title">Book Your Event</h2>
      
      <% if(request.getAttribute("success") != null) { %>
        <div class="alert alert-success">
          <i class="fas fa-check-circle"></i> <%= request.getAttribute("success") %>
        </div>
      <% } %>
      
      <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-danger">
          <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %>
        </div>
      <% } %>
      
      <form action="addBookings" method="post" onsubmit="return prepareBookingData()">
        <input type="hidden" name="eventId" value="<%= details.getEvent_id() %>"/>
        <input type="hidden" name="detailId" value="<%= details.getDetail_id() %>"/>
        
        <div class="form-group">
          <label class="form-label" for="bookingDate">
            <i class="far fa-calendar-alt"></i> Select Event Date
          </label>
          <input type="date" id="bookingDate" name="bookingDate" class="date-input" onchange="checkFullDayAndFetchSlots()" required min="" max="" />
        </div>
        
        <% if (!isFullDay) { %>
          <div class="slots-container">
            <h3 class="slots-title">Available Time Slots</h3>
            <div class="slots-grid" id="slotsContainer">
              <div class="slot-option">
                <input type="radio" id="slot1" name="slot" value="09:00,11:00" data-slot="09:00,11:00" class="slot"/>
                <label for="slot1">9:00 AM - 11:00 AM</label>
              </div>
              <div class="slot-option">
                <input type="radio" id="slot2" name="slot" value="11:30,13:30" data-slot="11:30,13:30" class="slot"/>
                <label for="slot2">11:30 AM - 1:30 PM</label>
              </div>
              <div class="slot-option">
                <input type="radio" id="slot3" name="slot" value="14:00,16:00" data-slot="14:00,16:00" class="slot"/>
                <label for="slot3">2:00 PM - 4:00 PM</label>
              </div>
              <div class="slot-option">
                <input type="radio" id="slot4" name="slot" value="16:30,18:30" data-slot="16:30,18:30" class="slot"/>
                <label for="slot4">4:30 PM - 6:30 PM</label>
              </div>
              <div class="slot-option">
                <input type="radio" id="slot5" name="slot" value="19:00,21:00" data-slot="19:00,21:00" class="slot"/>
                <label for="slot5">7:00 PM - 9:00 PM</label>
              </div>
            </div>
          </div>
        <% } else { %>
          <input type="hidden" name="slot" value="06:00,06:00" />
          <div class="full-day-note">
            <i class="fas fa-info-circle"></i> <b>Note:</b> Full-day event selected. Booking time will be from 6:00 AM to next day 6:00 AM.
          </div>
        <% } %>
        
        <button type="submit" class="book-button">
          <i class="fas fa-calendar-check"></i> Book Now
        </button>
      </form>
    </div>
  </div>

  <script>
    function checkFullDayAndFetchSlots() {
      const selectedDate = document.getElementById("bookingDate").value;
      const isFullDay = <%= isFullDay %>;
      const detailId = '<%= details.getDetail_id() %>';

      if (!isFullDay && selectedDate) {
        fetch(`checkBookedSlots?date=${selectedDate}&detailId=${detailId}`)
          .then(response => response.json())
          .then(disabledSlots => {
            console.log("Disabled slots from backend:", disabledSlots);

            document.querySelectorAll('input[name="slot"]').forEach(slot => {
              const slotValue = slot.getAttribute('data-slot');
              const shouldDisable = disabledSlots.includes(slotValue);

              slot.disabled = shouldDisable;

              if (shouldDisable) {
                slot.parentElement.classList.add("disabled");
              } else {
                slot.parentElement.classList.remove("disabled");
              }
            });
          })
          .catch(err => console.error("Error fetching slots:", err));
      }
    }

    window.onload = function () {
      const today = new Date();
      const sixMonthsLater = new Date();
      sixMonthsLater.setMonth(today.getMonth() + 6);

      const format = (d) => d.toISOString().split("T")[0];

      document.getElementById("bookingDate").min = format(today);
      document.getElementById("bookingDate").max = format(sixMonthsLater);
    };

    function goBack() {
      window.history.back();
      window.history.back();
    }
    
    function prepareBookingData() {
      // You can add any additional validation or data preparation here
      return true;
    }
  </script>
</body>
</html>

