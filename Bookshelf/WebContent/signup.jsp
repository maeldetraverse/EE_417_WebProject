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
                <li><a href="#">Classics</a>
                    <ul>
                        <li><a href="#">18th Century</a></li>
                        <li><a href="#">19th Century</a></li>
                        <li><a href="#">20th Century</a></li>
                    </ul>
                </li>
                <li><a href="#">Poetry</a>
                    <ul>
                        <li><a href="#">Ronsard</a></li>
                        <li><a href="#">Baudelaire</a></li>
                        <li><a href="#">Hugo</a></li>
                    </ul>
                </li>
                <li class="cart"><a href="#">Basket</a></li>
                <% if (request.getSession().getAttribute("user") == null) { %>
                	<li id="login-btn"><a href="LoginServlet">Login</a></li>
                <% } else { %>
                	<li id="login-btn"><a href="LogoutServlet">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </header>

    <!-- MAIN CONTENT OF PAGE -->
    <section class="container">
        <!-- onsubmit="return validateForm()" -->
        <form action="SignupServlet" class="signup-form" id="registration_form" method="post">
            <h1>Create your Account</h1>
            <label for="username">Username*</label>
            <input type="text" name="username" id="username" placeholder="Username">
            <span class="error_form" id="username_error_message"></span>

            <label for="password">Password*</label>
            <input type="password" name="password" id="password" placeholder="Password">
            <span class="error_form" id="password_error_message"></span>

            <label for="confirm-psw">Confirm Password*</label>
            <input type="password" name="confirm-pwd" id="confirm-pwd" placeholder="Confirm Password">
            <span class="error_form" id="confirm_password_error_message"></span>

            <label for="firstname">First Name</label>
            <input type="text" name="first_name" id="firstname" placeholder="First Name">
            <span class="error_form" id="fname_error_message"></span>

            <label for="lastname">Last Name</label>
            <input type="text" name="last_name" id="lastname" placeholder="Last Name">
            <span class="error_form" id="sname_error_message"></span>

            <label for="email">Email</label>
            <input type="email" name="email" id="email" placeholder="Email">
            <span class="error_form" id="email_error_message"></span>

            <label for="address">Address</label>
            <input type="text" name="address_1" id="address" placeholder="Address">

            <label for="zipcode">Zip Code</label>
            <input type="text" name="address_postcode" id="zipcode" placeholder="Zip Code">

            <p><em><small>Fields marked * are required</small></em></p>
            <input type="submit" value="Sign-Up">
        </form>
        
        <!-- SUCCESS/FAIL NOTIFICATION -->
        ${notification}
        
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