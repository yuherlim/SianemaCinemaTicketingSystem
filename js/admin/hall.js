
$(document).ready(function () {

 
});

//Function to swap photo based on selected radio btn 
function displayHallImage() {
    var hallType = document.querySelector('input[name="hallType"]:checked').value;
    var imgElement = document.getElementById("hallImage");
    if (hallType === "Large") {
        imgElement.src = "largehall.png";
    } else if (hallType === "Small") {
        imgElement.src = "smallhall.png";
    }
}
//Initial the image display for the modal
displayHallImage();


//Search html element 
const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const viewButton = $('.btnViewHall');
const confirmButton = $('#btnConfirm');

//Function for open modal
function openModal() {
    $('#modalHall').modal('toggle');
}

//Function for reuse modal for view hall by disable the input field, hide confirm btn, rename the modal header to view hall 
function viewHall() {
    modalHeader.text('View Hall');
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openModal();
}

//Set onClick listener for view button 
viewButton.click(viewHall);




