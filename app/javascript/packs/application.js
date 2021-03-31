// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


global.toastr = require("toastr")
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import 'bootstrap/dist/js/bootstrap'
import 'bootstrap/dist/css/bootstrap'


document.addEventListener("turbolinks:load", function() {
    $(function () {
      toastr.error('I do not think that word means what you think it means.', 'Inconceivable!')
        $('[data-toggle="tooltip"]').tooltip();
        $('[data-toggle="popover"]').popover();
        $('[data-toggle="collapse"]').collapse();
    })
})