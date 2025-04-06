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
    <title>Bookings</title>
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
      * {
        font-family: sans-serif;
        margin: 0;
      }
      body {
        overflow: hidden;
      }
      .container {
        height: 100vh;
        width: 100%;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .text-container {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        height: 50vh;
        width: 45%;
        padding: 40px;
      }
      .img-container {
        width: 50%;
        height: 100%;
      }
      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        border-radius: 50px 0px 0px 50px;
      }
      .dateTime {
        display: flex;
        justify-content: space-between;
        width: 60%;
      }
      .btn {
        width: 150px;
        height: 40px;
        font-size: 20px;
        border-radius: 8px;
        margin-left:400px;
      }
      .back{
      	width: 50px;
      	height: 50px;
      	border: 2px solid black;
      	border-radius: 50%;
      	font-size: 20px;
      	padding:7px;
      }
    </style>
  </head>
  <body>
  	
    <div class="container">
      <div class="text-container">
      <center>
      <%EventDetails details=(EventDetails)session.getAttribute("eventDetails");
	  String success=(String)request.getAttribute("success");
      if(success!=null){%>
      	<h3 style="color:green"><%=success %></h3>
      <%} %>
      <%String error=(String)request.getAttribute("error");
      if(error!=null){%>
      	<h3 style="color:red"><%=error %></h3>
      <%} %>
      </center>
        <h1><%=details.getDetail_type() %></h1>
        <p>
          <%=details.getDetail_description() %>
        </p>
        <p>Capacity: <%=details.getRoom_capacity() %> members</p>
        <p>Price: <%=details.getPrice() %></p>
        <form action="addBookings" method="post">
          <p class="dateTime">
            <label for="startDate">Enter Start Date and Time</label>
            <input id="startDate" type="date" name="startDate" /><input type="time" name="startTime" />
          </p>
          <br />
          <p class="dateTime">
            <label for="startDate">Enter End Date and Time</label>
            <input id="startDate" type="date" name="endDate" /><input type="time" name="endTime" />
          </p><br><br>
          <button class="back"  onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: rgb(97, 97, 97);"></i></button>
          <input class="btn" type="submit" value="submit" />
          
        </form>
      </div>
      <div class="img-container">
        <img src="/EventManagementApp/img/<%=details.getImage_url() %>" alt="" />
      </div>
    </div>
    <script>
      function goBack() {
        window.history.back();
      }
    </script>
  </body>
</html>
