<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD EVENTS</title>
<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Dashboard</title>
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
    
    <style type="text/css">
    
    body {
    background-image: url("/EventManagementApp/img/eventDetails_bg.jpg");
    background-repeat: no-repeat;
    background-size: cover;
    background-attachment: fixed;
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
    align-items: center;     
}

	.container {
    width: 80%; /* Reduced from 90% */
    max-width: 1000px; /* Reduced from 1200px */
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 80px auto;
    border-radius: 20px;
    box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.3);
    background-color: rgb(154, 194, 235);
    overflow: hidden;
    max-height: 500px;
    
  justify-content: center; /* Horizontal centering */
  align-items: center;     /* Vertical centering */
  height: 100vh;
	}

	text-container{
	display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  padding: 20px;
  background: white;
  border-radius: 10px;
    
 	  
	}
	
	input, select {
  padding: 10px;
  width: 600px;
  border: 1px solid #ccc;
  border-radius: 5px;
  gap:10px;
  background-color: menu;
	}
	
	input.add{
	background-color: #7B68EE;
	color:black;
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
    
         <%String successMessage=(String)request.getAttribute("eventadded");
        if(successMessage!=null){%>
        <%=successMessage %>
        <%} %>
        
        
        <%String errorMessage=(String)request.getAttribute("eventfailed");
        if(errorMessage!=null){%>
        <%=errorMessage %>
        
        <%} %>
    
    <form action="addevent" method="post">
    <div class="container">
    <div class="text-container">
    
    
    <label for="events">Choose a Event:</label>

	<select name="eventid" id="eventid">
	  <option value="Birthday">111-Birthday</option>
	  <option value="Engagement">112-Engagement</option>
	  <option value="Wedding">113-Wedding </option>
	  <option value="Matrnity">114-Matrnity</option>
	  <option value="Baby Shower">115-Baby Shower </option>
	  <option value="Product Launch">116-Product Launch</option>
	  <option value="Private Party">117-Private Party </option>
	</select><br><br>
	
    <input type="text" name="detailtype" placeholder="enter the theme" required><br><br>
    <input type="text" name="detaildescription" placeholder="Description" required><br><br>
    <input type="text" name="price" placeholder="price" required><br><br>
    <input type="tel" name="roomcapacity" placeholder="Capacity" required><br><br>
    <input type="text" name="imageurl" placeholder="enter img path" required><br><br>
    
    <input class="add" type="submit" value="Add Event">
    </div>
     
    </div>
   
    
    </form>



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