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
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
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
        
        a{
            text-decoration: none;
            color: var(--primary-color);
            transition: color 0.3s;
        }
        
        a:hover {
            color: #2a4bdf;
        }
        
        .cancle-icon{
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
            background-color: #fff0f0;
        }
        
        .cancle-icon:hover {
            transform: scale(1.1);
            background-color: #ffe0e0;
            box-shadow: 0 3px 8px rgba(220, 53, 69, 0.2);
        }
        
        .approve-icon{
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
            background-color: #f0fff0;
        }
        
        .approve-icon:hover {
            transform: scale(1.1);
            background-color: #e0ffe0;
            box-shadow: 0 3px 8px rgba(40, 167, 69, 0.2);
        }
        
        /* Navigation styles */
        nav {
            background-color: white;
            display: flex;
            align-items: center;
            padding: 0.75rem 2rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 100;
        }
        
        /* New nav layout with 3 sections */
        .nav-section {
            display: flex;
            align-items: center;
        }
        
        .nav-left {
            flex: 1;
        }
        
        .nav-center {
            flex: 2;
            justify-content: center;
        }
        
        .nav-right {
            flex: 1;
            justify-content: flex-end;
        }
        
        .logo h1 {
            margin: 0;
            color: var(--primary-color);
            font-size: 1.75rem;
            font-weight: 700;
        }
        
        .page-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary-color);
            margin: 0;
            text-align: center;
        }
        
        /* Menu dropdown styles */
        .menu-container {
            position: relative;
        }
        
        .menu-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 1.5rem;
            color: var(--primary-color);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            transition: background-color 0.3s ease;
        }
        
        .menu-icon:hover {
            background-color: rgba(74, 107, 255, 0.1);
        }
        
        .menu-icon i {
            font-size: 24px;
        }
        
        #menuList {
            position: absolute;
            top: 100%;
            right: 0;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            min-width: 200px;
            display: none;
            flex-direction: column;
            padding: 0.5rem 0;
            margin-top: 0.5rem;
            z-index: 1000;
        }
        
        #menuList.show {
            display: flex;
        }
        
        #menuList a {
            text-decoration: none;
            color: var(--dark-color);
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            transition: background-color 0.3s ease;
        }
        
        #menuList a:hover {
            background-color: rgba(74, 107, 255, 0.1);
            color: var(--primary-color);
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
            
            nav {
                padding: 0.75rem 1rem;
            }
            
            .page-title {
                font-size: 1.25rem;
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
            
            .logo h1 {
                font-size: 1.5rem;
            }
            
            .page-title {
                font-size: 1.1rem;
            }
            
            #menuList {
                min-width: 180px;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .table-responsive {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
</head>
<body>
    <!-- Navigation with 3-section layout -->
    <nav>
        <div class="nav-section nav-left">
            <div class="logo">
                <h1>Vibrance</h1>
            </div>
        </div>
        
       
        
        <div class="nav-section nav-right">
            <div class="menu-container">
                <div class="menu-icon" id="menuToggle">
                    <i class="fa-solid fa-bars"></i>
                </div>
                <div id="menuList">
                    <a href="pendingorder.jsp">Pending Orders</a>
                    <a href="viewuser.jsp">View Users</a>
                    <a href="addevents.jsp">Add Events</a>
                    <a href="updateEvent.jsp">Update Events</a>
                    <a href="deleteEvents.jsp">Delete Events</a>
                    <a href="logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <%Users user=(Users)session.getAttribute("users");
        if(user!=null){%>
        <h1>Pending Orders</h1>
        <div class="table-responsive">
            <table>
                <tr>
                    <th>ORDER ID</th>
                    <th>USER ID</th>
                    <th>EVENT ID</th>
                    <th>DETAIL ID</th>
                    <th>PRICE</th>
                    <th class="hidden-mobile">START DATE</th>
                    <th class="hidden-mobile">END DATE</th>
                    <th>STATUS</th>
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
                <td><%=e.getEvent_id() %></td>
                <td><%=e.getDetail_id() %></td>
                <td><span class="price-value">₹<%=e.getPrice() %></span></td>
                <td class="hidden-mobile"><span class="date-info"><%=e.getStart_booking_date() %></span></td>
                <td class="hidden-mobile"><span class="date-info"><%=e.getEnd_booking_date() %></span></td>
                <td class="status">
                    <span class="status-badge <%=statusClass%>"><%=e.getStatus() %></span>
                    <%if(e.getStatus().equals("Pending")){ %>
                    <form action="updatepending" method="post">
                        <input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                        <input type="hidden" class="approve" name="status" value="Confirmed">
                        <button type="submit" class="approve-icon" title="Approve Order">
                            <i class="fa-regular fa-thumbs-up" style="color: #0BDA51; font-size: 20px;"></i>
                        </button>
                    </form>
                    
                    <form action="updatepending" method="post">
                        <input type="hidden" name="orderId" value="<%=e.getOrder_id() %>">
                        <input type="hidden" class="cancle" name="status" value="Cancelled">
                        <button type="submit" class="cancle-icon" title="Cancel Order">
                            <i class="fa-solid fa-xmark" style="color: #ff3838; font-size: 20px;"></i>
                        </button>
                    </form>
                    <%} %>
                </td>
            </tr>
            <%} %>
        </table>
    </div>
    <%} %>
</div>
<script>
    function goBack() {
        window.history.back();
    }

     // Menu toggle functionality
     const menuToggle = document.getElementById('menuToggle');
        const menuList = document.getElementById('menuList');
        
        menuToggle.addEventListener('click', function() {
            if (menuList.classList.contains('show')) {
                menuList.classList.remove('show');
            } else {
                menuList.classList.add('show');
            }
        });
        
        // Close menu when clicking outside
        document.addEventListener('click', function(event) {
            const isClickInside = menuToggle.contains(event.target) || menuList.contains(event.target);
            
            if (!isClickInside && menuList.classList.contains('show')) {
                menuList.classList.remove('show');
            }
        });
    
    
   
    
  
</script>
</body>
</html>
