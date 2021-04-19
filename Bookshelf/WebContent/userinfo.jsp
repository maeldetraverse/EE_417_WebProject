<%@ page import="com.bookshelf.main.User"%>
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
    <link rel="stylesheet" href="css/signup.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script defer src="js/nav.js"></script>
    <script defer src="js/signup.js"></script>
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
                <li><a href="NonfictionServlet">Nonfiction</a>
                </li>
                <li><a href="#">Fiction</a>
                    <ul>
                        <li><a href="ChildrensServlet">Children's</a></li>
                        <li><a href="ClassicsServlet">Classics</a></li>
                    </ul>
                </li>
                <li class="cart"><a href="basket.jsp">Basket</a></li>
                <li><a href="#">Account</a>
                <li id="login-btn"><a href="LogoutServlet">Logout</a></li>
            </ul>
        </nav>
    </header>

	<% User u = (User) session.getAttribute("user"); %>
    <!-- MAIN CONTENT OF PAGE -->
    <section class="container">
        <div class="signup-form">
            <h1>Welcome to your Account</h1>
            <label for="username">Username</label>
            <p><%= u.getUsername() %></p>

            <label for="firstname">First Name</label>
            <p><%= u.getFirstName() %></p>

            <label for="lastname">Last Name</label>
            <p><%= u.getLastName() %></p>

            <label for="email">Email</label>
            <p><%= u.getEmail() %></p>

            <label for="address">Address</label>
            <p><%= u.getAddress() %></p>

            <label for="zipcode">Zip Code</label>
            <p><%= u.getZipcode() %></p>
        </div>
        
    </section>

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