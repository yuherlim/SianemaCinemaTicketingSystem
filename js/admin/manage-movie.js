
const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const addButton = $('#btnAddMovie');
const viewButton = $('.btnViewMovie');
const editButton = $('.btnEditMovie');
const confirmButton = $('#btnConfirm');
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
const txtAreaSypnosis = $('#txtSynopsis');
const txtName = $('#txtName');
const movPosterImage = $('#movPosterImage');
const movCoverPhotoImage = $('#movCoverPhotoImage');
const fuPoster = $('#fuPoster');
const fuCoverPhoto = $('#fuCoverPhoto');

fuPoster.change(function () {
    let file = fuPoster[0].files[0];
    let fileReader = new FileReader();
    fileReader.onload = function (event) {
        let base64String = event.target.result.split(',')[1];    
        lblmovPosterImage.val(base64String);
        let movPosterDataUrl = 'data:image/jpeg;base64,' + base64String;
        movPosterImage.attr("src", movPosterDataUrl);
    };
    fileReader.readAsDataURL(file);
});

fuCoverPhoto.change(function () {
    let file = fuCoverPhoto[0].files[0];
    let fileReader = new FileReader();
    fileReader.onload = function (event) {
        let base64String = event.target.result.split(',')[1];
        lblmovCoverPhotoImage.val(base64String);
        let movCoverPhotoImageDataUrl = 'data:image/jpeg;base64,' + base64String;
        movCoverPhotoImage.attr("src", movCoverPhotoImageDataUrl);
    };
    fileReader.readAsDataURL(file);
});

txtAreaSypnosis.on("change", function () {
    lblmovieSynopsis.val(txtAreaSypnosis.val());
});

$('#sltGenre').select2({
    dropdownParent: $('#modalMovie')
}).on('change', function (e) {
    // Set the value of the hidden field to the selected date
    var selectedOption = $("#sltGenre option:selected");
    var data = selectedOption.map(function (index,option) {
        return $(option).text();
    }).get().join(', ');

    lblmovieGenre.val(data);
});


$('#sltClass').select2({
    dropdownParent: $('#modalMovie')
}).on('change', function (e) {
    // Set the value of the hidden field to the selected date
    var data = $("#sltClass option:selected").text();
    lblmovieClass.val(data);
});

$('#sltLanguage').select2({
    dropdownParent: $('#modalMovie')
}).on('change', function (e) {
    // Set the value of the hidden field to the selected date
    var selectedOption = $("#sltLanguage option:selected");
    var data = selectedOption.map(function (index, option) {
        return $(option).text();
    }).get().join(', ');

    lblmovieLanguage.val(data);
});

$('#sltSubtitle').select2({
    dropdownParent: $('#modalMovie')
}).on('change', function (e) {
    // Set the value of the hidden field to the selected date
    var selectedOption = $("#sltSubtitle option:selected");
    var data = selectedOption.map(function (index, option) {
        return $(option).text();
    }).get().join(', ');

    lblmovieSubtitle.val(data);
});

flatpickrDuration = $("#tpDuration").flatpickr({
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    time_24hr: true,
    minTime: "00:00",
    maxTime: "04:00",
    defaultDate: "01:30:00",
    onChange: function (selectedDates, dateStr, instance) {
        // Set the value of the hidden field to the selected date
        lblmovieDuration.val(dateStr);
    }
});

flatpickrReleaseDate = $("#tpReleaseDate").flatpickr({
    dateFormat: "d-m-Y",
    defaultDate: new Date(),
    onChange: function (selectedDates, dateStr, instance) {
        // Set the value of the hidden field to the selected date
        lblmovieReleaseDate.val(dateStr);
    }
});

$('#sltCast').select2({
    dropdownParent: $('#modalMovie'),
    tags: true
}).on('change', function (e) {
    // Set the value of the hidden field to the selected date
    var selectedOption = $("#sltCast option:selected");
    var data = selectedOption.map(function (index, option) {
        return $(option).text();
    }).get().join(', ');

    lblmovieCast.val(data);
});

flatpickrScreenFrom = $("#tpScreenFrom").flatpickr({
    dateFormat: "d-m-Y",
    defaultDate: new Date(),
    onChange: function (selectedDates, dateStr, instance) {
        // Set the value of the hidden field to the selected date
        lblmovieScreenFrom.val(dateStr);
    }
});

flatpickrScreenUntil = $("#tpScreenUntil").flatpickr({
    dateFormat: "d-m-Y",
    minDate: "today",
    defaultDate: new Date(),
    onChange: function (selectedDates, dateStr, instance) {
        // Set the value of the hidden field to the selected date
        lblmovieScreenUntil.val(dateStr);
    }
});

function openModal(caller) {
    $('#modalMovie').modal('toggle');
    if (caller != 'Add Movie') {
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

}

function editMovie() {
    modalHeader.text('Edit Movie');
    confirmButton.prop('hidden', false);
    inputField.prop('disabled', false);
    lblbtnConfirmMode.val("EditMovie");
    openModal("Edit Movie");
}

function addMovie() {
    modalHeader.text('Add Movie');
    confirmButton.prop('hidden', false);
    inputField.prop('disabled', false);
    clearlabel();
    lblmovieDuration.val(flatpickrDuration.formatDate(flatpickrDuration.selectedDates[0], "H:i"));
    lblmovieScreenFrom.val(flatpickrScreenFrom.formatDate(flatpickrScreenFrom.selectedDates[0], "Y-m-d"));
    lblmovieScreenUntil.val(flatpickrScreenUntil.formatDate(flatpickrScreenUntil.selectedDates[0], "Y-m-d"));
    lblmovieReleaseDate.val(flatpickrReleaseDate.formatDate(flatpickrReleaseDate.selectedDates[0], "Y-m-d"));
    lblmovieClass.val( $("#sltClass option:selected").text());
   
    lblbtnConfirmMode.val("AddMovie");
    openModal("Add Movie");
}

function viewMovie() {
    modalHeader.text('View Movie');
    confirmButton.prop('hidden', true);
    inputField.prop('disabled', true);
    openModal("View Movie");
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

function clearlabel() {
    txtName.val('');
    $('.label').text('');
    lblmovCoverPhotoImage.val("");
    lblmovPosterImage.val("");

}


