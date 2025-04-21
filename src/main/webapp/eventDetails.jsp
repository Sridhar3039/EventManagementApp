<%@page import="com.event.dto.Users"%>
<%@page import="com.event.dto.EventDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Event Details</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
      integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/js/all.min.js"
      integrity="sha512-b+nQTCdtTBIRIbraqNEwsjB6UvL3UEMkXnhzd8awtCYh0Kcsjl9uEgwVFVbhoj3uu1DO1ZMacNvLoyJJiNfcvg=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    ></script>
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
    	body {
    background-image: url("/EventManagementApp/img/eventDetails_bg.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
}

.container {
    width: 80%; /* Reduced from 90% */
    max-width: 1000px; /* Reduced from 1200px */
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    margin: 80px auto;
    border-radius: 20px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
    background-color: rgb(154, 194, 235);
    overflow: hidden;
    min-height: 400px;
}

.text-container {
    width: 50%;
    padding: 30px;
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.text-container h1 {
    margin-top: 0;
    font-size: 2.2rem;
    color: #333;
}

.text-container p {
    line-height: 1.6;
    margin-bottom: 25px;
    color: #333;
}

.container img {
    width: 50%;
    height: 400px; /* Fixed height for all images */
    object-fit: cover;
    border-radius: 0px 20px 20px 0px;
}

.btn {
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    background-color: rgb(59, 121, 183);
    color: white;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    max-width: 200px;
}

.btn:hover {
    background-color: rgb(89, 147, 206);
}

.back {
      width: 50px;
      height: 50px;
      border: 2px solid var(--primary-color);
      color: var(--primary-color);
      border-radius: 50%;
      font-size: 24px;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      position: fixed;
      top: 30px;
      left: 30px;
      background: white;
      cursor: pointer;
      z-index: 100;
      transition: all 0.3s;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
    }
    
    .back:hover {
      background-color: var(--primary-color);
      color: white;
      transform: translateY(-3px);
    }
.add {
      width: 50px;
      height: 50px;
      border: 2px solid var(--primary-color);
      color: var(--primary-color);
      border-radius: 10px;
      font-size: 24px;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      position: fixed;
      top: 30px;
      right: 50px;
      background: white;
      cursor: pointer;
      z-index: 100;
      transition: all 0.3s;
      box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.add:hover {
      background-color: var(--primary-color);
      color: white;
      transform: translateY(-3px);
}

.update {
    text-decoration: none;
    background-color: rgb(65, 65, 142);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    display: block;
    text-align: center;
    width: 250px;
    margin-bottom: 15px;
    transition: background-color 0.3s ease;
}

.update:hover {
    background-color: rgb(85, 85, 182);
}

.delete {
    text-decoration: none;
    background-color: rgb(162, 34, 34);
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    display: block;
    text-align: center;
    width: 150px;
    transition: background-color 0.3s ease;
}

.delete:hover {
    background-color: rgb(192, 64, 64);
}

/* Media Queries for Responsive Design */
@media screen and (max-width: 992px) {
    .container {
        width: 85%;
    }
    
    .text-container h1 {
        font-size: 1.8rem;
    }
}

@media screen and (max-width: 768px) {
    .container {
        flex-direction: column-reverse;
        margin: 70px auto;
    }
    
    .text-container, .container img {
        width: 100%;
    }
    
    .container img {
        height: 300px; /* Maintain consistent height in mobile view */
        border-radius: 20px 20px 0 0;
    }
    
    .update, .delete {
        width: 100%;
        max-width: 250px;
    }
}

@media screen and (max-width: 576px) {
    .back, .add {
        width: 40px;
        height: 40px;
        font-size: 20px;
        top: 15px;
    }
    
    .back {
        width: 40px;
        height: 40px;
        top: 15px;
      }
    
    .add {
        right: 15px;
    }
    
    .text-container {
        padding: 20px;
    }
    
    .text-container h1 {
        font-size: 1.5rem;
    }
    
    .container {
        margin-top: 60px;
        width: 90%; /* Adjusted for very small screens */
    }
    
    .btn, .update, .delete {
        padding: 10px 15px;
        font-size: 0.9rem;
    }
    
    .container img {
        height: 250px; /* Smaller height for very small screens */
    }
}

/* Enhanced styling for update and delete buttons */
.action-buttons {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 15px;
    margin-top: 20px;
    width: 100%;
}

.update {
    text-decoration: none;
    background-color: #3b79b7;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    display: block;
    text-align: center;
    width: 100%;
    max-width: 250px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.update:hover {
    background-color: #2d5f91;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

.delete {
    text-decoration: none;
    background-color: #d32f2f;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 8px;
    display: block;
    text-align: center;
    width: 100%;
    max-width: 250px;
    font-weight: 600;
    letter-spacing: 0.5px;
    transition: all 0.3s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.delete:hover {
    background-color: #b71c1c;
    transform: translateY(-2px);
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}

/* Add a confirmation dialog style */
.confirm-dialog {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1000;
    display: none;
}

.dialog-content {
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    text-align: center;
    max-width: 400px;
    width: 90%;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
}

.dialog-content h3 {
    margin-top: 0;
    color: #333;
}

.dialog-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
}

.dialog-buttons button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
}

.confirm-btn {
    background-color: #d32f2f;
    color: white;
}

.confirm-btn:hover {
    background-color: #b71c1c;
}

.cancel-btn {
    background-color: #757575;
    color: white;
}

.cancel-btn:hover {
    background-color: #616161;
}


    </style>
  </head>
  <body>
  <button class="back" onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: inherit;"></i></button>
  	<% Users users = (Users)session.getAttribute("users");
  	if(users != null && users.getRole() != null && !users.getRole().equals("User")) { %>
	<a class="add" href="addevents.jsp"><i class="fa-solid fa-plus" style="color:  inherit;"></i></a>		
	<%}
  		int event_id=(int)session.getAttribute("event_id");
  		 
  		EventDetailsDAO ed=new EventDetailsDAOImpl();
  		ArrayList<EventDetails> detailsList=ed.getEvents(event_id);
  		for(EventDetails eventDetails:detailsList){  %>
  	  
  	
  	<div class="container">
        <div class="text-container">
            <h1><%=eventDetails.getDetail_type() %></h1>
            <p><%=eventDetails.getDetail_description() %></p>
     
            <%if(users != null && users.getRole() != null && !users.getRole().equals("Admin")) { %>
            <form action="bookings" method="post">
          		<input type="hidden" value="<%=eventDetails.getDetail_id() %>" name="detail_id" />
          		<input type="submit" value="Book Now" class="btn" />
       		 </form>
       		<%} %>
       		<%if(users == null) { %>
            <form action="bookings" method="post">
          		<input type="hidden" value="<%=eventDetails.getDetail_id() %>" name="detail_id" />
          		<input type="submit" value="Book Now" class="btn" />
       		 </form>
       		<%} %>
       		
       		<%if(users != null && users.getRole() != null && !users.getRole().equals("User")) { %>
                <div class="action-buttons">
                    <form action="update" method="post">
                        <input type="hidden" name="detail_id" value="<%=eventDetails.getDetail_id()%>">
                        <input class="update" type="submit" value="Update Event Details">
                    </form>
                    
                     <!-- Pass the detail_id to the JavaScript function -->
            <button class="delete" onclick="showDeleteConfirmation(<%=eventDetails.getDetail_id()%>)">Delete Event</button>
                </div>
                
                
            <%} %>
            
        </div>
        <img src="/EventManagementApp/img/<%=eventDetails.getImage_url()%>" alt="" height="100%">
        
    </div>
    <%} %>

   <!-- Delete confirmation dialog - outside the loop -->
<div id="deleteConfirmDialog" class="confirm-dialog">
    <div class="dialog-content">
        <h3>Confirm Deletion</h3>
        <p>Are you sure you want to delete this event? This action cannot be undone.</p>
        <div class="dialog-buttons">
            <form action="deleteEvent" method="post" id="deleteForm">
                <input type="hidden" name="detail_id" id="deleteDetailId" value="">
                <button type="submit" class="confirm-btn">Yes, Delete</button>
            </form>
            <button class="cancel-btn" onclick="hideDeleteConfirmation()">Cancel</button>
        </div>
    </div>
</div>

<script>
  function goBack() {
    window.history.back();
  }

  function showDeleteConfirmation(detailId) {
    // Set the detail_id in the hidden form field
    document.getElementById('deleteDetailId').value = detailId;
    // Show the dialog
    document.getElementById('deleteConfirmDialog').style.display = 'flex';
  }
  
  function hideDeleteConfirmation() {
    document.getElementById('deleteConfirmDialog').style.display = 'none';
  }
</script>
  </body>
</html>
