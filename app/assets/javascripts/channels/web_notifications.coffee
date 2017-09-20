App.web_notifications = App.cable.subscriptions.create "WebNotificationsChannel",
  connected: ->
    console.log('connected!')

  disconnected: ->
    console.log('disconnected!')

  received: (data) ->
    console.log('received -> data=' + data)
    console.log('received -> trap_id=' + data['trap_id'])
    messages = document.getElementById('messages')
    if messages != null and window.location.pathname.replace('requests', '').replace(/\//g, '') == data['trap_id']
      newDiv = document.createElement 'div'
      newDiv.innerHTML = data['message']
      messages.insertBefore newDiv  , messages.children[0];
