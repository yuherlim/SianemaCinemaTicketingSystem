
const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const addButton = $('#btnAddMovie');
const editButton = $('.btnEditMovie');
const viewButton = $('.timeSlot');
const confirmButton = $('#btnConfirm');
const addTimeSlotButton = $('#btnAddTimeSlot');
const selectorGenre = $('#sltGenre');
const selectorClass = $('#sltClass');
const selectorLanguage = $('#sltLanguage');
const selectorSubtitle = $('#sltSubtitle');
const selectorCast = $('#sltCast');
const lblmovieGenre = $('#movGenreValue');
const lblmovieClass = $('#movClassificationValue');
const lblmovieLanguage = $('#movLanguageValue');
const lblmovieSubtitle = $('#movSubtitleValue');
const lblmovieCast = $('#movCastValue');
const lblmovieDuration = $('#movDurationValue');
const lblmovieReleaseDate = $('#movReleaseDateValue');
const lblmovieScreenFrom = $('#movScreenFromValue');
const lblmovieScreenUntil = $('#movScreenUntilValue');
const lblmovieSynopsis = $('#movSynopsisValue');
const lblmovPosterImage = $('#movPosterImageValue');
const lblmovCoverPhotoImage = $('#movCoverPhotoImageValue');
const lblbtnConfirmMode = $('#btnConfirmMode');
const lblTimeSlotDateValue = $('#TimeSlotDateValue');
const txtAreaSypnosis = $('#txtSynopsis');
const txtName = $('#txtName');
const movPosterImage = $('#movPosterImage');
const movCoverPhotoImage = $('#movCoverPhotoImage');
const fuPoster = $('#fuPoster');
const fuCoverPhoto = $('#fuCoverPhoto');
const tpMovEndTime = $('#tpMovEndTime');
const tpMovDuration = $('#tpMovDuration');
const tpMtnEndTime = $('#tpMtnEndTime');
const lblHallName = $('#lblHallName');
tpMovEndTime.prop('disabled', true);
tpMovDuration.prop('disabled', true);
tpMtnEndTime.prop('disabled', true);



flatpickrSelectDate = $("#tpSelectDate").flatpickr({
    dateFormat: "d-m-Y",
    onChange: function (selectedDates, dateStr, instance) {
        lblTimeSlotDateValue.val(dateStr);
    }
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

flatpickrDuration = $("#tpDuration").flatpickr({
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true,
    minTime: "00:00",
    maxTime: "04:00",
});


flatpickrReleaseDate = $("#tpReleaseDate").flatpickr({
    dateFormat: "d-m-Y",
});

$('#sltCast').select2({
    dropdownParent: $('#modalMovie'),
    tags: true

});

flatpickrScreenFrom = $("#tpScreenFrom").flatpickr({
    dateFormat: "d-m-Y",
});

flatpickrScreenUntil = $("#tpScreenUntil").flatpickr({
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

flatpickrSelectDate.setDate(lblTimeSlotDateValue.val());
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

function openModal() {
    $('#modalMovie').modal('toggle');
    addOption(lblmovieGenre.val(), selectorGenre);
    selectorGenre.val(stringToArray(lblmovieGenre.val())).trigger('change');

    addOption(lblmovieClass.val(), selectorClass);
    selectorClass.val(stringToArray(lblmovieClass.val())).trigger('change');

    addOption(lblmovieLanguage.val(), selectorLanguage);
    selectorLanguage.val(stringToArray(lblmovieLanguage.val())).trigger('change');

    addOption(lblmovieSubtitle.val(), selectorSubtitle);
    selectorSubtitle.val(stringToArray(lblmovieSubtitle.val())).trigger('change');

    addOption(lblmovieCast.val(), selectorCast);
    selectorCast.val(stringToArray(lblmovieCast.val())).trigger('change');

    flatpickrDuration.setDate(convertStringToTimeFormat(lblmovieDuration.val()));
    flatpickrDuration.config.enableTime = true;
    flatpickrDuration.config.noCalendar = true;

    flatpickrReleaseDate.setDate(lblmovieReleaseDate.val());
    flatpickrScreenFrom.setDate(lblmovieScreenFrom.val());
    flatpickrScreenUntil.setDate(lblmovieScreenUntil.val());

    txtAreaSypnosis.val(lblmovieSynopsis.val());

    let movPosterBase64String = lblmovPosterImage.val();
    let movPosterDataUrl = 'data:image/jpeg;base64,' + movPosterBase64String;
    movPosterImage.attr("src", movPosterDataUrl);

    let movCoverPhotoImageBase64String = lblmovCoverPhotoImage.val();
    let movCoverPhotoImagerDataUrl = 'data:image/jpeg;base64,' + movCoverPhotoImageBase64String;
    movCoverPhotoImage.attr("src", movCoverPhotoImagerDataUrl);

}


function openMovieModal() {
    $('#modalMovie').modal('toggle');
}

function openTimeSlotModal() {
    $('#modalTimeSlot').modal('toggle');
    lblHallName

}

function viewMovie() {
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openModal();
}


function addOption(string, selector) {
    // Split the string into an array of values
    var values = string.split(',');

    // Get the current options in the Select2 element
    var currentOptions = selector.find("option");

    // Create an empty array to store the options
    var options = [];


    // Loop through the array of values
    for (var i = 0; i < values.length; i++) {
        // Trim the whitespace from the value
        var value = values[i].trim();

        var isOptionRegistered = currentOptions.filter(function () {
            return $(this).val() === value;
        }).length > 0;

        // If the option is not registered, create a new option element with the value
        if (!isOptionRegistered) {

            // Create a new option element with the value
            var option = new Option(value, value, false, false);

            // Add the option to the array
            options.push(option);
        }
    }

    // Add the options to the Select2 element
    selector.append(options);
}

function stringToArray(string) {
    var values = string.split(',');

    // Loop through the array of values
    for (var i = 0; i < values.length; i++) {
        // Trim the whitespace from the value
        values[i] = values[i].trim();
    }

    return values
}

function convertStringToTimeFormat(string) {
    var time = new Date();
    var parts = '02:00:00'.split(':');
    time.setHours(parts[0]);
    time.setMinutes(parts[1]);
    time.setSeconds(parts[2]);

    return time
}


const lblTimeSlotButtons = $('.timeSlotButton');

lblTimeSlotButtons.each(function () {
    const button = $(this);
    const id = button.attr('id') + ".value";
    const hiddenField = document.getElementById(id);
    const data = hiddenField.value;

    // Split hidden field value into startTime and duration
    const [movieID, maintenanceID, startTime, duration] = data.split(',');

    // Calculate time slots
    const { startingSlotIndex, spanSlots } = calculateTimeSlots(startTime, duration);

    const timeSlots = startingSlotIndex + ' / span ' + spanSlots;

    if (movieID != "NA") {
        button.parent().parent().css('background-color', 'green');
    } else {
        button.parent().parent().css('background-color', 'red');
    }
    button.parent().parent().css('grid-column', timeSlots);
});




function calculateTimeSlots(startTime, duration) {
    // Convert start time to minutes
    const [startHour, startMinute] = startTime.split(":").map(Number);

    if (startHour < 10) {
        startHour += 24;
    }

    const startTimeMinutes = startHour * 60 + startMinute;

    // Convert duration to minutes
    const [durationHour, durationMinute] = duration.split(":").map(Number);
    const durationMinutes = durationHour * 60 + durationMinute;

    // Calculate starting slot index
    var startingSlotIndex = Math.floor((startTimeMinutes - 600) / 15) + 3; 

    // Calculate number of span slots
    const spanSlots = Math.ceil(durationMinutes / 15);

    startingSlotIndex += 1;

    return {
        startingSlotIndex,
        spanSlots
    };
}
