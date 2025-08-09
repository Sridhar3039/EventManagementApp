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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Events</title>
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
      position: relative;
    }
    .container {
      width: 90%;
      max-width: 1100px;
      background-color: var(--light-bg);
      border-radius: var(--border-radius);
      overflow: hidden;
      box-shadow: var(--box-shadow);
      display: grid;
      grid-template-columns: 1fr 1fr;
      position: relative;
      animation: fadeIn 0.6s ease-out;
      margin: 80px auto;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .text-container {
      padding: 40px;
      background-color: var(--secondary-color);
      position: relative;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    
    .text-container::before {
      content: '';
      position: absolute;
      top: -50px;
      right: -50px;
      width: 100px;
      height: 100px;
      background-color: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
    }

    .text-container h2 {
      font-size: 2rem;
      margin-bottom: 20px;
      color: var(--text-color);
      position: relative;
      padding-bottom: 15px;
    }
    
    .text-container h2::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 80px;
      height: 4px;
      background-color: var(--primary-color);
      border-radius: 2px;
    }

    .container img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    
    .form-group {
      margin-bottom: 20px;
    }
    
    .form-label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: var(--text-color);
    }
    
    .form-control {
      width: 100%;
      padding: 12px 15px;
      border: 2px solid rgba(255, 255, 255, 0.3);
      border-radius: 8px;
      background-color: rgba(255, 255, 255, 0.8);
      font-size: 1rem;
      transition: var(--transition);
    }
    
    .form-control:focus {
      outline: none;
      border-color: var(--primary-color);
      box-shadow: 0 0 0 3px rgba(59, 121, 183, 0.2);
    }
    
    textarea.form-control {
      min-height: 120px;
      resize: vertical;
    }

    .btn {
      padding: 14px 24px;
      border: none;
      border-radius: 8px;
      background-color: var(--primary-color);
      color: white;
      cursor: pointer;
      font-size: 1rem;
      font-weight: 600;
      transition: var(--transition);
      text-align: center;
      display: inline-block;
      text-decoration: none;
      margin-top: 10px;
    }

    .btn:hover {
      background-color: var(--accent-color);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    
    .btn-update {
      background-color: var(--accent-color);
      width: 100%;
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
      left: 20px;
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
    
    .alert {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 8px;
      font-weight: 500;
    }
    
    .alert-success {
      background-color: rgba(40, 167, 69, 0.2);
      border: 1px solid rgba(40, 167, 69, 0.3);
      color: #155724;
    }
    
    .alert-danger {
      background-color: rgba(220, 53, 69, 0.2);
      border: 1px solid rgba(220, 53, 69, 0.3);
      color: #721c24;
    }

    /* Responsive Design */
    @media (max-width: 992px) {
      .container {
        width: 85%;
      }
    }

    @media (max-width: 768px) {
      .container {
        grid-template-columns: 1fr;
      }
      
      .container img {
        height: 300px;
      }
      
      .text-container {
        padding: 30px;
      }
    }

    @media (max-width: 576px) {
      .back {
        width: 40px;
        height: 40px;
        font-size: 20px;
        top: 15px;
        left: 15px;
      }
      
      .text-container {
        padding: 25px;
      }
      
      .text-container h2 {
        font-size: 1.6rem;
      }
      
      .container {
        margin-top: 60px;
        width: 90%;
      }
      
      .btn {
        padding: 12px 20px;
        font-size: 0.9rem;
      }
    }
</style>
</head>
<body>
  <button class="back" onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: inherit;"></i></button>
  
  <div class="container">
    <div class="text-container">
      <div>
        <h2>Update Event Details</h2> 
        <%String success=(String)request.getAttribute("udsuccess");
        if(success!=null){%>
          <div class="alert alert-success"><%=success %></div>
        <%} %>
        
        <%String error=(String)request.getAttribute("udfail");
        if(error!=null){%>
          <div class="alert alert-danger"><%=error %></div>
        <%} %>
        
        <%
        int detail_id=(int)session.getAttribute("detail_id1");
        if(detail_id!=0){
          EventDetailsDAO ed1=new EventDetailsDAOImpl();
          EventDetails eventDetail=ed1.getEventDetails(detail_id);
          {%>
          <form action="updateEventDetails" method="post">
            <input type="hidden" name="detail_id" value="<%=eventDetail.getDetail_id()%>">
            <input type="hidden" name="event_id" value="<%=eventDetail.getEvent_id()%>">
            
            <div class="form-group">
              <label class="form-label">Event Type</label>
              <input type="text" name="detail_type" value="<%=eventDetail.getDetail_type() %>" class="form-control">
            </div>
            
            <div class="form-group">
              <label class="form-label">Description</label>
              <textarea name="detail_description" class="form-control"><%=eventDetail.getDetail_description()%></textarea>
            </div>
            
            <div class="form-group">
              <label class="form-label">Price</label>
              <input type="tel" name="price" value="<%=eventDetail.getPrice() %>" class="form-control">
            </div>
            
            <div class="form-group">
              <label class="form-label">Room Capacity</label>
              <input type="tel" name="room_capacity" value="<%=eventDetail.getRoom_capacity() %>" class="form-control">
            </div>
            
            <div class="form-group">
              <label class="form-label">Image URL</label>
              <input type="file" name="image_url" value="<%=eventDetail.getImage_url()%>" class="form-control">
            </div>
            
            <button class="btn btn-update" type="submit">
              <i class="fas fa-save"></i> Update Event
            </button>
          </form>
        </div>
      </div>
      <img src="/EventManagementApp/img/<%=eventDetail.getImage_url()%>" alt="<%=eventDetail.getDetail_type()%>">
      <%} %>
    <%} %>
  </div>
  <script>
    function goBack() {
      window.history.back();
    }
  </script>
</body>
</html>
