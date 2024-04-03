$(document).ready(function () {
    $("#tpSelectDate").flatpickr({
        dateFormat: "d-m-Y",
    });

    $('#sltGenre').select2({
        dropdownParent: $('#modalMovie')
    });

    $('#sltClass').select2({
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

    $('#sltMovie').select2({
        dropdownParent: $('#modalTimeSlot')
    });

    $('#sltLanguage').select2({
        dropdownParent: $('#modalMovie')
    });

    $('#sltSubtitle').select2({
        dropdownParent: $('#modalMovie')
    });

    $("#tpMovStartTime").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i K",
        time_24hr: false,

    });

    $("#tpMovDuration").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i",
        time_24hr: false,

    });

    $("#tpMovEndTime").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i K",
        time_24hr: false,

    });

    $("#tpMtnStartTime").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i K",
        time_24hr: false,

    });

    $("#tpMtnDuration").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i",
        time_24hr: true,

    });

    $("#tpMtnEndTime").flatpickr({
        enableTime: true,
        noCalendar: true,
        dateFormat: "h:i K",
        time_24hr: false,

    });

    const tpMovEndTime = $('#tpMovEndTime');
    const tpMovDuration = $('#tpMovDuration');
    const tpMtnEndTime = $('#tpMtnEndTime');

    tpMovEndTime.prop('disabled', true);
    tpMovDuration.prop('disabled', true);
    tpMtnEndTime.prop('disabled', true);

    $(".tabs").click(function () {

        $(".tabs").removeClass("active");
        $(".tabs h6").removeClass("font-weight-bold");
        $(".tabs h6").addClass("text-muted");
        $(this).children("h6").removeClass("text-muted");
        $(this).children("h6").addClass("font-weight-bold");
        $(this).addClass("active");

        $current_fs = $(".active");

        next_fs = $(this).attr('id');
        next_fs = "#" + next_fs + "1";

        $("fieldset").removeClass("show");
        $(next_fs).addClass("show");

        $current_fs.animate({}, {
            step: function () {
                current_fs.css({
                    'display': 'none',
                    'position': 'relative'
                });
                next_fs.css({
                    'display': 'block'
                });
            }
        });

        if ($("#modalTSTitle").text() == "Assign Movie") {
            $("#modalTSTitle").text("Add Maintenance");
        } else {
            $("#modalTSTitle").text("Assign Movie");
        }

    });

});


const inputField = $('.modalInputField');
const viewButton = $('.timeSlot');
const confirmButton = $('#btnConfirm');
const addTimeSlotButton = $('#btnAddTimeSlot');

function openMovieModal() {
    $('#modalMovie').modal('toggle');
}

function openTimeSlotModal() {
    $('#modalTimeSlot').modal('toggle');
}

function viewMovie() {
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openMovieModal();
}

viewButton.click(viewMovie);

var timeSlot = $('.timeSlotMovieName');

//for (var item in timeSlot) { 
//    var mtn = item.children('#hfMtnID');
//    if (mtn.text() != "NA") {
//        item.text = item.children('#hfMovName').text();
//        if (item.children('#hfMovName').text() === 'YOLO') { 
//        item.css("grid-column", "40 / span 15");
//    } else {
//        item.css("grid-column", "20 / span 15");
//        }
//    item.css("background-color", "#00bfff");
//    }
//    else {
//        item.text = 'Maintenance';
//        item.css("background-color", "red");
//    }
//}
timeSlot = timeSlot.filter(function () { return $(this).text().toLowerCase() === "yolo"; })
timeSlot.parent().css("grid-column", "40 / span 15");



console.log(timeSlot.length);