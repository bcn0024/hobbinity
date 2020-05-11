$(function () {
  
  $('.footer__user').on('mouseover',function(){
    $('.user-popup').show();
    $.cookie('userFlg') == 'on'?$(".user-popup").hide():$(".user-popup").show();
  });
  $('#user-close').on('click',function(){
    $('.user-popup').fadeOut();
    $.cookie('userFlg', 'on', { expires: 1.0/(24*60*10),path: '/' });
  });
  // expires: 1.0/(24*60*10)or1/2

$('.footer__groups').on('mouseover',function(){
  $('.group-popup').show();
  $.cookie('groupFlg') == 'on'?$(".group-popup").hide():$(".group-popup").show();
});
$('#group-close').on('click',function(){
  $('.group-popup').fadeOut();
  $.cookie('groupFlg', 'on', { expires: 1/2,path: '/' });
});


$('.footer__edit').on('mouseover',function(){
  $('.edit-popup').show();
  $.cookie('editFlg') == 'on'?$(".edit-popup").hide():$(".edit-popup").show();
});
$('#edit-close').on('click',function(){
  $('.edit-popup').fadeOut();
  $.cookie('editFlg', 'on', { expires: 1/2,path: '/' });
});



$('.join-group').on('mouseover',function(){
  $('.join-popup').show();
  $.cookie('joinFlg') == 'on'?$(".join-popup").hide():$(".join-popup").show();
});
$('#join-close').on('click',function(){
  $('.join-popup').fadeOut();
  $.cookie('joinFlg', 'on', { expires: 1/2,path: '/' });
});


})

