// to show the current page at the nav bar
$(document).ready(function () {
    // Get the current page URL
    var currentPageUrl = window.location.pathname.toLowerCase();
    console.log("Current Page URL:", currentPageUrl);

    // Loop through each navigation link
    $(".navbar-nav .nav-link").each(function () {
        // Get the href attribute of the link and convert it to lowercase
        var linkUrl = $(this).attr("href").toLowerCase();
        console.log("Link URL:", linkUrl);

        // Check if the link URL is contained within the current page URL
        if (currentPageUrl.indexOf(linkUrl) !== -1) {
            // the 'active-link' class to the current link
            $(this).addClass("active-link");
            return false; // Exit the loop once the match is found
        }
    });
});