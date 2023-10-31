# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "el-transition",
    to: "https://ga.jspm.io/npm:el-transition@0.0.7/index.js",
    preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "ultimate_turbo_modal",
    to: "/ultimate_turbo_modal.min.js",
    preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
