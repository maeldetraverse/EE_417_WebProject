<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="fa fa-book" />
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/base-mobile.css">
    <link rel="stylesheet" href="css/basket.css">
    <link rel="stylesheet" href="css/popups.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script defer src="js/nav.js"></script>
    <script defer src="js/index.js"></script>
    <script defer src="js/basket-display.js"></script>
    <title>BookShelf | Buy Books Online</title>
</head>

<body>

    <!-- HEADER AND NAVIGATION -->
    <header>
    	<div class="logo"><i class="fa fa-book"></i> BookShelf</div>
    	<button class="mobile-btn">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="BestsellersServlet">Bestsellers</a></li>
                <li><a href="NovelServlet">Novels</a>
                </li>
                <li><a href="#">Fiction</a>
                    <ul>
                        <li><a href="ChildrensServlet">Children's</a></li>
                        <li><a href="ClassicsServlet">Classics</a></li>
                    </ul>
                </li>
                <li class="cart"><a href="basket.jsp">Basket</a></li>
                
                <!-- Admin Console -->
                <%@ page import="com.bookshelf.main.User" %>
                <%
	                User u = (User) session.getAttribute("user");
                	session.setAttribute("displayAdminConsole", false);
	                if(u!=null){
	                	String[] roles = u.getRoles();
	                	for(int i=0; i<roles.length; i++){
	                		if(roles[i].equals("admin") || roles[i].equals("engineer")) {
	                        	session.setAttribute("displayAdminConsole", true);
	                        }
	                	}
	                }
                %>
                <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
                <c:if test="${sessionScope.displayAdminConsole == true}">
			    	<li><a href="admin-console.jsp">Admin</a></li>
				</c:if>
                
                <!-- Login/logout button -->
                <% if(session.getAttribute("user")==null) { %>
                	<li id="login-btn"><a href="LoginServlet">Login</a></li>
                <% } else { %>
                	<li><a href="userinfo.jsp">Account</a>
                	<li id="login-btn"><a href="LogoutServlet">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </header>

    <!-- MAIN CONTENT OF PAGE -->
    <section class="main-content">
    
    	
    	<h1>My Basket</h1>
    	
    	<div id="my-basket">
    		<!-- Table goes here -->
    	</div>
    	
    	<button id="empty-button">Empty Basket</button>
    	
    	<form id="basketDataForm" method="post" action="CheckoutServlet">
    		<input id="basketData" name="basketData" type="hidden">
    		<input type="submit" value="Proceed to checkout">
    	</form>
    	
    	
    </section>


    <!-- POPUPS -->
    <!-- NEWSLETTER POPUP -->
    <div class="popup" id="newsletter">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup('newsletter')">&times</span>
            <h1>Newsletter</h1>
            <p>Subscribe to our newsletter to get 10% off your first order!</p>
            <form action="#" method="POST">
                <input type="email" name="email" id="email" placeholder="Enter your email...">
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </div>

    <!-- ADD TO BASKET POPUP -->
    <div class="popup" id="basket">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup('basket')">&times</span>
            <h1>Added to Basket</h1>
            <p>This item has been successfully added to your basket!</p>
            <form action="basket.jsp" method="post">
            	<input type="submit" value="View Basket">
                <input type="submit" value="Proceed to Checkout">
            </form>
        </div>
    </div>

    <!-- FOOTER SECTION -->
    <footer>
        <ul>
            <li>&copy BookShelf</li>
            <li>EE417 Group L</li>
            <li>April 2021</li>
        </ul>
    </footer>

</body>

</html>