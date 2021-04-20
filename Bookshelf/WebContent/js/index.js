// Generic close popup button (pass ID as a parameter to this function)
function closePopup(popupID) {
    $("#" + popupID).css("display", "none");
}

// NEWSLETTER Popup code
function openNewsletterPopup() {
    $("#newsletter").css("display", "block");
}