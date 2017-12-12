App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {},
  // Called when the subscription is ready for use on the server
  disconnected: function() {},
  // Called when the subscription has been terminated by the server
  received: function(data) {
    var active_chatroom;
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='${data.chatroom_id}']");
    if (active_chatroom.length > 0) {
      if (document.hidden) {
        if ($(".strike").length === 0) {
          active_chatroom.append("<div class='strike'><span>Unread Messages</span></div>");
        }
        if (Notification.permission === "granted") {
          new Notification(data.username, {
            body: data.body
          });
        }
      } else {
        App.last_read.update(data.chatroom_id);
      }
      // Insert the message
      return active_chatroom.append("<div><strong>${data.username}:</strong> ${data.body}</div>");
    } else {
      return $("[data-behavior='chatroom-link'][data-chatroom-id='${data.chatroom_id}']").css("font-weight", "bold","red");
    }
  },
  send_message: function(chatroom_id, message) {
    return this.perform("send_message", {
      chatroom_id: chatroom_id,
      body: message
    });
  }
});
