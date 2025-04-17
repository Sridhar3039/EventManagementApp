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
    border: 2px solid rgb(97, 97, 97);
    color: rgb(97, 97, 97);
    border-radius: 50%;
    font-size: 30px;
    padding: 7px;
    position: fixed;
    top: 30px;
    left: 30px;
    background: none;
    cursor: pointer;
    z-index: 100;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease;
}

.back:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

.add {
    width: 50px;
    height: 50px;
    border: 2px solid rgb(97, 97, 97);
    color: rgb(97, 97, 97);
    border-radius: 8px;
    font-size: 30px;
    padding: 7px;
    position: fixed;
    top: 30px;
    right: 30px;
    background: none;
    cursor: pointer;
    z-index: 100;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: all 0.3s ease;
}

.add:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

.update {
    text-decoration: none;
    background-color: rgb(65, 65, 142);
    color: white;
    padding: 12px 20px;
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
        left: 15px;
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


    </style>
  </head>
  <body>
  	<% Users users = (Users)session.getAttribute("users");
  		int event_id=(int)session.getAttribute("event_id");
  		EventDetailsDAO ed=new EventDetailsDAOImpl();
  		ArrayList<EventDetails> detailsList=ed.getEvents(event_id);
  		for(EventDetails eventDetails:detailsList){
  	   if(users != null && users.getRole() != null && !users.getRole().equals("User")) { %>
		<form action="" method="post">
			<input type="hidden" name="event_id" value="<%=event_id%>" >
			<button class="add"><i class="fa-solid fa-plus" style="color: rgb(97, 97, 97);"></i></button>
		</form>
	<%} %>
  	<button class="back"  onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: rgb(97, 97, 97);"></i></button>
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
       		<form action="update" method="post">
       		<center>
       		<input type="hidden" name="detail_id" value="<%=eventDetails.getDetail_id()%>">
       		<input class="update"  type="submit" value="Update">
           <!--  <a class="update" href="#">Update</a>
            <a class="delete" href="">Delete</a> -->
            
            </center>
            </form>
       		<%} %>
        </div>
        <img src="/EventManagementApp/img/<%=eventDetails.getImage_url()%>" alt="" height="100%">
        
    </div>
    <%} %>
    <script>
      function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
