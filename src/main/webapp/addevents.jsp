<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Events</title>
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
      margin: auto 0;
      align-items: center;
      padding: 30px 20px;
      position: relative;
    }

    .container {
      width: 90%;
      max-width: 700px;
      background-color: var(--secondary-color);
      border-radius: var(--border-radius);
      overflow: hidden;
      box-shadow: var(--box-shadow);
      display: flex;
      position: relative;
      animation: fadeIn 0.6s ease-out;
      margin-left: 25%;
    }
    
    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .text-container {
      padding: 40px;
      width: 100%;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }
    
    .form-title {
      font-size: 2rem;
      margin-bottom: 10px;
      color: var(--text-color);
      position: relative;
      padding-bottom: 15px;
      text-align: center;
    }
    
    .form-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 80px;
      height: 4px;
      background-color: var(--primary-color);
      border-radius: 2px;
    }
    
    .alert {
      padding: 15px;
      margin-bottom: 20px;
      border-radius: 8px;
      font-weight: 500;
      text-align: center;
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
      padding: 14px;
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
    
    select.form-control {
      appearance: none;
      background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23333' viewBox='0 0 16 16'%3E%3Cpath d='M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 1rem center;
      background-size: 16px 12px;
      padding-right: 2.5rem;
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
      width: 100%;
    }

    .btn:hover {
      background-color: var(--accent-color);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    
    .btn-add {
      background-color: var(--accent-color);
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

    /* Responsive Design */
    @media (max-width: 992px) {
      .container {
        width: 85%;
      }
    }

    @media (max-width: 768px) {
      .container {
        width: 90%;
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
      
      .form-title {
        font-size: 1.6rem;
      }
      
      .container {
        margin-top: 60px;
        width: 95%;
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
  
  <form action="addevent" method="post">
    <div class="container">
      <div class="text-container">
        <h2 class="form-title">Add New Event</h2>
        
        <%String successMessage=(String)request.getAttribute("eventadded");
        if(successMessage!=null){%>
          <div class="alert alert-success"><%=successMessage %></div>
        <%} %>
        
        <%String errorMessage=(String)request.getAttribute("eventfailed");
        if(errorMessage!=null){%>
          <div class="alert alert-danger"><%=errorMessage %></div>
        <%} %>
        
        <div class="form-group">
          <label for="eventid" class="form-label">Choose an Event Type:</label>
          <select name="eventid" id="eventid" class="form-control">
            <option value="Birthday">111-Birthday</option>
            <option value="Engagement">112-Engagement</option>
            <option value="Wedding">113-Wedding</option>
            <option value="Matrnity">114-Matrnity</option>
            <option value="Baby Shower">115-Baby Shower</option>
            <option value="Product Launch">116-Product Launch</option>
            <option value="Private Party">117-Private Party</option>
          </select>
        </div>
        
        <div class="form-group">
          <label for="detailtype" class="form-label">Event Theme:</label>
          <input type="text" name="detailtype" id="detailtype" placeholder="Enter the theme" class="form-control" required>
        </div>
        
        <div class="form-group">
          <label for="detaildescription" class="form-label">Description:</label>
          <input type="text" name="detaildescription" id="detaildescription" placeholder="Description" class="form-control" required>
        </div>
        
        <div class="form-group">
          <label for="price" class="form-label">Price:</label>
          <input type="text" name="price" id="price" placeholder="Price" class="form-control" required>
        </div>
        
        <div class="form-group">
          <label for="roomcapacity" class="form-label">Capacity:</label>
          <input type="tel" name="roomcapacity" id="roomcapacity" placeholder="Capacity" class="form-control" required>
        </div>
        
        <div class="form-group">
          <label for="imageurl" class="form-label">Image Path:</label>
          <input type="text" name="imageurl" id="imageurl" placeholder="Enter image path" class="form-control" required>
        </div>
        
        <button type="submit" class="btn btn-add">
          <i class="fas fa-plus-circle"></i> Add Event
        </button>
      </div>
    </div>
  </form>

  <script>
    function goBack() {
      window.history.back();
      window.history.back();
    }
  </script>
</body>
</html>
