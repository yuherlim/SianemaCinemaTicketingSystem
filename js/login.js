$(document).ready(function () {
    show_hide_password("password-field");
    cssClassInjection();
});

function show_hide_password(password_field_type) {
    $(`.${password_field_type} a`).on('click', function (event) {
        event.preventDefault();
        if ($(`.${password_field_type} input`).attr("type") == "text") {
            $(`.${password_field_type} input`).attr('type', 'password');
            $(`.${password_field_type} i.show-hide-password`).addClass("fa-eye-slash");
            $(`.${password_field_type} i.show-hide-password`).removeClass("fa-eye");
        } else if ($(`.${password_field_type} input`).attr("type") == "password") {
            $(`.${password_field_type} input`).attr('type', 'text');
            $(`.${password_field_type} i.show-hide-password`).removeClass("fa-eye-slash");
            $(`.${password_field_type} i.show-hide-password`).addClass("fa-eye");
        }
    });
}

function cssClassInjection() {
    //css class injection to checkbox server controls.
    $('.form-check input').addClass("form-check-input");
    $('.form-check label').addClass("form-check-label");
}
