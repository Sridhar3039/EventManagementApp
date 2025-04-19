<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Events - Vibrance</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
      integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <style>
        :root {
            --primary-color: #3b79b7;
            --primary-hover: #2d5f91;
            --secondary-color: #7B68EE;
            --secondary-hover: #6a5acd;
            --text-color: #333;
            --light-bg: #f8f9fa;
            --border-radius: 10px;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
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
        
        body {
            background-image: url("/EventManagementApp/img/eventDetails_bg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .page-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem 1rem;
        }
        
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            width: 100%;
            max-width: 650px;
            padding: 2rem;
        }
        
        .form-title {
            text-align: center;
            margin-bottom: 1.5rem;
            color: var(--primary-color);
            font-weight: 600;
        }
        
        .form-group {
            margin-bottom: 1.25rem;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(123, 104, 238, 0.25);
            outline: none;
        }
        
        .form-select {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }
        
        .form-select:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(123, 104, 238, 0.25);
            outline: none;
        }
        
        .btn-submit {
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
        }
        
        .btn-submit:hover {
            background-color: var(--secondary-hover);
            transform: translateY(-2px);
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
            background-color: rgba(59, 121, 183, 0.1);
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
            color: var(--text-color);
            font-weight: 500;
            padding: 0.75rem 1.5rem;
            transition: background-color 0.3s ease;
        }
        
        #menuList a:hover {
            background-color: rgba(59, 121, 183, 0.1);
            color: var(--primary-color);
        }
        
        /* Alert messages */
        .alert {
            padding: 1rem;
            margin-bottom: 1rem;
            border-radius: var(--border-radius);
            font-weight: 500;
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        /* Responsive styles */
        @media (max-width: 992px) {
            .page-title {
                font-size: 1.3rem;
            }
        }
        
        @media (max-width: 768px) {
            nav {
                padding: 0.75rem 1rem;
            }
            
            .page-title {
                font-size: 1.25rem;
            }
            
            .form-container {
                padding: 1.5rem;
            }
        }
        
        @media (max-width: 576px) {
            .form-container {
                padding: 1.25rem;
            }
            
            .logo h1 {
                font-size: 1.5rem;
            }
            
            .page-title {
                font-size: 1.1rem;
            }
            
            .btn-submit {
                padding: 0.6rem 1.25rem;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .form-container {
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
            <h2 class="page-title">ADD EVENTS</h2>
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
    
    <!-- Page Content -->
    <div class="page-content">
        <div class="form-container">
            <h2 class="form-title">Add New Event</h2>
            
            <!-- Alert Messages -->
            <% String successMessage = (String)request.getAttribute("eventadded");
               if(successMessage != null) { %>
                <div class="alert alert-success">
                    <%= successMessage %>
                </div>
            <% } %>
            
            <% String errorMessage = (String)request.getAttribute("eventfailed");
               if(errorMessage != null) { %>
                <div class="alert alert-danger">
                    <%= errorMessage %>
                </div>
            <% } %>
            
            <!-- Add Event Form -->
            <form action="addevent" method="post">
                <div class="form-group">
                    <label for="eventid" class="form-label">Event Type</label>
                    <select name="eventid" id="eventid" class="form-select">
                        <option value="111">Birthday</option>
                        <option value="112">Engagement</option>
                        <option value="113">Wedding</option>
                        <option value="114">Maternity</option>
                        <option value="115">Baby Shower</option>
                        <option value="116">Product Launch</option>
                        <option value="117">Private Party</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="detailtype" class="form-label">Theme</label>
                    <input type="text" name="detailtype" id="detailtype" class="form-control" placeholder="Enter The Theme" required>
                </div>
                
                <div class="form-group">
                    <label for="detaildescription" class="form-label">Description</label>
                    <textarea name="detaildescription" id="detaildescription" class="form-control" placeholder="Enter Event Description" rows="3" required></textarea>
                </div>
                
                <div class="form-group">
                    <label for="price" class="form-label">Price</label>
                    <input type="number" name="price" id="price" class="form-control" placeholder="Enter Price" required>
                </div>
                
                <div class="form-group">
                    <label for="roomcapacity" class="form-label">Room Capacity</label>
                    <input type="number" name="roomcapacity" id="roomcapacity" class="form-control" placeholder="Enter Capacity" required>
                </div>
                
                <div class="form-group">
                    <label for="imageurl" class="form-label">Choose Image</label>
                    <input type="file" name="imageurl" id="imageurl" class="form-control" placeholder="Choose the File" required>
                </div>
                
                <button type="submit" class="btn-submit">Add Event</button>
            </form>
        </div>
    </div>
    
    <!-- Scripts -->
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
