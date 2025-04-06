<%@page import="com.event.dto.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventOrdersDAOImpl"%>
<%@page import="com.event.dao.EventOrdersDAO"%>
<%@page import="com.event.dto.EventOrders"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order History</title>
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
            width: 100%;
            height: 100vh;
            text-align: center;
            overflow-x: hidden;
        }
        table{
            width: 100%;
            text-align: start;
            
        }
        tr{
            height: 50px;
        }
        td{
        	padding-left:20px;
        	border: 1px solid black;
        	height:50px;
        	
        }
        .status{
        	display:flex;
        	justify-content:space-around;
        	align-items:center;
        	
        }
        a{
        	text-decoration:none;
        	color: black;
        }
        .cancle-icon{
        	background: none;
        	border: none;
        	cursor: pointer;
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
        left: 20px;
      }
        
    </style>
</head>
<body>
<button class="back"  onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: rgb(97, 97, 97);"></i></button>
	<%EventOrders eventOrders=(EventOrders)session.getAttribute("eventOrders");
	  Users user=(Users)session.getAttribute("users");
	  		if (session == null || session.getAttribute("users") == null) {
            request.setAttribute("error", "please login to book");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
            return;
      } else{%>
	  <%String error=(String)request.getAttribute("error");
     if(error!=null){%>
     <h3 style="color:red"><%=error %></h3>
     <%} %>
    <h1>Your Order History</h1>
    <table >
        <tr>
            <th>Event Name</th>
            <th>Detail Type</th>
            <th>Start Event</th>
            <th>End Event</th>
            <th>Price</th>
            <th>Status</th>
        </tr>
        <%EventOrdersDAO eodao=new EventOrdersDAOImpl();
          ArrayList<EventOrders> orderList=eodao.getEventOrders(user.getUser_id());
          for(EventOrders orders:orderList){%>
        <tr>
            <td><%=orders.getEvent_name() %></td>
            <td><%=orders.getDetail_type() %></td>
            <td><%=orders.getStart_booking_date() %></td>
            <td><%=orders.getEnd_booking_date() %></td>
            <td><%=orders.getPrice() %></td>
            <td class="status"><%=orders.getStatus() %> 
            	<%if(orders.getStatus().equals("Pending")){ %>
            	<form action="updateOrders" method="post">
            		<input type="hidden" name="orderId" value="<%=orders.getOrder_id() %>">
                    <input type="hidden" class="cancle" name="status" value="Cancelled">
                    <button type="submit" class="cancle-icon">
        				<i class="fa-solid fa-xmark" style="color: #ff3838; font-size: 24px;"></i>
    				</button>
            	</form>
            	<%} %>
            </td>
        </tr>
        <%} %>
    </table>
    <%} %>
    <script>
      function goBack() {
        window.history.back();
      }
    </script>
</body>
</html>