<%@page import="com.event.dto.Users"%>
<%@page import="com.event.dto.EventOrders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventOrdersDAOImpl"%>
<%@page import="com.event.dao.EventOrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pending Orders</title>
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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        nav {
            height: 12vh;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            padding: 1rem;
            	
        }
        .nav-cont {
            display: flex;
            gap: 1rem;
            
        }
        .nav-cont a {
            text-decoration: none;
            color: white;
            
            
        }
        .logout {
            background-color: red;
            padding: 0.5rem;
            border-radius: 0.4rem;
            text-decoration: none;
            color: white;
        }
        .container {
            width: 80%;
            margin: 20px auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        .success{
        	color:green;
        }
        .error{
        color:red;
       }
       
       .menu-icon{
       color:black;
       }
       
        .cancle-icon{
        	background: none;
        	border: none;
        	cursor: pointer;
        }	
        .approve-icon{
        background: none;
        	border: none;
        	cursor: pointer;
        }
        
        
    </style>


</head>
<body>

<%Users user=(Users)session.getAttribute("users");
if(user!=null){%>
<nav>
      <div class="logo">
        <img src="/EventManagementApp/img/eventLogo.png" alt="" height="50px" />
      </div>
      <div>
        <input class="search" type="search" placeholder="Search events" />
        <i class="fa-solid fa-magnifying-glass search-icon" style="color: #6c6c6c;"></i>
      </div>
      <ul id="menuList">
        <li><a href="pendingorders.jsp">Pending Orders</a></li>
        <li><a href="viewuser.jsp">View Users</a></li>
        <li><a href="addevents.jsp">Add Events</a></li>
        <li><a href="">Update Events</a></li>
        <li><a href="">Delete Events</a></li>
        <li><a href="logout">Logout</a></li>  
      </ul>
      <div class="menu-icon">
        <i class="fa-solid fa-bars" onclick="toggleMenu()"></i>
      </div>
      
    </nav>
    <div class="container">
    <table>
    <tr>
    <th>ORDERS ID</th>
    <th>USER ID</th>
    <th>EVENT ID</th>
    <th>DETAIL ID</th>
    <th>TOTAL PRICE</th>
    <th>START BOOKING DATE</th>
    <th>END BOKKING  DATE</th>
    <th>ACTION</th>
    </tr>
    <%EventOrdersDAO edao=new EventOrdersDAOImpl();
    ArrayList<EventOrders> elist=edao.getEventOrders();
    for(EventOrders e:elist){%>
    <tr>
    <td><%=e.getOrder_id()%></td>
    <td><%=e.getUser_id() %></td>
    <td><%=e.getEvent_id() %></td>
    <td><%=e.getDetail_id() %></td>
    <td><%=e.getPrice() %></td>
    <td><%=e.getStart_booking_date() %></td>
    <td><%=e.getEnd_booking_date() %></td>
    <td class="status"><%=e.getStatus() %> 
            	<%if(e.getStatus().equals("Pending")){ %>
            	<form action="updatepending" method="post">
            		<input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                    <input type="hidden" class="cancle" name="status" value="Cancelled">
                    <button type="submit" class="cancle-icon">
                    <i class="fa-solid fa-xmark fa-bounce fa-2xs" style="color: #ff3838; font-size: 24px;"></i>
    				</button>
    				</form>
    				<form action="updatepending" method="post">
    				<input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                    <input type="hidden" class="approve" name="status" value="Confirmed">
    				<button type="submit" class="approve-icon">
    				<i class="fa-regular fa-thumbs-up fa-bounce fa-2xs" style="color: #0BDA51; font-size: 24px;"></i>
    				</button>
            	</form>
            	<%} %>
            </td>
    
    </tr>
    <%} %>
    </table>
    </div>
<%} %>

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