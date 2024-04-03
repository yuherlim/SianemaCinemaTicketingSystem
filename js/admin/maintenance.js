
$(document).ready(function () {


    $("#tpMtnDateTime").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i K",
        time_24hr: false,

    });

    $("#tpMtnDuration").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i",
        time_24hr: false,

    });



});

const inputField = $('.modalInputField');
const viewButton = $('.btnViewMaintenance');


function openModal() {
    $('#modalMaintenance').modal('toggle');
}

item = document.getElementsByClassName('modalInputField');
console.log(item.length)

function viewMaintenance() {
    inputField.prop('disabled', true);
    openModal();
}

viewButton.click(viewMaintenance);




