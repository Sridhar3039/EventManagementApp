<%@page import="com.event.dto.Events"%>
<%@page import="com.event.servlets.AddEvents"%>
<%@page import="com.event.dao.EventsDAOImpl"%>
<%@page import="com.event.dao.EventsDAO"%>
<%@page import="com.event.dto.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.UsersDAOImpl"%>
<%@page import="com.event.dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Events</title>
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
            text-align: center;
        }
        
        .delete-btn {
            background-color: var(--danger-color);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 12px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .delete-btn:hover {
            background-color: #c82333;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        }
        
        a{
            text-decoration: none;
            color: var(--primary-color);
            transition: color 0.3s;
        }
        
        a:hover {
            color: #2a4bdf;
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
        
        /* Confirmation dialog style */
        .confirm-dialog {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            display: none;
        }
        
        .dialog-content {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            text-align: center;
            max-width: 400px;
            width: 90%;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }
        
        .dialog-content h3 {
            margin-top: 0;
            color: #333;
        }
        
        .dialog-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 20px;
        }
        
        .dialog-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }
        
        .confirm-btn {
            background-color: #d32f2f;
            color: white;
        }
        
        .confirm-btn:hover {
            background-color: #b71c1c;
        }
        
        .cancel-btn {
            background-color: #757575;
            color: white;
        }
        
        .cancel-btn:hover {
            background-color: #616161;
        }
        
        /* Responsive styles */
        @media screen and (max-width: 768px) {
            h1 {
                font-size: 24px;
                margin-top: 80px;
            }
            
            th, td {
                padding: 10px 12px;
                font-size: 14px;
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
            
            .logo h1 {
                font-size: 1.5rem;
            }
            
            .page-title {
                font-size: 1.1rem;
            }
            
            #menuList {
                min-width: 180px;
            }
            
            .delete-btn {
                padding: 6px 12px;
                font-size: 11px;
            }
            
            .dialog-content {
                padding: 20px;
            }
            
            .dialog-buttons button {
                padding: 8px 16px;
                font-size: 14px;
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
                    <a href="adminDashboard.jsp">Home</a>
                    <a href="logout">Logout</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <h1>Delete Events</h1>
        <div class="table-responsive">
            <table>
                <tr>
                    <th>EVENT ID</th>
                    <th>EVENT NAME</th>
                    <th>ACTION</th>
                </tr>
                <%EventsDAO edao=new EventsDAOImpl();
                ArrayList<Events> elist=edao.getEvents();
                for(Events e:elist){%>
                <tr>
                    <td><%=e.getEvent_id()%></td>
                    <td><%=e.getEvent_name()%></td>
                    <td>
                        <button class="delete-btn" onclick="showDeleteConfirmation(<%=e.getEvent_id()%>, '<%=e.getEvent_name()%>')">Delete</button>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>
    </div>
    
    <!-- Delete confirmation dialog -->
    <div id="deleteConfirmDialog" class="confirm-dialog">
        <div class="dialog-content">
            <h3>Confirm Deletion</h3>
            <p>Are you sure you want to delete the event "<span id="eventName"></span>"? This action cannot be undone.</p>
            <div class="dialog-buttons">
                <form action="delete" method="post" id="deleteForm">
                    <input type="hidden" name="id" id="deleteEventId" value="">
                    <button type="submit" class="confirm-btn">Yes, Delete</button>
                </form>
                <button class="cancel-btn" onclick="hideDeleteConfirmation()">Cancel</button>
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
      
      // Delete confirmation functionality
      function showDeleteConfirmation(eventId, eventName) {
          document.getElementById('deleteEventId').value = eventId;
          document.getElementById('eventName').textContent = eventName;
          document.getElementById('deleteConfirmDialog').style.display = 'flex';
      }
      
      function hideDeleteConfirmation() {
          document.getElementById('deleteConfirmDialog').style.display = 'none';
      }
  </script>
</body>
</html>  