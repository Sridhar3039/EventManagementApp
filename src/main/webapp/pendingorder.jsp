<%@page import="com.event.dto.Users"%>
<%@page import="com.event.dto.EventOrders"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventOrdersDAOImpl"%>
<%@page import="com.event.dao.EventOrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pending Orders</title>
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
        --primary-color: #4a6bff;
        --secondary-color: #6c757d;
        --success-color: #28a745;
        --danger-color: #dc3545;
        --warning-color: #ffc107;
        --info-color: #17a2b8;
        --light-color: #f8f9fa;
        --dark-color: #343a40;
        --white-color: #ffffff;
        --shadow-color: rgba(0, 0, 0, 0.1);
        --border-color: #dee2e6;
        --hover-color: #f1f3f9;
    }
    
    body{
        width: 100%;
        height: 100vh;
        text-align: center;
        overflow-x: hidden;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f7ff;
        color: var(--dark-color);
    }
    
    .container {
        width: 95%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }
    
    h1 {
        margin-top: 60px;
        color: var(--primary-color);
        font-weight: 600;
        position: relative;
        display: inline-block;
        padding-bottom: 10px;
    }
    
    h1::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 80px;
        height: 3px;
        background-color: var(--primary-color);
        border-radius: 3px;
    }
    
    .table-responsive {
        overflow-x: auto;
        margin: 30px 0;
        box-shadow: 0 5px 15px var(--shadow-color);
        border-radius: 12px;
        background-color: var(--white-color);
    }
    
    table{
        width: 100%;
        text-align: start;
        border-collapse: collapse;
        background-color: var(--white-color);
    }
    
    th {
        background-color: var(--primary-color);
        color: var(--white-color);
        font-weight: 600;
        padding: 15px;
        border: 1px solid #5a77ff;
        text-transform: uppercase;
        font-size: 14px;
        letter-spacing: 0.5px;
    }
    
    tr{
        height: 50px;
        transition: background-color 0.3s;
    }
    
    tr:nth-child(even) {
        background-color: #f9faff;
    }
    
    tr:hover {
        background-color: var(--hover-color);
    }
    
    td{
        padding: 15px 20px;
        border: 1px solid var(--border-color);
        height: 50px;
        color: #444;
    }
    
    .status{
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    
    .status-badge {
        padding: 6px 12px;
        border-radius: 20px;
        font-weight: 600;
        font-size: 12px;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    
    .status-pending {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeeba;
    }
    
    .status-confirmed {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
    }
    
    .status-cancelled {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
    }
    
    .action-buttons {
        display: flex;
        gap: 10px;
        justify-content: center;
    }
    
    .action-btn {
        background: none;
        border: none;
        cursor: pointer;
        transition: all 0.3s;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .approve-btn {
        background-color: #f0fff0;
    }
    
    .approve-btn:hover {
        transform: scale(1.1);
        background-color: #e0ffe0;
        box-shadow: 0 3px 8px rgba(40, 167, 69, 0.2);
    }
    
    .cancel-btn {
        background-color: #fff0f0;
    }
    
    .cancel-btn:hover {
        transform: scale(1.1);
        background-color: #ffe0e0;
        box-shadow: 0 3px 8px rgba(220, 53, 69, 0.2);
    }
    
    .back{
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
        background: var(--white-color);
        cursor: pointer;
        z-index: 100;
        transition: all 0.3s;
        box-shadow: 0 3px 10px var(--shadow-color);
    }
    
    .back:hover {
        background-color: var(--primary-color);
        color: var(--white-color);
        transform: translateY(-3px);
    }
    
    .transaction-info {
        background-color: #f8f9ff;
        padding: 12px;
        margin: 8px 0;
        border-radius: 8px;
        text-align: left;
        font-size: 13px;
        border-left: 3px solid var(--primary-color);
        box-shadow: 0 2px 5px var(--shadow-color);
    }
    
    .transaction-info div {
        margin: 4px 0;
    }
    
    .price-value {
        font-weight: 600;
        color: #2c7be5;
    }
    
    .event-name {
        font-weight: 600;
        color: #495057;
    }
    
    .detail-type {
        color: #6c757d;
        font-style: italic;
    }
    
    .date-info {
        color: #6c757d;
        font-size: 13px;
    }
    
    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
    
    .table-responsive {
        animation: fadeIn 0.5s ease-out;
    }
    
    /* Responsive styles */
    @media screen and (max-width: 768px) {
        h1 {
            font-size: 24px;
            margin-top: 80px;
        }
        
        .back {
            top: 15px;
            left: 15px;
        }
        
        th, td {
            padding: 10px 12px;
            font-size: 14px;
        }
        
        .status {
            flex-direction: column;
            gap: 8px;
        }
        
        .action-buttons {
            flex-direction: row;
        }
    }
    
    @media screen and (max-width: 576px) {
        table {
            font-size: 13px;
        }
        
        th, td {
            padding: 8px 10px;
        }
        
        .container {
            width: 100%;
            padding: 10px;
        }
        
        .hidden-mobile {
            display: none;
        }
        
        .transaction-info {
            padding: 8px;
            font-size: 12px;
        }
        
        .action-btn {
            width: 35px;
            height: 35px;
        }
    }
</style>
</head>
<body>

<%Users user=(Users)session.getAttribute("users");
if(user!=null){%>
  <button class="back" onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: inherit;"></i></button>
  <div class="container">
    <h1>Pending Orders</h1>
    <div class="table-responsive">
      <table>
        <tr>
          <th>Order ID</th>
          <th>User ID</th>
          <th>Event</th>
          <th>Detail Type</th>
          <th>Price</th>
          <th class="hidden-mobile">Start Date</th>
          <th class="hidden-mobile">End Date</th>
          <th>Status</th>
        </tr>
        <%EventOrdersDAO edao=new EventOrdersDAOImpl();
        ArrayList<EventOrders> elist=edao.getEventOrders();
        for(EventOrders e:elist){
          String statusClass = "";
          if(e.getStatus().equals("Pending")) {
            statusClass = "status-pending";
          } else if(e.getStatus().equals("Confirmed")) {
            statusClass = "status-confirmed";
          } else if(e.getStatus().equals("Cancelled")) {
            statusClass = "status-cancelled";
          }
        %>
        <tr>
          <td><%=e.getOrder_id()%></td>
          <td><%=e.getUser_id() %></td>
          <td><span class="event-name"><%=e.getEvent_name() %></span></td>
          <td><span class="detail-type"><%=e.getDetail_type() %></span></td>
          <td><span class="price-value">₹<%=e.getPrice() %></span></td>
          <td class="hidden-mobile"><span class="date-info"><%=e.getStart_booking_date() %></span></td>
          <td class="hidden-mobile"><span class="date-info"><%=e.getEnd_booking_date() %></span></td>
          <td><div class="action-buttons">
          <span class="status-badge <%=statusClass%>"><%=e.getStatus() %></span>
            <%if(e.getStatus().equals("Pending")){ %>
            
              <form action="updatepending" method="post">
                <input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                <input type="hidden" class="approve" name="status" value="Confirmed">
                <button type="submit" class="action-btn approve-btn" title="Approve Order">
                  <i class="fa-regular fa-thumbs-up" style="color: #0BDA51; font-size: 18px;"></i>
                </button>
              </form>
              <form action="updatepending" method="post">
                <input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                <input type="hidden" class="cancle" name="status" value="Cancelled">
                <button type="submit" class="action-btn cancel-btn" title="Cancel Order">
                  <i class="fa-solid fa-xmark" style="color: #ff3838; font-size: 18px;"></i>
                </button>
              </form>
            </div>
            <%} %>
          </td>
        </tr>
        <%} %>
      </table>
    </div>
  </div>
<%} %>

<script>
  function goBack() {
    window.history.back();
    
  }
</script>
</body>
</html>
