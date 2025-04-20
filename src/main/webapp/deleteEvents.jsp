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
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delete Events</title>
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
        text-align: center;
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
    
    .event-id {
        font-weight: 600;
        color: var(--primary-color);
    }
    
    .event-name {
        font-weight: 600;
        color: #495057;
    }
    
    .delete-btn {
        background-color: var(--danger-color);
        color: white;
        border: none;
        padding: 8px 16px;
        border-radius: 20px;
        font-size: 13px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 6px;
        box-shadow: 0 2px 5px rgba(220, 53, 69, 0.3);
    }
    
    .delete-btn:hover {
        background-color: #c82333;
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(220, 53, 69, 0.4);
    }
    
    .delete-btn:active {
        transform: translateY(0);
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
    
    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
        justify-content: center;
        align-items: center;
    }
    
    .modal-content {
        background-color: white;
        padding: 25px;
        border-radius: 10px;
        width: 90%;
        max-width: 400px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    
    .modal-title {
        color: var(--danger-color);
        margin-bottom: 15px;
    }
    
    .modal-body {
        margin-bottom: 20px;
    }
    
    .modal-footer {
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    
    .btn-cancel {
        background-color: var(--secondary-color);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s;
    }
    
    .btn-cancel:hover {
        background-color: #5a6268;
    }
    
    .btn-confirm {
        background-color: var(--danger-color);
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        transition: all 0.3s;
    }
    
    .btn-confirm:hover {
        background-color: #c82333;
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
        
        .delete-btn {
            padding: 6px 12px;
            font-size: 12px;
        }
    }
</style>
</head>
<body>

<button class="back" onclick="goBack()"><i class="fa-solid fa-arrow-left" style="color: inherit;"></i></button>
    
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
                <td><span class="event-id"><%=e.getEvent_id()%></span></td>
                <td><span class="event-name"><%=e.getEvent_name()%></span></td>
                <td>
                    <button class="delete-btn" onclick="confirmDelete(<%=e.getEvent_id()%>, '<%=e.getEvent_name()%>')">
                        <i class="fas fa-trash-alt"></i> Delete
                    </button>
                </td>
            </tr>
            <%} %>
        </table>
    </div>
</div>

<!-- Delete Confirmation Modal -->
<div id="deleteModal" class="modal">
    <div class="modal-content">
        <h2 class="modal-title">Confirm Deletion</h2>
        <div class="modal-body">
            <p>Are you sure you want to delete <strong id="eventName"></strong>?</p>
            <p>This action cannot be undone.</p>
        </div>
        <div class="modal-footer">
            <button class="btn-cancel" onclick="closeModal()">Cancel</button>
            <form id="deleteForm" action="delete" method="post">
                <input type="hidden" id="eventId" name="id" value="">
                <button type="submit" class="btn-confirm">Delete</button>
            </form>
        </div>
    </div>
</div>
   
<script>
    function goBack() {
        window.history.back();
    }
    
    function confirmDelete(id, name) {
        document.getElementById('eventId').value = id;
        document.getElementById('eventName').textContent = name;
        document.getElementById('deleteModal').style.display = 'flex';
    }
    
    function closeModal() {
        document.getElementById('deleteModal').style.display = 'none';
    }
    
    // Close modal if user clicks outside of it
    window.onclick = function(event) {
        if (event.target.className === 'modal') {
            closeModal();
        }
    }
</script>
     
</body>
</html>
