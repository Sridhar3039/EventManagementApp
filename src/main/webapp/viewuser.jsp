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
<title>View Users</title>
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
    
    .user-id {
        font-weight: 600;
        color: var(--primary-color);
    }
    
    .user-name {
        font-weight: 600;
        color: #495057;
    }
    
    .user-email {
        color: #6c757d;
        font-style: italic;
    }
    
    .user-phone {
        color: #6c757d;
    }
    
    .user-role {
        padding: 6px 12px;
        border-radius: 20px;
        font-weight: 600;
        font-size: 12px;
        letter-spacing: 0.5px;
        text-transform: uppercase;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    
    .role-admin {
        background-color: #e3f2fd;
        color: #0d47a1;
        border: 1px solid #bbdefb;
    }
    
    .role-user {
        background-color: #e8f5e9;
        color: #1b5e20;
        border: 1px solid #c8e6c9;
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
    }
</style>
</head>
<body>

<button class="back" onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: inherit;"></i></button>
    
<div class="container">
    <h1>User Management</h1>
    <div class="table-responsive">
        <table>
            <tr>
                <th>USER ID</th>
                <th>NAME</th>
                <th>EMAIL</th>
                <th>PHONE</th>
                <th>ROLE</th>
            </tr>
            <%UsersDAO udao=new UsersDAOImpl();
            ArrayList<Users> ulist=udao.getUsers();
            for(Users u:ulist){
                String roleClass = u.getRole().equals("Admin") ? "role-admin" : "role-user";
            %>
            <tr>
                <td><span class="user-id"><%=u.getUser_id()%></span></td>
                <td><span class="user-name"><%=u.getName()%></span></td>
                <td><span class="user-email"><%=u.getEmail() %></span></td>
                <td><span class="user-phone"><%=u.getPhone()%></span></td>
                <td><span class="user-role <%=roleClass%>"><%=u.getRole() %></span></td>
            </tr>
            <%} %>
        </table>
    </div>
</div>
<script>
    function goBack() {
        window.history.back();
    }
</script>
</body>
</html>
