$(document).ready(function () {
    function openModal() {
        $('#modalHall').modal('show');
    }

    // Bind the openModal function to the page load event
    $(document).on('openModal', function () {
        openModal();
    });

    displayHallImage();

});



// Function to update the number of seats based on selected hall type
function displayNumberOfSeats() {
    // Get the selected hall type from the radio buttons
    var hallType = document.querySelector('input[name="hallType"]:checked').value;
    // Get the TextBox element for number of seats
    var numberOfSeatsTextBox = document.getElementById("numberOfSeats");

    // Update the value of the TextBox based on the selected hall type
    if (hallType === "Large") {
        numberOfSeatsTextBox.value = "190";  // Set to 190 for Large hall
    } else if (hallType === "Small") {
        numberOfSeatsTextBox.value = "103";  // Set to 103 for Small hall
    }
}

// Function to update the hall image based on selected hall type
function displayHallImage() {
    // Get the selected hall type from the radio buttons
    var hallType = document.querySelector('input[name="hallType"]:checked').value;
    // Get the Image element
    var imgElement = document.getElementById("hallImage");

    // Update the image source based on the selected hall type
    if (hallType === "Large") {
        imgElement.src = "large.png";
    } else if (hallType === "Small") {
        imgElement.src = "small.png";
    }
}

// Initial display of hall image and number of seats when the page loads
document.addEventListener('DOMContentLoaded', function () {
    displayHallImage();
    displayNumberOfSeats();
});

// Attach event listeners to the radio buttons
var radioButtons = document.querySelectorAll('input[name="hallType"]');
radioButtons.forEach(function (radioButton) {
    radioButton.addEventListener('change', function () {
        displayHallImage();
        displayNumberOfSeats();
    });
});


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

// Function to handle the "View" button click
function onViewButtonClick(event) {
    // Prevent the default form submission (if any)
    event.preventDefault();

    // Get the clicked button
    const button = event.currentTarget;

    // Get the row containing the button
    const row = button.closest('tr');

    // Access the hallID cell (assuming it's the first column, index 0)
    const hallIDCell = row.cells[1]; // Assuming the 'hallID' column is the first column

    // Get the hallID value
    const hallID = hallIDCell.textContent || hallIDCell.innerText;
    console.log('HallID', hallID);
    // Fetch data from the server based on the hallID
    fetchHallData(hallID);
}

// Function to fetch data from the server and update the modal
function fetchHallData(hallID) {
    // Make an AJAX request to fetch data from the server based on the hallID
    fetch('Hall.aspx/GetHallData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ hallID: hallID })
    })
        .then(response => {
            // Check if the response status is not successful
            if (!response.ok) {
                throw new Error(`HTTP error ${response.status}: ${response.statusText}`);
            }
            return response.json(); // Parse the JSON response
        })
        .then(data => {
            // Update the modal body with the data
            console.log('DATA->', data);
            const parsedData = JSON.parse(data.d);
            updateModalBody(parsedData);

            // Open the modal
            openModal();
        })
        .catch(error => {

        });
}


// Function to update the modal body with the fetched data
function updateModalBody(data) {
    // Assuming data contains hall details such as hallName, hallType, and numberOfSeats
    console.log('updateModalBody : ', data);
    //DISPLAY DATA BASED ON WHICH ROW YOU CLICK
    if (data) {
        // DISPLAY DATA BASED ON WHICH ROW YOU CLICK
        const modalId = document.getElementById('modalId');
        const hallName = document.getElementById('hallName');
        const numberOfSeats = document.getElementById('numberOfSeats');

        if (modalId && data.hallID !== undefined) {
            modalId.value = data.hallID;
        }
        if (hallName && data.hallName !== undefined) {
            hallName.value = data.hallName;
        }
        if (numberOfSeats && data.numberOfSeats !== undefined) {
            numberOfSeats.value = data.numberOfSeats;
        }

        // Update radio buttons based on hallType
        const hallType1 = document.getElementById('hallType1');
        const hallType2 = document.getElementById('hallType2');
        var imgElement = document.getElementById("hallImage");
        if (hallType1 && hallType2) {
            if (data.hallType === 'Large') {
                imgElement.src = "large.png";
                hallType1.checked = true;
                hallType2.checked = false;

            } else {
                imgElement.src = "small.png";
                hallType1.checked = false;
                hallType2.checked = true;

            }
        }
    } else {
        console.warn('No data provided to update modal body');
    }
}

// Function to initialize event listeners
function initializeEventListeners() {
    // Get all "View" buttons
    const viewButtons = document.getElementsByClassName('btnViewHall');

    // Add click event listeners to each "View" button
    for (let i = 0; i < viewButtons.length; i++) {
        viewButtons[i].addEventListener('click', onViewButtonClick);
    }

    // Get all "Remove" buttons
    const removeButtons = document.getElementsByClassName('btnRemoveHall');
    // Add click event listeners to each "Remove" button
    for (let i = 0; i < removeButtons.length; i++) {
        removeButtons[i].addEventListener('click', onRemoveButtonClick);
    }
}



//Set onClick listener for view button 
viewButton.click(viewHall);

//remove
// Function to handle the "Remove" button click
function onRemoveButtonClick(event) {
    // Prevent the default form submission (if any)
    event.preventDefault();

    // Get the clicked button
    const button = event.currentTarget;

    // Get the row containing the button
    const row = button.closest('tr');

    // Log the entire row for debugging
    console.log('Row:', row);

    // Access the hallID cell (adjust the index if needed)
    const hallIDCell = row.cells[1]; // Assuming the 'hallID' column is in the second cell

    // Log the cell and its content for debugging
    console.log('hallIDCell:', hallIDCell);
    console.log('HallID cell content (textContent):', hallIDCell.textContent);
    console.log('HallID cell content (innerText):', hallIDCell.innerText);

    // Get the hallID value
    const hallID = hallIDCell.textContent || hallIDCell.innerText;
    console.log('Removing HallID:', hallID);

    // Perform the remove operation
    removeHallData(hallID);
}



// Function to perform the remove operation
function removeHallData(hallID) {
    // Make an AJAX request to remove data from the server based on the hallID
    fetch('Hall.aspx/RemoveHallData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ hallID: hallID })
    })
        .then(response => {
            // Check if the response status is not successful
            if (!response.ok) {
                throw new Error(`HTTP error ${response.status}: ${response.statusText}`);
            }
            // Refresh the page or the GridView
            location.reload();
        })
        .catch(error => {
            console.error('Error removing hall data:', error);
            alert('Error removing hall data');
        });
}

// Initialize event listeners when the DOM is ready
document.addEventListener('DOMContentLoaded', initializeEventListeners);
