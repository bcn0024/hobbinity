$(function () {
  
  $('.footer__user').on('mouseover',function(){
    $.cookie('userFlg') == 'on'?$(".user-popup").hide():$(".user-popup").fadeIn();
  });
  $('#user-close').on('click',function(){
    $('.user-popup').fadeOut();
    $.cookie('userFlg', 'on', { expires: 1,path: '/' });
  });
// expires: 1.0/(24*60*10)

$('.footer__groups').on('mouseover',function(){
  $.cookie('groupFlg') == 'on'?$(".group-popup").hide():$(".group-popup").fadeIn();
});
$('#group-close').on('click',function(){
  $('.group-popup').fadeOut();
  $.cookie('groupFlg', 'on', { expires: 1,path: '/' });
});


$('.footer__edit').on('mouseover',function(){
  $.cookie('editFlg') == 'on'?$(".edit-popup").hide():$(".edit-popup").fadeIn();
});

$('#edit-close').on('click',function(){
  $('.edit-popup').fadeOut();
  $.cookie('editFlg', 'on', { expires: 1,path: '/' });
});

})


// =link_to user_path(current_user.id), class:'footer__user' do
//     = fa_icon'user-circle', class:'footer__user__icon'
//   = link_to categories_path, class:'footer__groups' do
//     = fa_icon'users', class:'footer__groups__icon'
//   = link_to root_path, class:'footer__edit' do
//     = fa_icon'cogs', class:'footer__edit__icon'
// mouseover