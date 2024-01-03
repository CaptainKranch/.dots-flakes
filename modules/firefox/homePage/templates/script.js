// script.js
document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search-input');
    const searchButton = document.getElementById('search-button');

    searchButton.addEventListener('click', function () {
        const value = searchInput.value;
        if (value) {
            // Perform the Google search
            window.location.href = `https://www.google.com/search?q=${encodeURIComponent(value)}`;
        }
    });
});

