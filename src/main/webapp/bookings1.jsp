<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.event.dto.EventDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventDetailsDAOImpl"%>
<%@page import="com.event.dao.EventDetailsDAO"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Booking</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style><body> 
    <button class="back-btn" onclick="goBack()">
        <i class="fas fa-arrow-left"></i>
    </button>
    
    <div class="container">
        <div class="text-container">
            <%EventDetails details=(EventDetails)session.getAttribute("eventDetails");
            String success=(String)request.getAttribute("success");
            if(success!=null){%>
                <div class="success-message"><%=success %></div>
            <%} %>
            <%String error=(String)request.getAttribute("error");
            if(error!=null){%>
                <div class="error-alert"><%=error %></div>
            <%} %>
            
            <div class="event-details">
                <h1 class="event-title"><%=details.getDetail_type() %></h1>
                <p class="event-description"><%=details.getDetail_description() %></p>
                
                <div class="event-meta">
                    <div class="meta-item">
                        <i class="fas fa-users"></i>
                        <span>Capacity: <%=details.getRoom_capacity() %> members</span>
                    </div>
                    <div class="meta-item">
                        <i class="fas fa-tag"></i>
                        <span>Price: $<%=details.getPrice() %></span>
                    </div>
                </div>
            </div>
            
            <!-- Enhanced Booking System -->
            <div class="booking-system">
                <h2 class="booking-title">Book Your Event</h2>
                
                <div class="booking-progress" id="bookingProgress">
                    <div class="progress-bar" id="progressBar"></div>
                </div>
                
                <form id="bookingForm" action="addBookings" method="post">
                    <div class="date-selection">
                        <label for="appointmentDate">
                            <i class="far fa-calendar-alt"></i> Select Event Date
                        </label>
                        <input type="date" id="appointmentDate" name="appointmentDate" required>
                    </div>
                    
                    <div class="time-slots-container" id="timeSlotsContainer">
                        <div class="selected-date" id="selectedDateDisplay"></div>
                        <h3 class="time-slots-header">Available Time Slots</h3>
                        <div class="time-slots-grid" id="timeSlotsGrid"></div>
                        
                        <input type="hidden" id="startDate" name="startDate">
                        <input type="hidden" id="startTime" name="startTime">
                        <input type="hidden" id="endDate" name="endDate">
                        <input type="hidden" id="endTime" name="endTime">
                        <input type="hidden" id="eventId" name="eventId" value="<%=details.getDetail_id()%>">
                        
                        <div class="booking-actions">
                            <button type="button" id="submitBtn" class="submit-btn" disabled onclick="showConfirmation()">
                                Confirm Booking
                            </button>
                        </div>
                        <div class="error-message" id="errorMessage"></div>
                    </div>
                </form>
            </div>
        </div>
        <div class="img-container">
            <img src="/EventManagementApp/img/<%=details.getImage_url() %>" alt="<%=details.getDetail_type() %>" />
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
                        <span><%=details.getDetail_type() %></span>
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
                        <span>$<%=details.getPrice() %></span>
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
  
              console.log(Selected date: ${formattedDate});
  
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
                              slotElement.innerHTML = <span>${slot.start} - ${slot.end}</span><small>Booked</small>;
                          } else {
                              slotElement.textContent = ${slot.start} - ${slot.end};
                              slotElement.dataset.start = slotStartTime;
                              slotElement.dataset.end = convertTo24Hour(slot.end);
                              slotElement.dataset.startDisplay = slot.start;
                              slotElement.dataset.endDisplay = slot.end;
                              
                              slotElement.addEventListener('click', function() {
                                  if (!this.classList.contains('booked')) {
                                      document.querySelectorAll('.time-slot').forEach(el => {
                                          el.classList.remove('selected');
                                      });
                                      this.classList.add('selected');
                                      
                                      document.getElementById('startDate').value = formattedDate;
                                      document.getElementById('startTime').value = this.dataset.start;
                                      document.getElementById('endDate').value = formattedDate;
                                      document.getElementById('endTime').value = this.dataset.end;
                                      
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
              console.log(Generating slots for: ${day}/${month}/${year});
              
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
                  return "00:00";
              }
              
              const [time, period] = timeStr.split(' ');
              if (!time || !period) {
                  console.error("Invalid time format:", timeStr);
                  return "00:00";
              }
              
              let [hours, minutes] = time.split(':');
              
              if (period === 'PM' && hours !== '12') {
                  hours = parseInt(hours) + 12;
              }
              if (period === 'AM' && hours === '12') {
                  hours = '00';
              }
              
              // Ensure two digits
              hours = hours.toString().padStart(2, '0');
              
              return ${hours}:${minutes};
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