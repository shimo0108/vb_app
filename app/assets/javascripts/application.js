// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= link_directory ../javascripts .js  
//= require_tree .

$(document).ready(function () {
  $('.contact').click(function (e) {
    $('.card').toggleClass('active');
    $('.banner').toggleClass('active');
    $('.photo').toggleClass('active');
    $('.social-media-banner').toggleClass('active');
    $('.email-form').toggleClass('active');
    var buttonText = $('button.contact#main-button').text();
    if (buttonText === 'back') {
      buttonText = 'click to get in touch';
      $('button.contact#main-button').text(buttonText);
    }
    else {
      buttonText = 'back';
      $('button.contact#main-button').text(buttonText);
    }
  });
});
//turn on to make the photo follow mouse
// $(document).ready(function()
// {
//     $(document).mousemove(function( event ) 
//     {
//         var docWidth = $(document).width();
//         var docHeight = $(document).height();
//         var xValue = (event.clientX/docWidth)*100;
//         var yValue = (event.clientY/docHeight)*100;
//         $('.photo').css('background-position', xValue+'%,'+yValue+'%');
//     });
// });

Resources