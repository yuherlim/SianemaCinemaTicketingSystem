$(document).ready(function () {
    show_hide_password();
});

function show_hide_password() {
    $(".password-field a").on('click', function (event) {
        event.preventDefault();
        if ($('.password-field input').attr("type") == "text") {
            $('.password-field input').attr('type', 'password');
            $('.password-field i.show-hide-password').addClass("fa-eye-slash");
            $('.password-field i.show-hide-password').removeClass("fa-eye");
        } else if ($('.password-field input').attr("type") == "password") {
            $('.password-field input').attr('type', 'text');
            $('.password-field i.show-hide-password').removeClass("fa-eye-slash");
            $('.password-field i.show-hide-password').addClass("fa-eye");
        }
    });
}