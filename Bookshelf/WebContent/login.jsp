<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="fa fa-book"/>
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/base-mobile.css">
    <link rel="stylesheet" href="css/popups.css">
    <link rel="stylesheet" href="css/login.css">
    <script defer src="js/nav.js"></script>
    <title>BookShelf | Buy Books Online</title>
</head>

<body>

    <!-- HEADER AND NAVIGATION -->
    <header>
        <div class="logo"><i class="fa fa-book"></i>  BookShelf</div>
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
                <li id="login-btn"><a href="#">Login</a></li>
            </ul>
        </nav>
    </header>

    <!-- MAIN CONTENT OF PAGE -->
    <section class="form-container">

        <img src="images/books-image.svg" id="image"> <!-- Free SVG images -->
        <form action="LoginServlet" class="login-form" method="POST">
            <h1>Sign-in to your Account</h1>
            <div><i class="fa fa-user"></i><input type="text" name="username" id="username" placeholder="Username"></div>
            <div><i class="fa fa-lock"></i><input type="password" name="password" id="password" placeholder="Password"></div>
            <input type="submit" value="Login">
            <div>Don't have an account?<a href="signup.jsp">Sign-Up</a></div>
        </form>

    </section>

    <!-- POPUPS -->
    <!-- ADD TO BASKET POPUP -->
    <div class="popup" id="basket">
        <div class="popup-content">
            <span class="close-btn">&times</span>
            <h1>Added to Basket</h1>
            <p>This item has been successfully added to your basket!</p>
            <form action="#" class="newsletter">
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