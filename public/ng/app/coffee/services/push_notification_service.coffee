'use strict'

@PushNotificationService = @serviceModule.factory 'PushNotificationService', ($http) ->

  registerPush: (fn) ->
    pushNotification = window.plugins.pushNotification
    successHandler = (result) ->
      console.log "result = " + result

    errorHandler = (error) ->
      console.log "error = " + error

    tokenHandler = (result) ->
      fn
        type: "registration"
        id: result
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


@PushNotificationService.$inject = [ '$http' ]
