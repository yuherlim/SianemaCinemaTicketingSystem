$(document).ready(function () {
    function openModal() {
        $('#modalCustInq').modal('show');
        console.log(txtCustInqID.val());
    }

    // Bind the openModal function to the page load event
    $(document).on('openModal', function () {
        openModal();
    });

});


//Search html element 
const inputField = $('.modalInputField');
const modalHeader = $('#modalTitle');
const viewButton = $('.btnViewCustInq');
const confirmButton = $('#btnConfirm');
const txtCustInqID = $('#custInqID');

//Function for open modal
function openModal() {
    $('#modalCustInq').modal('toggle');
}

function viewCustInq() {



    // Open the modal
    openModal();
}


//Set onClick listener for view button 
viewButton.click(viewCustInq);

function initializeEventListeners() {
    // Get all "View" buttons
    const viewButtons = document.getElementsByClassName('btnViewCustInq');

    // Add click event listeners to each "View" button
    for (let i = 0; i < viewButtons.length; i++) {
        viewButtons[i].addEventListener('click', onViewButtonClick);
    }

}

// Initialize event listeners when the DOM is ready
document.addEventListener('DOMContentLoaded', initializeEventListeners);

// Function to handle the "View" button click
function onViewButtonClick(event) {
    // Prevent the default form submission (if any)
    event.preventDefault();

    // Get the clicked button
    const button = event.currentTarget;

    // Get the row containing the button
    const row = button.closest('tr');

    // Access the hallID cell (assuming it's the first column, index 0)
    const custInqIDCell = row.cells[0]; // Assuming the 'custInqID' column is the first column

    // Get the hallID value
    const custInqID = custInqIDCell.textContent || custInqIDCell.innerText;
    console.log('CustInqID', custInqID);
    // Fetch data from the server based on the hallID
    fetchCustInqData(custInqID);
  
}

function fetchCustInqData(custInqID) {
    // Make an AJAX request to fetch data from the server based on the custInqID
    fetch('CustomerInquire.aspx/GetCustInqData', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ custInqID: custInqID })
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
            updateModalBody(parsedData);
            // Open the modal
            openModal();
        })
        .catch(error => {
            console.error('Fetch error:', error);
        });
}



// Function to update the modal body with the fetched data
function updateModalBody(data) {
    console.log('updateModalBody:', data);
    if (data) {
        // DISPLAY DATA BASED ON WHICH ROW YOU CLICK
        const custInqIDElement = document.getElementById('custInqID');
        const custInqIDFieldElement = document.getElementById('custInqIDField');
        const contactNameElement = document.getElementById('contactName');
        const contactNumElement = document.getElementById('contactNum');
        const emailElement = document.getElementById('email');
        const occurDateElement = document.getElementById('occurDate');
        const categoryElement = document.getElementById('category');
        const descElement = document.getElementById('desc');
        const upFileElement = document.getElementById('upFile'); // Get upFile element

        // Update elements with data
        if (custInqIDElement && data.custInqID !== undefined) {
            custInqIDElement.innerText = data.custInqID;
            custInqIDFieldElement.value = data.custInqID;
        }
    
        if (contactNameElement && data.contactName !== undefined) {
            contactNameElement.innerText = data.contactName;
        }
        if (contactNumElement && data.contactNum !== undefined) {
            contactNumElement.innerText = data.contactNum;
        }
        if (emailElement && data.email !== undefined) {
            // Set the href attribute to a "mailto" link for opening the email client
            emailElement.href = `mailto:${data.email}`;
            emailElement.textContent = data.email; // Display the email text
        }
        if (occurDateElement && data.occurDate !== undefined) {
            occurDateElement.innerText = data.occurDate;
        }
        if (categoryElement && data.category !== undefined) {
            categoryElement.innerText = data.category;
        }
        if (descElement && data.desc !== undefined) {
            descElement.innerText = data.desc;
        }
        // Update upFileElement with upFile data if provided
        if (upFileElement && data.upFile !== undefined && data.upFile !== "") {
            // Set the image source and make the image element visible
            upFileElement.src = data.upFile;
            upFileElement.style.display = "block";
        } else {
            // Hide the image element if there is no image URL provided
            upFileElement.style.display = "none";
        }
        // Set the appropriate status radio button
        if (data.status === "Pending") {
            document.getElementById('statusPending').checked = true;
        } else if (data.status === "Completed") {
            document.getElementById('statusCompleted').checked = true;
        }


    } else {
        console.warn('No data provided to update modal body');
    }
}


