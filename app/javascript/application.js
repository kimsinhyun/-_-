// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "@rails/actioncable"
import "controllers"
import "@fortawesome/fontawesome-free"
// import "@fortawesome/fontawesome-free/js/all";

import Alpine from "alpinejs"
window.Alpine = Alpine

document.addEventListener("DOMContentLoaded", function(event) {
    window.Alpine.start();
});