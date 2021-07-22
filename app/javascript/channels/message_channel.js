import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>
    <strong>${data.user_id}</strong>
    ${data.content.cat}
  </p>`;
    const messages = document.getElementById('comments')
    const newMessage = document.getElementById('message_cat');
    const submit = document.getElementById('kokota');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
    submit.disabled=false
  }

  
});

