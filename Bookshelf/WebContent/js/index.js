var bookObject = [
    {
        "title": "Alexandre Dumas ",
        "id": "ec1040",
        "color": "White",
        "price": 9.99,
        "availability": "Available"
    },
    {
        "title": "C.S. Lewis",
        "id": "ec1041",
        "color": "White",
        "price": 8.50,
        "availability": "Out of stock"
    },
    {
        "title": "Charles Dickens",
        "id": "ec1042",
        "color": "Brown",
        "price": 11.60,
        "availability": "Available"
    },
    {
        "title": "Jane Austen",
        "id": "ec1043",
        "color": "Rose Gold",
        "price": 7.50,
        "availability": "Available"
    },
    {
        "title": "Jonathan Swift",
        "id": "ec1043",
        "color": "Tan Brown",
        "price": 4.99,
        "availability": "Out of stock"
    }
]
var temp = [];
function addtoCart(bookName) {
    temp.push(bookName); 
    sessionStorage.setItem('bookCart', JSON.stringify(temp));
    $("#basket").css("display", "block");
}

// add cart to hidden field
function addCart() {
	$("#book-cart").val(sessionStorage.getItem('bookCart'));
}

// submit hidden field when basket is clicked
function submitForm() {
	var form = $("#book-form");
	addCart();
	form.submit();
}

// function viewBasket() {
//     $("#basket").css("display", "block");
// }

// Generic close popup button (pass ID as a parameter to this function)
function closePopup(popupID) {
    $("#" + popupID).css("display", "none");
}

// NEWSLETTER Popup code START
setTimeout(function () {
    openNewsletterPopup();
}, 2000);
function openNewsletterPopup() {
    $("#newsletter").css("display", "block");
}
// NEWSLETTER Popup code END