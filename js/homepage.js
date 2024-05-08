$(document).ready(function () {
    // Initialize the carousel with the specified interval for auto-sliding
    $('#carouselExampleIndicators2').carousel({
        interval: 3000  // Auto-slide every 3 seconds
    });

    // Add click event listeners to previous and next buttons
    $('#prevBtn').click(function () {
        console.log = ("Prev Button clicked");
        $('#carouselExampleIndicators2').carousel('prev');
    });

    $('#nextBtn').click(function () {
        console.log = ("Next Button clicked");
        $('#carouselExampleIndicators2').carousel('next');
    });
});
