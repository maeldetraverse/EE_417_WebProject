$("#username_error_message").hide();
$("#fname_error_message").hide();
$("#sname_error_message").hide();
$("#email_error_message").hide();
$("#password_error_message").hide();
$("#confirm_password_error_message").hide();

var error_username = false;
var error_fname = false;
var error_sname = false;
var error_email = false;
var error_password = false;
var error_retype_password = false;


var error_email_login = false;
var error_password_login = false;


$("#username").focusout(function () {
    isValidUsername();
});
$("#email").focusout(function () {
    isValidEmail();
});
$("#password").focusout(function () {
    isValidPassword();
});
$("#confirm-pwd").focusout(function () {
    isValidConfirmPassword();
});
$("#firstname").focusout(function () {
    isValidFirstname();
});
$("#lastname").focusout(function () {
    isValidLastname();
});
function isValidUsername() {
    var username = $("#username").val();
    if (username == null || username == '') {
        $("#username_error_message").html("Username cannot be empty");
        $("#username_error_message").show();
        $("#username").css("border-bottom", "2px solid #F90A0A");
        error_username = true;
    } else {
        $("#username_error_message").hide();
        $("#username").css("border-bottom", "2px solid #34F458");
    }
}

function isValidFirstname() {
    var pattern = /^[a-zA-Z]*$/;
    var firstname = $("#firstname").val();

    if (firstname != null && firstname != '') {
        console.log('##', firstname);
        if (pattern.test(firstname) && firstname !== '') {
            $("#fname_error_message").hide();
            $("#firstname").css("border-bottom", "2px solid #34F458");
        } else {
            $("#fname_error_message").html("Should contain only Characters");
            $("#fname_error_message").show();
            $("#firstname").css("border-bottom", "2px solid #F90A0A");
            error_fname = true;
        }
    }
}

function isValidLastname() {
    var pattern = /^[a-zA-Z]*$/;
    var lastname = $("#lastname").val()
    if (lastname != null && lastname != '') {
        if (pattern.test(lastname) && lastname !== '') {
            $("#sname_error_message").hide();
            $("#lastname").css("border-bottom", "2px solid #34F458");
        } else {
            $("#sname_error_message").html("Should contain only Characters");
            $("#sname_error_message").show();
            $("#lastname").css("border-bottom", "2px solid #F90A0A");
            error_sname = true;
        }
    }
}

function isValidPassword() {
    var password_length = $("#password").val().length;
    if (password_length < 8) {
        $("#password_error_message").html("Atleast 8 Characters");
        $("#password_error_message").show();
        $("#password").css("border-bottom", "2px solid #F90A0A");
        error_password = true;
    } else {
        $("#password_error_message").hide();
        $("#password").css("border-bottom", "2px solid #34F458");
    }
}

function isValidConfirmPassword() {
    var password = $("#password").val();
    var retype_password = $("#confirm-pwd").val();
    if (retype_password == '' || retype_password == null) {
        $("#confirm_password_error_message").html("Confirm password cannot be blank");
        $("#confirm_password_error_message").show();
        $("#confirm-pwd").css("border-bottom", "2px solid #F90A0A");
        error_retype_password = true;
    } else {
        if (password !== retype_password) {
            $("#confirm_password_error_message").html("Passwords Did not Matched");
            $("#confirm_password_error_message").show();
            $("#confirm-pwd").css("border-bottom", "2px solid #F90A0A");
            error_retype_password = true;
        } else {
            $("#confirm_password_error_message").hide();
            $("#confirm-pwd").css("border-bottom", "2px solid #34F458");
        }
    }
}

function isValidEmail() {
    var pattern = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    var email = $("#email").val();
    if (pattern.test(email) && email !== '') {
        $("#email_error_message").hide();
        $("#email").css("border-bottom", "2px solid #34F458");
    } else {
        $("#email_error_message").html("Invalid Email");
        $("#email_error_message").show();
        $("#email").css("border-bottom", "2px solid #F90A0A");
        error_email = true;
    }
}
function validateForm() {
    error_username = false;
    error_fname = false;
    error_sname = false;
    error_email = false;
    error_password = false;
    error_retype_password = false;

    isValidUsername();
    isValidFirstname();
    isValidLastname();
    isValidEmail();
    isValidPassword();
    isValidConfirmPassword();

    if (error_username == false && error_fname === false && error_sname === false && error_email === false && error_password === false && error_retype_password === false) {
        alert("Registration Successfull");
        $("#registration_form")[0].reset();
        return true;
    } else {
        // alert("Please Fill the form Correctly");
        return false;
    }
}