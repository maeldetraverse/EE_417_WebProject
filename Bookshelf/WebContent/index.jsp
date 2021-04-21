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
    <script src="js/basket-add.js"></script>
    <title>BookShelf | Buy Books Online</title>
    <script>
    setTimeout(function () {
        openNewsletterPopup();
    }, 2000);
    </script>
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
        <h1>Best Sellers</h1>
        <div class="container">
            <figure class="book-container">
                <img src="https://images.gr-assets.com/books/1361975680m/2657.jpg">
                <p>Harper Lee</p>
                <p>&#x80 11.46</p>
                <a href="#">View</a>
                <button data-id="4"
	                data-title="To Kill a Mockingbird"
	                data-price="11.46"
	                data-thumbnail-url="https://images.gr-assets.com/books/1361975680m/2657.jpg"
	                data-stock="487"
	                class="basket-add-button">
					<i class="fa fa-shopping-cart"></i>
				</button>
            </figure>

            <figure class="book-container">
                <img src="https://images.gr-assets.com/books/1353029077m/100915.jpg">
                <p>C.S. Lewis</p>
                <p>&#x80 29.75</p>
                <a href="#">View</a>
                <button data-id="37"
	                data-title="The Lion, the Witch, and the Wardrobe"
	                data-price="29.75"
	                data-thumbnail-url="https://images.gr-assets.com/books/1353029077m/100915.jpg"
	                data-stock="474"
	                class="basket-add-button">
					<i class="fa fa-shopping-cart"></i>
				</button>
            </figure>

            <figure class="book-container">
                <img src="https://images.gr-assets.com/books/1344922523m/1953.jpg">
                <p>Charles Dickens</p>
                <p>&#x80 8.83</p>
                <a href="#">View</a>
                <button data-id="83"
	                data-title="A Tale of Two Cities"
	                data-price="8.83"
	                data-thumbnail-url="https://images.gr-assets.com/books/1344922523m/1953.jpg"
	                data-stock="525"
	                class="basket-add-button">
					<i class="fa fa-shopping-cart"></i>
				</button>
            </figure>

            <figure class="book-container">
                <img src="https://images.gr-assets.com/books/1320399351m/1885.jpg">
                <p>Jane Austen</p>
                <p>&#x80 25.44</p>
                <a href="#">View</a>
                <button data-id="10"
	                data-title="Pride and Prejudice"
	                data-price="25.44"
	                data-thumbnail-url="https://images.gr-assets.com/books/1320399351m/1885.jpg"
	                data-stock="3455"
	                class="basket-add-button">
					<i class="fa fa-shopping-cart"></i>
				</button>
            </figure>

            <figure class="book-container">
                <img src="https://images.gr-assets.com/books/1499277281m/5.jpg">
                <p>J.K. Rowling</p>
                <p>&#x80 23.99</p>
                <a href="#">View</a>
                <button data-id="18"
	                data-title="Harry Potter and the Prisoner of Azkaban"
	                data-price="23.99"
	                data-thumbnail-url="https://images.gr-assets.com/books/1499277281m/5.jpg"
	                data-stock="376"
	                class="basket-add-button">
					<i class="fa fa-shopping-cart"></i>
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