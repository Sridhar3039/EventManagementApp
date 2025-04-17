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
    	body{
    		background-image: url("/EventManagementApp/img/eventDetails_bg.jpg");
    		background-repeat: no-repeat;
  			background-size: 100% 100vh;
  			background-attachment: fixed;
    	}
        .container{
            height: 70vh;
            width: 80%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 auto;
            margin-top: 20px;
            margin-bottom: 230px;
            border-radius: 20px;
            box-shadow: 0px 0px 20px gray;
            background-color: rgb(154, 194, 235);
        }
        .text-container{
            width: 50%;
            margin: 0 auto;
            padding:20px;
            color: white;
        }
        img{
            object-fit: fill;
            border-radius: 0px 20px 20px 0px;
        }
        .btn{
        	padding:10px 13px;
        	border: none;
        	border-radius:8px;
        	background-color: rgb(59, 121, 183);
      		color: white;
      		cursor: pointer;
      		
        }
        .btn:hover{
        	background-color: rgb(89, 147, 206);
        }
        .back{
      	width: 50px;
      	height: 50px;
      	border: 2px solid rgb(97, 97, 97);
        color: rgb(97, 97, 97);
      	border-radius: 50%;
      	font-size: 30px;
      	padding:7px;
        position: fixed;
        top: 30px;
        left: 30px;
        background: none;
        cursor: pointer;
      }
      .add{
      	width: 50px;
      	height: 50px;
      	border: 2px solid rgb(97, 97, 97);
        color: rgb(97, 97, 97);
      	border-radius: 8px;
      	font-size: 30px;
      	padding: 7px;
      	position: fixed;
      	align-items: center;
      	position: fixed;
      	top: 30px;
      	right: 30px;
      	background: none;
      	cursor: pointer;

      }
      .update{
      	text-decoration: none;
      	background-color: rgb(65, 65, 142);
      	color: white;
      	padding: 8px 10px;
      	border-radius: 8px;
      	display: block;
      	text-align: center;
      	width: 250px;
      	margin-bottom: 10px;
      }
      .delete{
      	text-decoration: none;
      	background-color: rgb(162, 34, 34);
      	color: white;
      	padding: 8px 10px;
      	border-radius: 8px;
      	display: block;
      	text-align: center;
      	width: 150px;
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
