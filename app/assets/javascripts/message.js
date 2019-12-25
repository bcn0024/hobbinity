$(function(){
  function buildHTML(message){
    img = message.image ? `<img class="lower-message__image" src="${message.image}" alt="Img">` : "";
    var html = `<div class="message-box">
                <div class="message-head">
                <i class="fa fa-user-circle person"></i>
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
    .done(function(data){
      var html = buildHTML(data);
      $('.message__upper-info').append(html)
      $('#message_content').val('')
    })
    .fail(function(){
      alert('error');
    })
  })
})