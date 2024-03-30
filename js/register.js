$(document).ready(function () {
    //for password field
    show_hide_password("password-field");
    //for confirm password field
    show_hide_password("confirm-password-field");
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