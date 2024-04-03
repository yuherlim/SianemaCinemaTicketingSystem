
$(document).ready(function () {

    function displayHallImage() {
        var hallType = document.querySelector('input[name="hallType"]:checked').value;
        var imgElement = document.getElementById("hallImage");
        if (hallType === "Large") {
            imgElement.src = "largehall.png";
        } else if (hallType === "Small") {
            imgElement.src = "smallhall.png";
        }
    }

    displayHallImage();

});

const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const viewButton = $('.btnViewHall');
const confirmButton = $('#btnConfirm');


function openModal() {
    $('#modalHall').modal('toggle');
}

function viewHall() {
    modalHeader.text('View Hall');
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openModal();
}

viewButton.click(viewHall);




