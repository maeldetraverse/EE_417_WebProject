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
    <link rel="stylesheet" href="css/popups.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script defer src="js/nav.js"></script>
    <script defer src="js/index.js"></script>
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
    <section class="basket">

        <!-- DYNAMICALLY ADD BASKET ITEMS HERE -->
        <div class="items">

        </div>

    </section>

    <!-- POPUP CHECKOUT WHEN "CHECKOUT" BUTTON PRESSED-->
    <div class="popup" id="pay-popup">
        <div class="popup-content">
            <form action="#" class="pay-form" method="POST">
                <h1>Checkout</h1>
                <label for="cardnumber">Card Number</label>
                <input type="text" name="cardnumber" id="cardnumber" placeholder="xxxx-xxxx-xxxx-xxxx" maxlength="19"
                    required=true>
                <div class="inner">
                    <label for="cvv">CVV</label>
                    <input type="text" name="cvv" id="cvv" placeholder="xxx" maxlength="3" required=true>
                    <label for="expiry">Expiry</label>
                    <input type="text" name="expiry" id="expiry" placeholder="mm/yy" maxlength="5" required=true>
                </div>
                <div id="pay-total">Total: &#x80 00.00</div>
                <input type="submit" value="Pay Now">
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