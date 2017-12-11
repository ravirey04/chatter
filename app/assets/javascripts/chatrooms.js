var handleVisiblityChange;

handleVisiblityChange = function() {
  var $strike, chatroom_id;
  $strike = $(".strike");
  if ($strike.length > 0) {
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id");
    App.last_read.update(chatroom_id);
    return $strike.remove();
  }
};

$(document).on("turbolinks:load", function() {
  $(document).on("click", handleVisiblityChange);
  $("#new_message").on("keypress", function(e) {
    if (e && e.keyCode === 13) {
      e.preventDefault();
      return $(this).submit();
    }
  });
  return $("#new_message").on("submit", function(e) {
    var body, chatroom_id;
    e.preventDefault();
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id");
    body = $("#message_body");
    App.chatrooms.send_message(chatroom_id, body.val());
    return body.val("");
  });
});


