<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback</title>
    <style>
        /* Modal container */
.modal {
    display: none; /* Hidden by default */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5); /* Transparent background */
}

/* Modal content */
.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border-radius: 10px;
    width: 300px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
    position: relative;
    text-align: center;
}

/* Close button */
.close {
    position: absolute;
    top: 10px;
    right: 15px;
    color: #aaa;
    font-size: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s;
}

.close:hover {
    color: black;
}

/* Additional styles for the star rating and form (optional) */
.star-rating {
    display: flex;
    justify-content: left;
    flex-direction: row-reverse;
    font-size: 25px;
}
.star-rating input {
    display: none;
}
.star-rating label {
    color: #ccc;
    cursor: pointer;
    transition: color 0.3s;
}
.star-rating input:checked ~ label, 
.star-rating label:hover, 
.star-rating label:hover ~ label {
    color: gold;
}
textarea {
    width: 100%;
    height: 80px;
    margin-top: 10px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    resize: none;
    box-sizing: border-box;
}
button {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    background-color: gray;
    border: none;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background 0.3s;
}

    </style>
</head>
<body>
    <div id="feedbackModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Leave a Review</h2>
            <form action="">
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
                <textarea name="feedback" id="feedback" placeholder="Write your feedback...." required></textarea>
                <button type="submit">Submit Review</button>
            </form>
        </div>
    </div>

    <!-- <button id="openModal">Leave a Review</button> -->
    <script>
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
</body>
</html>