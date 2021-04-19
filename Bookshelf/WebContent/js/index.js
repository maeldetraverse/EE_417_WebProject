var bookObject = [
    {
        "title": "The Count of Monte Cristo",
        "id": "1040",
        "color": "White",
        "price": 9.99,
        "availability": "Available",
        "thumbnail_url": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1525838415l/6632850._SX98_.jpg",
        "stock": 101
    },
    {
        "title": "The Lion, The Witch and the Wardrobe",
        "id": "1041",
        "color": "White",
        "price": 8.50,
        "availability": "Out of stock",
        "thumbnail_url": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1362932908l/7806720._SX98_.jpg",
        "stock": 0
    },
    {
        "title": "Great Expectations",
        "id": "1042",
        "color": "Brown",
        "price": 11.60,
        "availability": "Available",
        "thumbnail_url": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1347392469l/2626._SY160_.jpg",
        "stock": 58
    },
    {
        "title": "Pride and Prejudice",
        "id": "1043",
        "color": "Rose Gold",
        "price": 7.50,
        "availability": "Available",
        "thumbnail_url": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1526617241l/34728047._SX98_.jpg",
        "stock": 303
    },
    {
        "title": "Gulliver's Travels",
        "id": "1043",
        "color": "Tan Brown",
        "price": 4.99,
        "availability": "Out of stock",
        "thumbnail_url": "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1427829692l/7733._SX98_.jpg",
        "stock": 0
    }
]

// retrieve basket from session storage - if undefined create an empty one
if (typeof sessionStorage.basket === "undefined") {
	var temp = [];
} else {
	var temp = JSON.parse(sessionStorage.basket);
}

function addtoCart(bookName) {
    temp.push(bookName); 
    sessionStorage.setItem('basket', JSON.stringify(temp));
    $("#basket").css("display", "block");
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