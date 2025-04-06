<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign Up</title>
    <link rel="stylesheet" href="/EventManagementApp/css/login.css" />
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
    <script
      src="https://kit.fontawesome.com/a076d05399.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div class="login-container">
      <!-- <div class="profile-icon">
        <i class="fa-solid fa-user-plus" style="color: #ffffff"></i>
      </div> -->
      <div class="login-box">
        <form action="signup" method="post">
        <%String success=(String)request.getAttribute("success");
      		if(success!=null){%>
      		<h3 style="color:green"><%=success %></h3>
      	  <%} %>
         <%String error=(String)request.getAttribute("error");
      		if(error!=null){%>
      		<h3 style="color:red"><%=error %></h3>
      	  <%} %>
          <div class="input-field">
            <i class="fa-solid fa-user" style="color: #ffffff"></i>
            <input type="text" placeholder="Name" name="name" required />
          </div>
          <div class="input-field">
            <i class="fa-solid fa-phone" style="color: #ffffff"></i>
            <input
              type="tel"
              placeholder="Phone Number"
              maxlength="10"
              name="phone"
              required
            />
          </div>
          <div class="input-field">
            <i class="fa-solid fa-envelope" style="color: #ffffff"></i>
            <input type="email" placeholder="Email ID" name="mail" required />
          </div>
          <div class="input-field">
            <i class="fa-solid fa-lock" style="color: #ffffff"></i>
            <input
              type="password"
              placeholder="Set Password"
              name="password"
              required
            />
          </div>
          <div class="input-field">
            <i class="fa-solid fa-lock" style="color: #ffffff"></i>
            <input
              type="password"
              placeholder="Confirm Password"
              name="confPass"
              required
            />
          </div>
          <button type="submit">Sign Up</button>
          <p class="account">
            Already have an account? <a href="login.jsp">Login</a>
          </p>
        </form>
      </div>
    </div>
  </body>
</html>
