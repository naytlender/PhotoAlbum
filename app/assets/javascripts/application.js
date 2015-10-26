// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  var $bar = $(".navbar-fixed-left");
  $(".btn-hide").click(function(){
    var width = $bar.css("left");
    if (width == "0px"){
      $bar.animate({"left" : "-219px"}, 500);
      $(".content").animate({"margin-left" : "25px", "height" : "100%"}, 600);
      $(".btn-hide > span").removeClass("glyphicon-menu-left");
      $(".btn-hide > span").addClass("glyphicon-menu-right");
      $(".btn-hide").css("background", "rgb(15,15,15)");
    } else {
      $bar.animate({"left" : "0px"}, 600);
      $(".content").animate({"margin-left" : "245px"}, 500);
      $(".btn-hide > span").removeClass("glyphicon-menu-right");
      $(".btn-hide > span").addClass("glyphicon-menu-left");
      $(".btn-hide").css("background", "rgb(0,0,0)");
    };
  });

  $(".index-image").click(function(){
    $('#myModal').modal('toggle');
    $('body').addClass('modal-open');
    $id = $(this).attr('id');
    $name = $(this).attr('data-name');
    console.log($id)
  });

  $(".logo").hover(function(){
      $(this).animate({'font-size' : '34px'}, 200);
      $(this).css('color', 'blue');
    },
    function(){
      $(this).animate({'font-size' : '26px'}, 300);
      $(this).css('color', 'rgb(200,200,200)');
    }
  );

  $('#myModal').on('shown.bs.modal', function (event) {
    var photo_id = 'photo' + $id
    var id = $id
    var p_name = $name // Current photo name
    var photo = document.getElementById(id);
    var modal = $(this)
    console.log("photo + 'id'= " + photo_id)
    console.log('id= ' + id)
    console.log(p_name)
    console.log(photo)
    modal.find('.modal-title').text('Name: ' + p_name)
    var image = $('<img />').attr({
      class: 'modal-image',
      id: id,
      src: '/photos/' + id + '/serve',
      alt: 'Serve'})
    modal.find('.modal-body').prepend(image);
  });

  $('#myModal').on('hide.bs.modal', function(){
    var modal = $(this)
    modal.find('.modal-body').empty();
  });

  $('#exampleModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget) // Button that triggered the modal
    var recipient = button.data('whatever') // Extract info from data-* attributes
    var modal = $(this)
    modal.find('.modal-title').text('New message to ' + recipient)
    modal.find('.modal-body input').val(recipient)
  });
});

