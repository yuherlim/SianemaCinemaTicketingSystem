
$(document).ready(function () {


    $('#sltGenre').select2({
        dropdownParent: $('#modalMovie')
    });

    $('#sltLanguage').select2({
        dropdownParent: $('#modalMovie')
    });

    $('#sltSubtitle').select2({
        dropdownParent: $('#modalMovie')
    });

    $("#tpDuration").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i",
        time_24hr: true,
        minTime: "00:00",
        maxTime: "04:00",
    });

    $("#tpReleaseDate").flatpickr({
        dateFormat: "d-m-Y",
    });

    $('#sltCast').select2({
        dropdownParent: $('#modalMovie'),
        tags: true

    });

    $("#tpScreenFrom").flatpickr({
        dateFormat: "d-m-Y",
    });

    $("#tpScreenUntil").flatpickr({
        dateFormat: "d-m-Y",
        minDate: "today",
    });

  
    console.log('2');

   
});

const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const addButton = $('#btnAddMovie');
const viewButton = $('.btnViewMovie');
const editButton = $('.btnEditMovie');
const confirmButton = $('#btnConfirm');


function openModal() {
    $('#modalMovie').modal('toggle');
}

function editMovie() {
    modalHeader.text('Edit Movie');
    confirmButton.prop('hidden', false);
    inputField.prop('disabled', false);
    openModal();
}

function addMovie() {
    modalHeader.text('Add Movie');
    confirmButton.prop('hidden', false);
    inputField.prop('disabled', false);
 
}

item = document.getElementsByClassName('modalInputField');
console.log(item.length)

function viewMovie() {
    modalHeader.text('View Movie');
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openModal();
}

viewButton.click(viewMovie);
editButton.click(editMovie);




