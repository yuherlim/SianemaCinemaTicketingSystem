$(document).ready(function () {
    cssClassInjection();
});

function cssClassInjection() {
    //css class injection to radiobutton server controls.
    $('.gender-field input').addClass("form-check-input");
    $('.gender-field label').addClass("form-check-label");
    $('.gender-field tr td').addClass("form-check form-check-inline");
}