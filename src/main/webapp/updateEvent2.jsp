<%@page import="com.event.dto.Users"%>
<%@page import="com.event.dto.EventDetails"%>
<%@page import="com.event.dao.EventDetailsDAOImpl"%>
<%@page import="com.event.dao.EventDetailsDAO"%>
<%@page import="com.event.dto.Events"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventsDAOImpl"%>
<%@page import="com.event.dao.EventsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Events</title>
<link rel="stylesheet" href="/EventManagementApp/css/dashboard.css" />
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
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"
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

.text-container input {
    margin-top: 0;
    font-size: 1.5rem;
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
    top: 110px;
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
    
    .text-container input {
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
<nav>
      <div class="logo">
        <!-- <img src="/EventManagementApp/img/eventLogo.png" alt="" height="50px" /> -->
        <h1>Vibrance</h1>
      </div>
      <div>
        <input class="search" type="search" placeholder="Search events" />
        <i class="fa-solid fa-magnifying-glass search-icon" style="color: #6c6c6c;"></i>
      </div>
      <div id="menuList">
        <a href="pendingorder.jsp">Pending Orders</a>
        <a href="viewuser.jsp">View Users</a>
        <a href="addevents.jsp">Add Events</a>
        <a href="updateEvent.jsp">Update Events</a>
        <a href="deleteEvents.jsp">Delete Events</a>
        <a href="logout">Logout</a>
      </div>
      <div class="menu-icon">
        <i class="fa-solid fa-bars" onclick="toggleMenu()"></i>
      </div>
    </nav>
    
   
  	<button class="back"  onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: rgb(97, 97, 97);"></i></button>
  	
  	 <%String success=(String)request.getAttribute("udsuccess");
      		if(success!=null){%>
      		<h3 style="color:green"><%=success %></h3>
      	  <%} %>
         <%String error=(String)request.getAttribute("udfail");
      		if(error!=null){%>
      		<h3 style="color:red"><%=error %></h3>
      	  <%} %>
      	  
  	<div class="container">
        <div class="text-container">
          
            
            <%
      int detail_id=(int)session.getAttribute("detail_id1");
      if(detail_id!=0){
		EventDetailsDAO ed1=new EventDetailsDAOImpl();
		EventDetails eventDetail=ed1.getEventDetails(detail_id);
		{%>
  		<form action="updateEventDetails" method="post">
   <input type="hidden" name="detail_id" value="<%=eventDetail.getDetail_id()%>">
    <input type="hidden" name="event_id" value="<%=eventDetail.getEvent_id()%>">
     <input type="text" name="detail_type" value="<%=eventDetail.getDetail_type() %>">
     <textarea name="detail_description" rows="" cols=""><%=eventDetail.getDetail_description()%></textarea>
       <input type="tel" name="price" value="<%=eventDetail.getPrice() %>">
        <input type="tel" name="room_capacity" value="<%=eventDetail.getRoom_capacity() %>">
         <input type="text" name="image_url" value="<%=eventDetail.getImage_url()%>">
         <button class="update" type="submit">Update</button>
         <br>
         <br>
         </form>
    
   

       		
       		
       		
        </div>
        <img src="/EventManagementApp/img/<%=eventDetail.getImage_url()%>" alt="" height="100%">
         <%} %>
    <%} %>
        
    </div>
    
    <script>
      function goBack() {
        window.history.back();
      }
    </script>
    
    
      
     <script>
      let menuList = document.getElementById("menuList");
      menuList.style.maxHeight = "0px";
      function toggleMenu() {
        if (menuList.style.maxHeight == "0px") {
          menuList.style.maxHeight = "100vh";
        } else {
          menuList.style.maxHeight = "0px";
        }
      }
    </script>

</body>
</html>