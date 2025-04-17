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
        <a href="">Update Events</a>
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
    
    
    <label for="cars">Choose a Event:</label>

	<select name="eventid" id="eventid">
	  <option value="Birthday">111-Birthday</option>
	  <option value="Engagement">112-Engagement</option>
	  <option value="Wedding">113-Wedding </option>
	  <option value="Matrnity">114-Matrnity</option>
	  <option value="Baby Shower">115-Baby Shower </option>
	  <option value="Product Launch">116-Product Launch</option>
	  <option value="Private Party">117-Private Party </option>
	</select>
	
    <input type="text" name="detailtype" placeholder="enter the theme" required>
    <input type="text" name="detaildescription" placeholder="Description" required>
    <input type="text" name="price" placeholder="price" required>
    <input type="tel" name="roomcapacity" placeholder="Capacity" required>
    <input type="text" name="imageurl" placeholder="enter img patch" required>
    
    <input type="submit" value="Add Event">
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