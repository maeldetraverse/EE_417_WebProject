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
    <link rel="stylesheet" href="css/index.css">
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
                <li class="cart"><a href="#" onclick="submitForm()">Basket</a></li>
                <% if (request.getSession().getAttribute("user") == null) { %>
                	<li id="login-btn"><a href="LoginServlet">Login</a></li>
                <% } else { %>
                	<li id="login-btn"><a href="LogoutServlet">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </header>

    <!-- MAIN CONTENT OF PAGE -->
    <section class="main-content">
        <h1>Best Sellers</h1>
        <div class="container">
            <figure class="book-container">
                <img src="https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/0995/9780099518945.jpg">
                <p>Alexandre Dumas</p>
                <p>&#x80 9.99</p>
                <a href="#">View</a>
                <button class="add-to-basket" onclick="addtoCart(bookObject[0])"><i class="fa fa-shopping-cart"></i>
                </button>
            </figure>

            <figure class="book-container">
                <img src="https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4104/9781410499257.jpg">
                <p>C.S. Lewis</p>
                <p>&#x80 8.50</p>
                <a href="#">View</a>
                <button class="add-to-basket" onclick="addtoCart(bookObject[1])"><i class="fa fa-shopping-cart"></i>
                </button>
            </figure>

            <figure class="book-container">
                <img src="https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/3939/9780393960693.jpg">
                <p>Charles Dickens</p>
                <p>&#x80 11.60</p>
                <a href="#">View</a>
                <button class="add-to-basket" onclick="addtoCart(bookObject[2])"><i class="fa fa-shopping-cart"></i>
                </button>
            </figure>

            <figure class="book-container">
                <img src="https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8532/9781853260001.jpg">
                <p>Jane Austen</p>
                <p>&#x80 7.50</p>
                <a href="#">View</a>
                <button class="add-to-basket" onclick="addtoCart(bookObject[3])"><i class="fa fa-shopping-cart"></i>
                </button>
            </figure>

            <figure class="book-container">
                <img src="https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1414/9780141439495.jpg">
                <p>Jonathan Swift</p>
                <p>&#x80 4.99</p>
                <a href="#">View</a>
                <button class="add-to-basket" onclick="addtoCart(bookObject[4])"><i class="fa fa-shopping-cart"></i>
                </button>
            </figure>

        </div>
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
            <form action="CartServlet" method="post" onsubmit="addCart()" id="book-form">
            	<input type="hidden" id="book-cart" name="book-cart" value="">
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