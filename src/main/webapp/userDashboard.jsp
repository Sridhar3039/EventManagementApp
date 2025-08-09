<%@page import="com.event.dto.Feedback"%>
<%@page import="com.event.dao.FeedbackDAOImpl"%>
<%@page import="com.event.dao.FeedbackDAO"%>
<%@page import="com.event.dto.Events"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.event.dao.EventsDAOImpl"%>
<%@page import="com.event.dao.EventsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Dashboard</title>
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
  </head>
  <body>
    <nav>
      <div class="logo">
        <!-- <img src="/EventManagementApp/img/eventLogo.png" alt="" height="50px" /> -->
        <h1>Vibrance</h1>
      </div>
      <div>
        <input class="search" type="search" placeholder="Search events" />
        <i class="fa-solid fa-magnifying-glass search-icon" style="color: #6c6c6c;"></i>
      </div>
      <div id="menuList">
      	<a id="openModal" href="javascript:void(0)">Leave a Review</a>
        <a href="orderHistory.jsp">Order History</a>
        <a href="updateUser.jsp">Update Profile</a>
        <a href="reset.jsp">Reset Password</a>
        <a href="logout">Logout</a>
      </div>
      <div class="menu-icon">
        <i class="fa-solid fa-bars" onclick="toggleMenu()"></i>
      </div>
    </nav>
   	<div id="slides">
    <div
      id="carouselExampleInterval"
      class="carousel slide"
      data-bs-ride="carousel"
    >
      <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
          <img
            src="/EventManagementApp/img/Birthday_bg.png"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        <div class="carousel-item" data-bs-interval="2000">
          <img
            src="/EventManagementApp/img/Engagment_bg.png"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="/EventManagementApp/img/Wedding_bg.png"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="/EventManagementApp/img/BabyShower_bg.jpg"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="/EventManagementApp/img/ProductLaunch_bg.jpeg"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        <div class="carousel-item">
          <img
            src="/EventManagementApp/img/PrivateParty_bg.jpg"
            class="d-block w-100"
            height="500px"
            alt="..."
          />
        </div>
        </div>
      </div>
      <button
        class="carousel-control-prev"
        type="button"
        data-bs-target="#carouselExampleInterval"
        data-bs-slide="prev"
        style="height: 60vh; margin-top: 70px;"
      >
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button
        class="carousel-control-next"
        type="button"
        data-bs-target="#carouselExampleInterval"
        data-bs-slide="next"
        style="height: 60vh; margin-top: 70px;"
      >
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
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
    <center><h1>About Us</h1></center>
    <div class="about">
      <div class="about-text">
        <h4>Dreams come to life through meticulously planned and beautifully executed events. Founded on the belief that every moment is worth celebrating, we specialize in creating experiences that bring joy, connection, and unforgettable memories.
          With a passionate team of event experts and creative visionaries, we cater to a wide array of occasions from intimate gatherings to grand celebrations. Whether it's a birthday, engagement, wedding, baby shower, product launch, or private party, we approach each event with care, precision, and enthusiasm.</h4>
      </div>
      <div class="about-img">
        <div>
          <img src="/EventManagementApp/img/About-img1.jpeg" alt="" height="200px" width="300px">
          <img src="/EventManagementApp/img/About-img2.jpeg" alt="" height="200px" width="300px">
        </div>
        <div>
          <img src="/EventManagementApp/img/About-img3.jpeg" alt="" height="420px">
        </div>
      </div>
    </div>
    <center><h1>Location</h1></center>
    <div class="maps">
    	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3887.924784485952!2d77.54279107513094!3d12.976662514767167!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bae3def4fc5f6a1%3A0x1d115ce6552ed936!2sGagan%20Party%20Hall%20(Radha%20Krishna%20Kalayana%20Mantapa)!5e0!3m2!1sen!2sin!4v1743747595907!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    <center><h1>Feedback</h1></center>
    <div id="feedbackModal" class="modal">
      <div class="modal-content">
          <span class="close">&times;</span>
          <h2>Leave a Review</h2>
          <form action="feedback" method="post">
              <div class="star-rating">
                  <input type="radio" id="star5" name="rating" value="5">
                  <label for="star5">&#9733;</label>
  
                  <input type="radio" id="star4" name="rating" value="4">
                  <label for="star4">&#9733;</label>
  
                  <input type="radio" id="star3" name="rating" value="3">
                  <label for="star3">&#9733;</label>
  
                  <input type="radio" id="star2" name="rating" value="2">
                  <label for="star2">&#9733;</label>
  
                  <input type="radio" id="star1" name="rating" value="1">
                  <label for="star1">&#9733;</label>
              </div>
              <textarea name="feedback_text" id="feedback" placeholder="Write your feedback...." required></textarea>
              <button type="submit">Submit Review</button>
          </form>
      </div>
  </div>
  <div class="feedbackReview">
    <div class="review-content1">
    <%FeedbackDAO f=new FeedbackDAOImpl();
  		ArrayList<Feedback> feedbackList=f.getFeedback();
  		for(Feedback feedback:feedbackList){
  		if(feedback.getFeedback_id()%2==0){%>
      <div class="review-card1">
        <h2><%=feedback.getUser_name() %></h2>
        <div class="star-rating">
          <input type="radio" id="star5" readonly <%if(feedback.getRating()==5){ %> checked<%}%>>
          <label for="star5">&#9733;</label>

          <input type="radio" id="star4" readonly <%if(feedback.getRating()==4){ %> checked<%}%>>
          <label for="star4">&#9733;</label>

          <input type="radio" id="star3" readonly <%if(feedback.getRating()==3){ %> checked<%}%>>
          <label for="star3">&#9733;</label>

          <input type="radio" id="star2" readonly <%if(feedback.getRating()==2){ %> checked<%}%>>
          <label for="star2">&#9733;</label>

          <input type="radio" id="star1" readonly <%if(feedback.getRating()==1){ %> checked<%}%>>
          <label for="star1">&#9733;</label>
      </div>
      <textarea name="feedback" id="feedback"><%=feedback.getComments() %></textarea>
      </div>
      <%} 
      }%>
    </div>
    <div class="review-content1" style="margin-left: 200px;">
    <%for(Feedback feedback:feedbackList){
  		if(feedback.getFeedback_id()%2==1){%>
      <div class="review-card1">
        <h2><%=feedback.getUser_name() %></h2>
        <div class="star-rating">
          <input type="radio" id="star5" readonly <%if(feedback.getRating()==5){ %> checked<%}%>>
          <label for="star5">&#9733;</label>

          <input type="radio" id="star4" readonly <%if(feedback.getRating()==4){ %> checked<%}%>>
          <label for="star4">&#9733;</label>

          <input type="radio" id="star3" readonly <%if(feedback.getRating()==3){ %> checked<%}%>>
          <label for="star3">&#9733;</label>

          <input type="radio" id="star2" readonly <%if(feedback.getRating()==2){ %> checked<%}%>>
          <label for="star2">&#9733;</label>

          <input type="radio" id="star1" readonly <%if(feedback.getRating()==1){ %> checked<%}%>>
          <label for="star1">&#9733;</label>
      </div>
      <textarea name="feedback" id="feedback"><%=feedback.getComments() %></textarea>
      </div>
      <%} 
      }%>
    </div>
  </div>
      <footer>
      <div class="footer">
        <div class="footer-content">
          <!-- <img src="/EventManagementApp/img/eventLogo.png" alt="" height="100px"> -->
          <h1>Vibrance</h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad cupiditate reiciendis quam eaque quisquam perspiciatis nulla cumque non ab nesciunt provident, minus, aspernatur quaerat odio deleniti, harum ratione officia ex!</p>
          <div class="footer-icon">
            <i class="fa-brands fa-instagram" style="color: #8e99f3; font-size: 25px;"></i>
            <i class="fa-brands fa-facebook" style="color: #8e99f3; font-size: 25px;"></i>
            <i class="fa-brands fa-twitter" style="color: #8e99f3; font-size: 25px;"></i>
            <i class="fa-brands fa-whatsapp" style="color: #8e99f3; font-size: 25px;"></i>
          </div>
        </div>
        <div class="footer-events">
          <h2>Event List</h2>
          <p>Birthday</p>
          <p>Engagement</p>
          <p>Wedding</p>
          <p>Maternity</p>
          <p>Baby Shower</p>
          <p>Product Launch</p>
          <p>Private Party</p>
        </div>
        <div class="footer-contact">
          <h2>Contact Us</h2>
          <p><i class="fa-solid fa-phone" style="color: #000000;"></i> 8965237415</p>
          <p><i class="fa-solid fa-envelope" style="color: #000000;"></i> vibrance@gmail.com</p>
        </div>
      </div>
    </footer>
    <script>

      /* Add JS for navbar scroll effect */
document.addEventListener('DOMContentLoaded', function() {
  window.addEventListener('scroll', function() {
    const nav = document.querySelector('nav');
    if (window.scrollY > 50) {
      nav.classList.add('scrolled');
    } else {
      nav.classList.remove('scrolled');
    }
  });
});

      let menuList = document.getElementById("menuList");
      menuList.style.maxHeight = "0px";
      function toggleMenu() {
        if (menuList.style.maxHeight == "0px") {
          menuList.style.maxHeight = "100vh";
        } else {
          menuList.style.maxHeight = "0px";
        }
      }
   // Get modal and button elements
      const modal = document.getElementById("feedbackModal");
      const openModalBtn = document.getElementById("openModal");
      const closeModalBtn = document.querySelector(".close");

      // Open the modal
      openModalBtn.addEventListener("click", function () {
          modal.style.display = "block";
      });

      // Close the modal when the close button is clicked
      closeModalBtn.addEventListener("click", function () {
          modal.style.display = "none";
      });

      // Close the modal when clicking outside the modal content
      window.addEventListener("click", function (event) {
          if (event.target === modal) {
              modal.style.display = "none";
          }
      });
          </script>
    </script>
  </body>
</html>
    