# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@fortawesome/fontawesome-free", to: "@fortawesome--fontawesome-free.js" # @6.6.0

pin "@rails/actioncable", to: "@rails--actioncable.js" # @7.2.100
pin_all_from "app/javascript/channels", under: "channels"

# pin "flowbite", to: "https://cdn.jsdelivr.net/npm/flowbite@2.5.1/dist/flowbite.turbo.min.js"
pin "alpinejs" # @3.14.1
