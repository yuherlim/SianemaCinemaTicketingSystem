
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
const selectorMovie = $('#sltMovie');
const movTimeSlotPosterImage = $('#movTimeSlotPosterImage');
const lblSelectedMovieValue = $('#selectedMovieValue');
const lblStarTimeValue = $('#starTimeValue');
const lblDurationTimeValue = $('#durationTimeValue');
const lblmovieStartTimeIsvalid = $('#movieStartTimeIsvalid');
const lblstarTimeValidity = $('#starTimeValidity');
var movieList = [];
var timeSlotList = [];



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
}).on('change', function (e) {
    var data = $("#sltMovie option:selected").text();
    lblSelectedMovieValue.val(data);
    let movCoverPhotoImageBase64String = searchPropertyValue(movieList, "movieName", data, "moviePoster");
    let movCoverPhotoImagerDataUrl = 'data:image/jpeg;base64,' + movCoverPhotoImageBase64String;
    movTimeSlotPosterImage.attr("src", movCoverPhotoImagerDataUrl);
    var movieDurationStr = searchPropertyValue(movieList, "movieName", data, "movieDuration");
    var movieDuration = add30Minutes(convertStringToTimeFormat(movieDurationStr));
    flatpickrtpMovDuration.setDate(movieDuration);
    flatpickrtpMovDuration.config.enableTime = true;
    flatpickrtpMovDuration.config.noCalendar = true;
    lblDurationTimeValue.val(convertTimeToString(movieDuration));

});

$('#sltLanguage').select2({
    dropdownParent: $('#modalMovie')
});

$('#sltSubtitle').select2({
    dropdownParent: $('#modalMovie')
});

flatpickrtpMovStartTime = $("#tpMovStartTime").flatpickr({
    enableTime: true,
    noCalendar: true,
    minTime: "10:00",
    maxTime: "02:00",
    dateFormat: "h:i K",
    time_24hr: false,
    onChange: function (selectedDates, dateStr, instance) {

        lblStarTimeValue.val(dateStr);
        var newMovieStartTime = convert12HrsTimeToMinutes(dateStr);
        var newMovieDuration = convertTimeToMinutes(lblDurationTimeValue.val());
        var result = isNewMovieValid("10:00", "02:00", timeSlotList, newMovieStartTime, newMovieDuration);
        if (result) {
            lblmovieStartTimeIsvalid.css({
                'color': 'green'
            });
            lblmovieStartTimeIsvalid.text("Valid");
            lblstarTimeValidity.val("Valid");


        } else {
            lblmovieStartTimeIsvalid.css({
                'color': 'red'
            });
            lblmovieStartTimeIsvalid.text("Invalid");
            lblstarTimeValidity.val("Invalid");


        }
        var movEndTime = addTimes(dateStr, lblDurationTimeValue.val());

        flatpickrtpMovEndTime.setDate(convertStringToTimeFormat(movEndTime));
        flatpickrtpMovEndTime.config.enableTime = true;
        flatpickrtpMovEndTime.config.noCalendar = true;
        flatpickrtpMovEndTime.config.dateFormat = "h:i K";
        flatpickrtpMovEndTime.config.time_24hr = false;
   
    }
});

flatpickrtpMovDuration = $("#tpMovDuration").flatpickr({
    enableTime: true,
    noCalendar: true,
    dateFormat: "h:i",
    time_24hr: false,

});

flatpickrtpMovEndTime = $("#tpMovEndTime").flatpickr({
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
    var hallID = formatHallId(lblHallName.text());
    fetchMovieData(lblTimeSlotDateValue.val());
    fetchHallTimeSlotData(hallID, lblTimeSlotDateValue.val());

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
    var startingSlotIndex = Math.floor((startTimeMinutes - 600) / 15) + 1;

    // Calculate number of span slots
    const spanSlots = Math.ceil(durationMinutes / 15);

    startingSlotIndex += 1;

    return {
        startingSlotIndex,
        spanSlots
    };
}


function fetchMovieData(selectedDate) {
    // Make an AJAX request to fetch data from the server based on the hallTimeSlotID
    fetch('HallTimeSlot.aspx/GetMovieData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ selectedDate: selectedDate })
    })
        .then(response => {
            // Check if the response status is successful
            console.log('Response:', response);  // Log the response
            if (!response.ok) {
                throw new Error(`HTTP error ${response.status}: ${response.statusText}`);
            }
            return response.json(); // Parse the JSON response
        })
        .then(data => {
            // Log the data
            console.log('Received data:', data);
            const parsedData = JSON.parse(data.d);
            updateMovieSelection(parsedData);
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
}

function fetchHallTimeSlotData(hallId, selectedDate) {
    // Make an AJAX request to fetch data from the server based on the hallTimeSlotID
    fetch('HallTimeSlot.aspx/GetHallTimeSlotData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            hallId: hallId,
            selectedDate: selectedDate
        })
    })
        .then(response => {
            // Check if the response status is successful
            console.log('Response:', response);  // Log the response
            if (!response.ok) {
                throw new Error(`HTTP error ${response.status}: ${response.statusText}`);
            }
            return response.json(); // Parse the JSON response
        })
        .then(data => {
            // Log the data
            console.log('Received data:', data);
            const parsedData = JSON.parse(data.d);
            updateTimeSlotdata(parsedData);
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
}

function joinPropertyOfObjectListToString(objectList, propertyName, separator) {
    // Extract the specified property from each object and join them using the separator
    var joinedString = objectList.map(function (obj) {
        return obj[propertyName];
    }).join(separator);

    return joinedString;
}

// Function to update the modal body with the fetched data
function updateMovieSelection(data) {
    if (data) {
        movieList = data;
        var movieString = joinPropertyOfObjectListToString(movieList, "movieName", ",");
        addOption(movieString, selectorMovie);
        let movCoverPhotoImageBase64String = movieList[0]["moviePoster"];
        let movCoverPhotoImagerDataUrl = 'data:image/jpeg;base64,' + movCoverPhotoImageBase64String;
        movTimeSlotPosterImage.attr("src", movCoverPhotoImagerDataUrl);
        var movieDurationStr = searchPropertyValue(movieList, "movieName", movieList[0]["movieName"], "movieDuration");
        var movieDuration = add30Minutes(convertStringToTimeFormat(movieDurationStr));
        flatpickrtpMovDuration.setDate(movieDuration);
        flatpickrtpMovDuration.config.enableTime = true;
        flatpickrtpMovDuration.config.noCalendar = true;
        lblDurationTimeValue.val(convertTimeToString(movieDuration));

        var newMovieStartTime = convert12HrsTimeToMinutes(lblStarTimeValue.val);
        var newMovieDuration = convertTimeToMinutes(lblDurationTimeValue.val());
        var result = isNewMovieValid("10:00", "02:00", timeSlotList, newMovieStartTime, newMovieDuration);
        if (result) {
            lblmovieStartTimeIsvalid.css({
                'color': 'green'
            });
            lblmovieStartTimeIsvalid.text("Valid");
            lblstarTimeValidity.val("Valid");


        } else {
            lblmovieStartTimeIsvalid.css({
                'color': 'red'
            });
            lblmovieStartTimeIsvalid.text("Invalid");
            lblstarTimeValidity.val("Invalid");


        }


    } else {
        console.warn('No data provided to update modal body');
    }
}

function updateTimeSlotdata(data) {
    if (data) {
        timeSlotList = data;

    } else {
        console.warn('No data provided to update modal body');
    }
}

function searchPropertyValue(objectList, propertyName, propertyValue, searchPropertyName) {
    // Iterate over each object in the array
    for (var i = 0; i < objectList.length; i++) {
        // Check if the current object has the specified property name
        if (objectList[i].hasOwnProperty(propertyName)) {
            // If the property value matches the specified value, return it
            if (objectList[i][propertyName] === propertyValue) {
                return objectList[i][searchPropertyName];
            }
        }
    }
    // If the property value is not found in any object, return null
    return null;
}


function convertStringToTimeFormat(string) {
    var time = new Date();
    var parts = string.split(':');
    time.setHours(parts[0]);
    time.setMinutes(parts[1]);
    time.setSeconds(parts[2]);

    return time
}

function convertTimeToString(time) {
    // Get hours, minutes, and seconds from the Date object
    var hours = time.getHours().toString().padStart(2, '0');
    var minutes = time.getMinutes().toString().padStart(2, '0');
    var seconds = time.getSeconds().toString().padStart(2, '0');

    // Concatenate hours, minutes, and seconds with ":" separator
    var timeString = hours + ":" + minutes + ":" + seconds;

    return timeString;
}



function add30Minutes(time) {
    // Clone the original time object to avoid modifying it directly
    var newTime = new Date(time);

    // Add 30 minutes to the minutes component
    var currentMinutes = newTime.getMinutes();
    var newMinutes = (currentMinutes + 30) % 60; // Get the new minutes value
    var overflowHours = Math.floor((currentMinutes + 30) / 60); // Calculate overflow hours

    // Increment the hours by overflowHours (if any)
    newTime.setHours(newTime.getHours() + overflowHours);

    // Update the minutes component
    newTime.setMinutes(newMinutes);

    return newTime;
}

function formatHallId(hallName) {
    // Split the hall name into two parts: "Hall" and the number
    var parts = hallName.split(' ');

    // If the split result has exactly two parts and the first part is "Hall"
    if (parts.length === 2 && parts[0] === "Hall") {
        // Combine the parts with a hyphen "-"
        return parts[0] + "-" + parts[1];
    } else {
        // If the format is not as expected, return the original hall name
        return hallName;
    }
}


function convertStartTimeToMinutes(time) {
    var parts = time.split(':');
    var hours = parseInt(parts[0]);
    var minutes = parseInt(parts[1]);
    if (hours < 10) {
        return (hours + 24) * 60 + minutes;
    }
    else { return hours * 60 + minutes; }

}

function convertTimeToMinutes(time) {
    var parts = time.split(':');
    var hours = parseInt(parts[0]);
    var minutes = parseInt(parts[1]);
    return hours * 60 + minutes;

}

function isNewMovieValid(cinemaStartTime, cinemaEndTime, timeSlotList, newMovieStartTime, newMovieDuration) {
    // Convert time format inputs to minutes past midnight
    cinemaStartTime = convertStartTimeToMinutes(cinemaStartTime);
    cinemaEndTime = convertStartTimeToMinutes(cinemaEndTime);


    // Convert movie start times in the list to minutes past midnight
    var movieStartTimes = timeSlotList.map(function (movie) {
        return convertStartTimeToMinutes(movie.hallTimeSlotTime);
    });

    var movieDurations = timeSlotList.map(function (movie) {
        return convertTimeToMinutes(movie.hallTimeSlotDuration);
    });

    // Check if new movie start time is within cinema operating hours
    if (newMovieStartTime < cinemaStartTime || newMovieStartTime + newMovieDuration > cinemaEndTime) {
        return false;
    }

    // Check if new movie overlaps with any existing movie
    for (var i = 0; i < movieStartTimes.length; i++) {
        var existingStartTime = movieStartTimes[i];
        var existingDuration = movieDurations[i];

        if (
            (newMovieStartTime >= existingStartTime && newMovieStartTime < existingStartTime + existingDuration) ||
            (newMovieStartTime + newMovieDuration > existingStartTime && newMovieStartTime + newMovieDuration <= existingStartTime + existingDuration) ||
            (newMovieStartTime <= existingStartTime && newMovieStartTime + newMovieDuration >= existingStartTime + existingDuration)
        ) {
            return false;
        }
    }

    // If new movie passes all checks, return true
    return true;
}

function convert12HrsTimeToMinutes(timeStr) {
    // Extract hours, minutes, and period from the input string
    var [time, period] = timeStr.split(" ");
    var [hours, minutes] = time.split(":").map(Number);

    // Adjust hours based on AM/PM
    if (period === "PM" && hours !== 12) {
        hours += 12; // Add 12 hours for PM times (except 12 PM)
    } else if (period === "AM" && hours === 12) {
        hours = 0; // Convert 12 AM to 0 hours
    }

    // Add 24 hours if time falls between 12:00 AM and 2:00 AM
    if (hours >= 0 && hours < 2) {
        hours += 24;
    }

    // Calculate total minutes
    var totalMinutes = hours * 60 + minutes;
    return totalMinutes;
}


function convertTo24Hours(time12) {
    var [hours, minutes, ampm] = time12.split(/:| /);
    hours = parseInt(hours) % 12;
    if (ampm.toLowerCase() === 'pm') {
        hours += 12;
    }
    return `${hours.toString().padStart(2, '0')}:${minutes.padStart(2, '0')}`;
}

function addTimes(time12, time24) {
    // Convert time1 from 12-hour format to 24-hour format
    var time1 = convertTo24Hours(time12);

    // Parse time strings into hours, minutes, and seconds
    var [hours1, minutes1] = time1.split(':').map(Number);
    var [hours2, minutes2, seconds2] = time24.split(':').map(Number);

    // Add the hours, minutes, and seconds
    var totalSeconds = seconds2;
    var totalMinutes = minutes1 + minutes2 + Math.floor(totalSeconds / 60);
    var totalHours = hours1 + hours2 + Math.floor(totalMinutes / 60);

    // Calculate the remainder after adding minutes and seconds
    totalSeconds %= 60;
    totalMinutes %= 60;

    // Format the result into a string
    var result = `${totalHours.toString().padStart(2, '0')}:${totalMinutes.toString().padStart(2, '0')}:${totalSeconds.toString().padStart(2, '0')}`;

    return result;
}

function convertTo12Hours(time24) {
    var [hours, minutes, seconds] = time24.split(':').map(Number);

    // Determine AM or PM
    var ampm = hours >= 12 ? 'PM' : 'AM';

    // Convert hours to 12-hour format
    hours = hours % 12 || 12;

    // Format the result into a string
    var result = `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')} ${ampm}`;

    return result;
}
