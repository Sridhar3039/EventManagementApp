<%@page import="com.event.dto.Events"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventsDAOImpl"%>
<%@page import="com.event.dao.EventsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Events</title>
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
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
        
        .nav-scroll {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 40px;
            padding: 20px;
            max-width: 1200px;
            margin: 40px auto 0;
        }
        
        .nav-img {
            position: relative;
            width: 200px;
            height: 200px;
            overflow: hidden;
            border-radius: 10px;
            box-shadow: 0 4px 10px var(--shadow-color);
            transition: all 0.3s ease;
        }
        
        .nav-img:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
        }
        
        .nav-img button {
            width: 100%;
            height: 100%;
            border: none;
            background: none;
            cursor: pointer;
            padding: 0;
            position: relative;
            overflow: hidden;
        }
        
        .nav-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        
        .nav-img:hover img {
            transform: scale(1.1);
        }
        
        .nav-img label {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 8px 0;
            font-size: 14px;
            font-weight: 500;
            text-align: center;
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
        
        .outer {
            position: relative;
            width: 100%;
            max-width: 1200px;
            margin: 60px auto 0;
            z-index: 1;
        }
        
        /* Responsive styles */
        @media screen and (max-width: 768px) {
            h1 {
                font-size: 24px;
                margin-top: 80px;
            }
            
            nav {
                padding: 0.75rem 1rem;
            }
            
            .page-title {
                font-size: 1.25rem;
            }
            
            .nav-img {
                width: 160px;
                height: 160px;
            }
        }
        
        @media screen and (max-width: 576px) {
            .container {
                width: 100%;
                padding: 10px;
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
            
            .nav-img {
                width: 140px;
                height: 140px;
            }
            
            .nav-img label {
                font-size: 12px;
                padding: 6px 0;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .outer {
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
        
        <div class="nav-section nav-center">
            <h2 class="page-title">UPDATE EVENTS</h2>
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
                    <a href="adminDashboard.jsp">Home</a>
                    <a href="logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1>Select Event to Update</h1>
        
        <div class="outer">
            <div class="nav-scroll">
                <%EventsDAO e=new EventsDAOImpl();
                ArrayList<Events> eventList=e.getEvents();
                for(Events event:eventList){%>
                <form class="nav-img" action="eventDetails" method="post">
                    <input type="hidden" name="event_id" value="<%=event.getEvent_id()%>" >
                    <button>
                        <img src="/EventManagementApp/img/<%=event.getEvent_img() %>" alt="" />
                        <label><%=event.getEvent_name() %></label>
                    </button>
                </form>
                <%} %>
            </div>
        </div>
    </div>
    
    <script>
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
