"use strict"

###
AngularJS PhoneGap Push Notifications Service
=============================================

Copyright 2013 Anim Yeboah
https://github.com/anim/angular-phonegap-push/

Allows using the [PushPlugin](https://github.com/bobeast/PushPlugin) in
[PhoneGap](http://phonegap.com/) apps built with AngularJS.

Provides a service for registering the device for push notifications and
getting callbacks when notifications are received.

Example
-------

Register device:

```javascript
new pgPushNotificationsFactory(
'0123456789', // GCM Sender ID
function registeredCallback (deviceToken, platform) {
// Send `deviceToken` to your push server here
// `platform` is either 'APNS' (iOS) or 'GCM' (Android)
},
function pushNotificationCallback (data, platform) {
// Push message received
}
);
```

Listen for push notifications:

```javascript
$scope.$on('phonegapPush.notification', function (notification) {
// Notification received:
// `notification.data` raw notification data/payload
// `notification.provider` either 'APNS' or 'GCM'
});
```
###
# angular.module("phonegapPush", []).factory "pgPushNotificationsFactory", ($rootScope, $log) ->
@PushNotificationService = @serviceModule.factory "PushNotificationService", ($rootScope, $log) ->

  pushNotificationsFactory = (gcmSenderId, registeredCallback) ->
    pushNotification = undefined

    # Setup and register device

    # Check if phonegap and plugins are loaded
    if typeof (window.plugins) is "undefined"
      $log.error "PhoneGap plugins not found. Push notifications not initialized."
      return false

    # Initialize push notifications
    pushNotification = window.plugins.pushNotification
    if typeof (pushNotification) is "undefined"
      $log.error "Push plugin not found. Push notifications not initialized."
      return false
    gcmSuccessHandler = (result) ->
      $log.info "Successfully registered with GCM push server. " + "Waiting for device registration ID via notification. " + "Registration result:", result

    apnsSuccessHandler = (deviceToken) ->
      $log.info("Successfully registered with APNS push server. Device token: " + deviceToken)
      $rootScope.deviceToken = deviceToken
      registeredCallback deviceToken, "APNS"

    genericErrorHandler = (error) ->
      $log.info("Error registering with push server: " + error)

    # Register device with push server
    if device.platform is "Android"
      pushNotification.register gcmSuccessHandler, genericErrorHandler,
        senderID: gcmSenderId
        ecb: "onNotificationGCM"

    else if device.platform is "iOS"
      pushNotification.register apnsSuccessHandler, genericErrorHandler,
        badge: "true"
        sound: "true"
        alert: "true"
        ecb: "onNotificationAPN"


    # Bind notification functions to window (called by phonegapPush plugin)

    # iOS notification received
    window.onNotificationAPN = (notification) ->
      $log.info "APNS push notification received:", notification
      $rootScope.$broadcast "phonegapPush.notification",
        data: notification
        provider: "APNS"

    # Android notification received
    window.onNotificationGCM = (notification) ->
      switch notification.event
        when "registered"
          if notification.regid.length > 0
            $log.info "Got GCM device registration ID:", notification.regid
            registeredCallback notification.regid, "GCM"
          else
            $log.error "Error registering with GCM push server: No device registration ID received."
        when "message"
          $log.info "GCM push notification received (only payload forwarded):", notification
          $rootScope.$broadcast "phonegapPush.notification",
            data: notification.payload
            provider: "GCM"

        when "error"
          $log.error "Error while receiving GCM push notification:", notification
        else
          $log.error "Unknown GCM push notification received:", notification

    true

  pushNotificationsFactory

