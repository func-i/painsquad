'use strict'

@PushNotificationService = @serviceModule.factory "PushNotificationService", () ->
  onNotificationAPN = (e) ->
    if e.alert
      console.log "push-notification: " + e.alert
      navigator.notification.alert e.alert
    if e.sound
      snd = new Media(e.sound)
      snd.play()
    pushNotification.setApplicationIconBadgeNumber successHandler, e.badge  if e.badge

  registerPush: (fn) ->
    pushNotification = window.plugins.pushNotification
    successHandler = (result) ->
      console.log "result = " + result

    errorHandler = (error) ->
      console.log "error = " + error

    tokenHandler = (result) ->
      fn
        type:   "registration"
        id:     result
        device: "ios"

    if device.platform is "android" or device.platform is "Android"
      pushNotification.register successHandler, errorHandler,
        senderID: "replace_with_sender_id"
        ecb:      "onNotificationGCM"
    else
      pushNotification.register tokenHandler, errorHandler,
        badge: "true"
        sound: "true"
        alert: "true"
        ecb:   "onNotificationAPN"

  # PushNotificationService

@PushNotificationService.$inject = [ ]
