$(function(){
  function buildHTML(message){
    img = message.image ? `<img class="lower-message__image" src="${message.image}" alt="Img">` : "";

    icon = message.icon ? `<img class="person-icon" src="${message.icon}" width="64" height="64">` : "";
    // function face(message) {
    //   if(message.icon == null){
    //     icon = `<img class="person-icon" src="${message.icon}" width="64" height="64">`;
    //   }else{
    //     none = `<i class="fa fa-user-circle person"></i>`;
    //   }
    // }

    // ${face}

    var html = `<div class="message-box">
                <div class="message-head">
                ${icon}
                <p class="message-talker">
                ${message.user_name}
                </p>
                <p class="message-date">
                ${message.date}
                </p>
                </div>
                <p class="message-text">
                </p><p class="message-content">
                ${message.content}
                </p>
                ${img}
                <p></p>
                </div>`
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .always(function(){
      $('.submit').prop('disabled', false);
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.message__upper-info').append(html)
      $('.message__upper-info').animate({ scrollTop: $('.message__upper-info')[0].scrollHeight});
      $('#new_message')[0].reset();
    })
    .fail(function(){
      alert('error');
    })
  })
})