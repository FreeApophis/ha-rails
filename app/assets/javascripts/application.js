// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require moment
//= require_tree .


var intervalStarted = false;

function update() {
  var now = new moment(); 
  $("#date").text(now.format("D. MMM. YY"));
  $("#time").text(now.format("H:mm:ss"));
}  

function refresh_page() {
  console.log("refresh page start")
  Turbolinks.visit(location.toString());
  console.log("refresh page end")
}  

$( document ).on('turbolinks:load', function() {
  $(function() {
    update();
    if(intervalStarted == false) {
      intervalStarted = true;
      setInterval(update, 1000);
    }
  });
})
