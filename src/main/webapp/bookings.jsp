<%@page import="com.event.dto.EventDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventDetailsDAOImpl"%>
<%@page import="com.event.dao.EventDetailsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Your Event</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
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
        padding: 40px;
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
      
      .booking-progress {
        height: 6px;
        background-color: #e0e0e0;
        border-radius: 3px;
        margin-bottom: 25px;
        overflow: hidden;
        display: none;
      }
      
      .progress-bar {
        height: 100%;
        background-color: var(--primary-color);
        width: 0%;
        transition: width 0.5s ease;
      }
      
      .time-slots-container {
        margin-top: 20px;
      }
      
      .selected-date {
        font-weight: 600;
        margin-bottom: 15px;
        color: var(--accent-color);
      }
      
      .time-slots-header {
        font-size: 1.1rem;
        margin-bottom: 15px;
        color: var(--text-color);
      }
      
      .time-slots-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 12px;
      }
      
      .time-slot {
        padding: 12px 10px;
        background-color: var(--secondary-color);
        color: var(--text-color);
        border-radius: 8px;
        text-align: center;
        cursor: pointer;
        transition: var(--transition);
        font-weight: 500;
        border: 2px solid transparent;
        position: relative;
      }
      
      .time-slot:hover {
        background-color: #d0e2f5;
        transform: translateY(-2px);
      }
      
      .time-slot.selected {
        background-color: var(--primary-color);
        color: white;
        border-color: var(--accent-color);
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }
      
      .time-slot.booked {
        background-color: #f0f0f0;
        color: #999;
        cursor: not-allowed;
        opacity: 0.7;
      }
      
      .time-slot.booked small {
        display: block;
        font-size: 0.8rem;
        margin-top: 5px;
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
      
      .book-button:disabled {
        background-color: #cccccc;
        cursor: not-allowed;
        transform: none;
        box-shadow: none;
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
      
      .error-message {
        color: #d32f2f;
        margin-top: 10px;
        font-size: 0.9rem;
        display: none;
      }
      
      .no-slots-message {
        text-align: center;
        padding: 15px;
        background-color: rgba(0, 0, 0, 0.05);
        border-radius: 8px;
        margin-top: 10px;
        color: #555;
      }
      
      /* Modal Styles */
      .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
        z-index: 1000;
        animation: fadeIn 0.3s ease-out;
      }
      
      .modal-content {
        background-color: white;
        border-radius: var(--border-radius);
        width: 90%;
        max-width: 500px;
        box-shadow: var(--box-shadow);
        overflow: hidden;
        animation: scaleIn 0.3s ease-out;
      }
      
      @keyframes scaleIn {
        from { transform: scale(0.9); opacity: 0; }
        to { transform: scale(1); opacity: 1; }
      }
      
      .modal-header {
        padding: 20px;
        background-color: var(--primary-color);
        color: white;
      }
      
      .modal-title {
        font-size: 1.5rem;
        margin: 0;
      }
      
      .modal-body {
        padding: 20px;
      }
      
      .booking-details {
        margin-bottom: 20px;
      }
      
      .detail-item {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #eee;
      }
      
      .detail-item:last-child {
        border-bottom: none;
      }
      
      .modal-footer {
        padding: 15px 20px;
        background-color: #f5f5f5;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
      }
      
      .modal-btn {
        padding: 10px 20px;
        border-radius: 4px;
        font-weight: 600;
        cursor: pointer;
        transition: var(--transition);
      }
      
      .cancel-btn {
        background-color: #f5f5f5;
        color: #555;
        border: 1px solid #ddd;
      }
      
      .cancel-btn:hover {
        background-color: #e0e0e0;
      }
      
      .confirm-btn {
        background-color: var(--primary-color);
        color: white;
        border: none;
      }
      
      .confirm-btn:hover {
        background-color: var(--accent-color);
      }
      
      .spinner {
        display: inline-block;
        width: 16px;
        height: 16px;
        border: 2px solid rgba(255, 255, 255, 0.3);
        border-radius: 50%;
        border-top-color: white;
        animation: spin 1s linear infinite;
        margin-right: 8px;
      }
      
      @keyframes spin {
        to { transform: rotate(360deg); }
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
        .time-slots-grid {
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
        .time-slots-grid {
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
        
        .meta-icon {
          width: 35px;
          height: 35px;
        }
      }
    </style>
  </head>
  <body>
    <% EventDetails details = (EventDetails)session.getAttribute("eventDetails");
       String success = (String)request.getAttribute("success");
       String error = (String)request.getAttribute("error");
    %>
    
    <div class="booking-card">
      <button class="back-button" onclick="goBack()">
        <i class="fas fa-arrow-left" style="color: var(--primary-color);"></i>
      </button>
      
      <div class="event-details-section">
        <h1 class="event-title"><%= details.getDetail_type() %></h1>
        <p class="event-description"><%= details.getDetail_description() %></p>
        
        <div class="event-meta">
          <div class="meta-item">
            <div class="meta-icon">
              <i class="fas fa-users"></i>
            </div>
            <div class="meta-text">Capacity: <%= details.getRoom_capacity() %> members</div>
          </div>
          
          <div class="meta-item">
            <div class="meta-icon">
              <i class="fas fa-tag"></i>
            </div>
            <div class="meta-text">Price: $<%= details.getPrice() %></div>
          </div>
        </div>
      </div>
      
      <div class="booking-section">
        <img class="event-image" src="/EventManagementApp/img/<%= details.getImage_url() %>" alt="<%= details.getDetail_type() %>">
        
        <h2 class="booking-title">Book Your Event</h2>
        
        <% if(success != null) { %>
          <div class="alert alert-success">
            <i class="fas fa-check-circle"></i> <%= success %>
          </div>
        <% } %>
        
        <% if(error != null) { %>
          <div class="alert alert-danger">
            <i class="fas fa-exclamation-circle"></i> <%= error %>
          </div>
        <% } %>
        
        <div class="booking-progress" id="bookingProgress">
          <div class="progress-bar" id="progressBar"></div>
        </div>
        
        <form action="addBookings" method="post" id="bookingForm">
          <div class="form-group">
            <label class="form-label" for="appointmentDate">
              <i class="far fa-calendar-alt"></i> Select Event Date
            </label>
            <input type="date" id="appointmentDate" class="date-input" name="appointmentDate" required>
          </div>
          
          <div class="time-slots-container" id="timeSlotsContainer">
            <div class="selected-date" id="selectedDateDisplay"></div>
            <h3 class="time-slots-header">Available Time Slots</h3>
            <div class="time-slots-grid" id="timeSlotsGrid"></div>
            
            <input type="hidden" id="startDate" name="startDate">
            <input type="hidden" id="startTime" name="startTime">
            <input type="hidden" id="endDate" name="endDate">
            <input type="hidden" id="endTime" name="endTime">
            <input type="hidden" id="eventId" name="eventId" value="<%= details.getDetail_id() %>">
            
            <div class="booking-actions">
              <button type="button" id="submitBtn" class="book-button" disabled onclick="showConfirmation()">
                <i class="fas fa-calendar-check"></i> Confirm Booking
              </button>
            </div>
            <div class="error-message" id="errorMessage"></div>
          </div>
        </form>
      </div>
    </div>
    
    <!-- Confirmation Modal -->
    <div class="modal" id="confirmationModal">
      <div class="modal-content">
        <div class="modal-header">
          <h2 class="modal-title">Confirm Your Booking</h2>
        </div>
        <div class="modal-body">
          <div class="booking-details">
            <div class="detail-item">
              <strong>Event:</strong>
              <span><%= details.getDetail_type() %></span>
            </div>
            <div class="detail-item">
              <strong>Date:</strong>
              <span id="confirmDate"></span>
            </div>
            <div class="detail-item">
              <strong>Time:</strong>
              <span id="confirmTime"></span>
            </div>
            <div class="detail-item">
              <strong>Price:</strong>
              <span>$<%= details.getPrice() %></span>
            </div>
          </div>
          <p>Please confirm your booking details. Once confirmed, you'll receive a confirmation email.</p>
        </div>
        <div class="modal-footer">
          <button class="modal-btn cancel-btn" onclick="closeModal()">Cancel</button>
          <button class="modal-btn confirm-btn" onclick="submitBooking()">Confirm & Pay</button>
        </div>
      </div>
    </div>

    <script>
      document.addEventListener('DOMContentLoaded', function() {
          console.log("Document loaded");
  
          const dateInput = document.getElementById('appointmentDate');
          const timeSlotsContainer = document.getElementById('timeSlotsContainer');
          const timeSlotsGrid = document.getElementById('timeSlotsGrid');
          const selectedDateDisplay = document.getElementById('selectedDateDisplay');
          const submitBtn = document.getElementById('submitBtn');
          const errorMessage = document.getElementById('errorMessage');
          const bookingProgress = document.getElementById('bookingProgress');
          const progressBar = document.getElementById('progressBar');
  
          // Set minimum date to today
          const today = new Date();
          const tomorrow = new Date(today);
          tomorrow.setDate(tomorrow.getDate() + 1);
          dateInput.min = tomorrow.toISOString().split('T')[0];
          
          // Set maximum date to 6 months from now
          const maxDate = new Date(today);
          maxDate.setMonth(maxDate.getMonth() + 6);
          dateInput.max = maxDate.toISOString().split('T')[0];
  
          // Simulated booked slots database
          const bookedSlots = {
              // Format: 'YYYY-MM-DD': ['10:00', '14:00']
              '2023-12-25': ['10:30', '12:00', '15:00'],
              '2023-12-31': ['18:00', '19:30', '21:00'],
              '2024-01-01': ['10:00', '11:30', '13:00', '14:30', '16:00']
          };
  
          dateInput.addEventListener('change', function() {
              // Show the progress bar immediately
              bookingProgress.style.display = 'block';
              showProgress(30);
              
              const selectedDate = new Date(this.value + 'T00:00:00'); // Add time to ensure correct date parsing
              const day = selectedDate.getDate();
              const month = selectedDate.getMonth() + 1;
              const year = selectedDate.getFullYear();
              const formattedDate = this.value; // YYYY-MM-DD format
  
              console.log(`Selected date: ${formattedDate}`);
  
              // Format date for display
              selectedDateDisplay.textContent = selectedDate.toLocaleDateString('en-US', { 
                  weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
              });
  
              // Clear previous slots
              timeSlotsGrid.innerHTML = '';
              submitBtn.disabled = true;
              errorMessage.style.display = 'none';
  
              // Simulate API call to check availability
              setTimeout(() => {
                  // Generate time slots
                  let timeSlots = generateTimeSlots(day, month, year);
                  console.log("Generated slots:", timeSlots);
                  
                  showProgress(70);
  
                  if (timeSlots && timeSlots.length > 0) {
                      timeSlots.forEach(slot => {
                          const slotElement = document.createElement('div');
                          slotElement.className = 'time-slot';
                          
                          // Check if slot is already booked
                          const slotStartTime = convertTo24Hour(slot.start);
                          const isBooked = bookedSlots[formattedDate] && 
                                          bookedSlots[formattedDate].includes(slotStartTime);
                          
                          if (isBooked) {
                              slotElement.className += ' booked';
                              slotElement.innerHTML = `<span>${slot.start} - ${slot.end}</span><small>Booked</small>`;
                          } else {
                              slotElement.textContent = `${slot.start} - ${slot.end}`;
                              slotElement.dataset.start = slotStartTime;
                              slotElement.dataset.end = convertTo24Hour(slot.end);
                              slotElement.dataset.startDisplay = slot.start;
                              slotElement.dataset.endDisplay = slot.end;
                              
                              // Find this section in the time slot click event handler and modify it:
slotElement.addEventListener('click', function() {
    if (!this.classList.contains('booked')) {
        document.querySelectorAll('.time-slot').forEach(el => {
            el.classList.remove('selected');
        });
        this.classList.add('selected');
        
        // Format date as YYYY-MM-DD
        document.getElementById('startDate').value = formattedDate;
        document.getElementById('endDate').value = formattedDate;
        
        // Make sure time is in 24-hour format (HH:mm)
        // The dataset.start and dataset.end should already be in 24-hour format from the convertTo24Hour function
        document.getElementById('startTime').value = this.dataset.start;
        document.getElementById('endTime').value = this.dataset.end;
        
        console.log("Selected start date/time:", formattedDate, this.dataset.start);
        console.log("Selected end date/time:", formattedDate, this.dataset.end);
        
        submitBtn.disabled = false;
    }
});

                          }
                          
                          timeSlotsGrid.appendChild(slotElement);
                      });
                      
                      // Make sure container is visible
                      timeSlotsContainer.style.display = 'block';
                  } else {
                      errorMessage.textContent = 'No available time slots for this date.';
                      errorMessage.style.display = 'block';
                      timeSlotsContainer.style.display = 'block'; // Show container to display error
                  }
                  
                  showProgress(100);
                  
                  // Hide progress bar after completion
                  setTimeout(() => {
                      bookingProgress.style.display = 'none';
                  }, 500);
                  
              }, 800); // Simulate network delay
          });
  
          function generateTimeSlots(day, month, year) {
              // For debugging
              console.log(`Generating slots for: ${day}/${month}/${year}`);
              
              // Check if it's a weekend
              const date = new Date(year, month - 1, day);
              const isWeekend = date.getDay() === 0 || date.getDay() === 6;
              
              // Check if it's a holiday (simplified example)
              const isHoliday = (month === 12 && day === 25) || // Christmas
                               (month === 1 && day === 1);     // New Year
              
              // If it's a holiday, return limited slots
              if (isHoliday) {
                  return [
                      { start: '12:00 PM', end: '1:00 PM' },
                      { start: '1:30 PM', end: '2:30 PM' },
                      { start: '3:00 PM', end: '4:00 PM' }
                  ];
              }
              
              // If it's a weekend, return weekend slots
              if (isWeekend) {
                  return [
                      { start: '10:00 AM', end: '11:00 AM' },
                      { start: '11:30 AM', end: '12:30 PM' },
                      { start: '1:00 PM', end: '2:00 PM' },
                      { start: '2:30 PM', end: '3:30 PM' },
                      { start: '4:00 PM', end: '5:00 PM' },
                      { start: '5:30 PM', end: '6:30 PM' },
                      { start: '7:00 PM', end: '8:00 PM' }
                  ];
              }
              
              // Regular weekday slots
              return [
                  { start: '9:00 AM', end: '10:00 AM' },
                  { start: '10:30 AM', end: '11:30 AM' },
                  { start: '12:00 PM', end: '1:00 PM' },
                  { start: '1:30 PM', end: '2:30 PM' },
                  { start: '3:00 PM', end: '4:00 PM' },
                  { start: '4:30 PM', end: '5:30 PM' },
                  { start: '6:00 PM', end: '7:00 PM' }
              ];
          }
  
          function convertTo24Hour(timeStr) {
    if (!timeStr) {
        console.error("Invalid time string:", timeStr);
        return "00:00"; // Default value
    }
    
    // Log for debugging
    console.log("Converting time:", timeStr);
    
    const [time, period] = timeStr.split(' ');
    if (!time || !period) {
        console.error("Invalid time format:", timeStr);
        return "00:00"; // Default value
    }
    
    let [hours, minutes] = time.split(':');
    hours = parseInt(hours);
    
    if (period === 'PM' && hours !== 12) {
        hours = hours + 12;
    }
    if (period === 'AM' && hours === 12) {
        hours = 0;
    }
    
    // Ensure two digits
    hours = hours.toString().padStart(2, '0');
    
    // Log the result for debugging
    console.log(`Converted ${timeStr} to ${hours}:${minutes}`);
    
    return `${hours}:${minutes}`;
}
          
          function showProgress(percent) {
              progressBar.style.width = percent + '%';
          }
      });
      
      function goBack() {
          window.history.back();
      }
      
      function showConfirmation() {
          // Get selected date and time
          const dateInput = document.getElementById('appointmentDate');
          const selectedDate = new Date(dateInput.value);
          const formattedDate = selectedDate.toLocaleDateString('en-US', { 
              weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' 
          });
          
          // Get selected time slot
          const selectedSlot = document.querySelector('.time-slot.selected');
          if (!selectedSlot) {
              alert("Please select a time slot first");
              return;
          }
          
          const timeRange = selectedSlot.textContent;
          
          // Update confirmation modal
          document.getElementById('confirmDate').textContent = formattedDate;
          document.getElementById('confirmTime').textContent = timeRange;
          
          // Show modal
          document.getElementById('confirmationModal').style.display = 'flex';
      }
      
      function closeModal() {
          document.getElementById('confirmationModal').style.display = 'none';
      }
      
      function submitBooking() {
          // Show loading state
          const confirmBtn = document.querySelector('.confirm-btn');
          const originalText = confirmBtn.textContent;
          confirmBtn.innerHTML = '<span class="spinner"></span> Processing...';
          confirmBtn.disabled = true;
          
          // Simulate transaction processing
          setTimeout(() => {
              try {
                  // Submit the form
                  document.getElementById('bookingForm').submit();
              } catch (error) {
                  console.error("Error submitting form:", error);
                  confirmBtn.innerHTML = originalText;
                  confirmBtn.disabled = false;
                  alert("There was an error processing your booking. Please try again.");
              }
          }, 1500);
      }
      
      // Close modal if user clicks outside of it
      window.onclick = function(event) {
          const modal = document.getElementById('confirmationModal');
          if (event.target === modal) {
              closeModal();
          }
      }
    </script>
  </body>
</html>


