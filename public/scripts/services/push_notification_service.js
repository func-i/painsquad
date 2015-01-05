(function() {
  "use strict";

  /*
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
   */
  this.PushNotificationService = this.serviceModule.factory("PushNotificationService", function($rootScope, $log) {
    var pushNotificationsFactory;
    pushNotificationsFactory = function(gcmSenderId, registeredCallback) {
      var apnsSuccessHandler, gcmSuccessHandler, genericErrorHandler, pushNotification;
      pushNotification = void 0;
      if (typeof window.plugins === "undefined") {
        $log.error("PhoneGap plugins not found. Push notifications not initialized.");
        return false;
      }
      pushNotification = window.plugins.pushNotification;
      if (typeof pushNotification === "undefined") {
        $log.error("Push plugin not found. Push notifications not initialized.");
        return false;
      }
      gcmSuccessHandler = function(result) {
        return $log.info("Successfully registered with GCM push server. " + "Waiting for device registration ID via notification. " + "Registration result:", result);
      };
      apnsSuccessHandler = function(deviceToken) {
        $log.info("Successfully registered with APNS push server. Device token: " + deviceToken);
        $rootScope.deviceToken = deviceToken;
        return registeredCallback(deviceToken, "APNS");
      };
      genericErrorHandler = function(error) {
        return $log.info("Error registering with push server: " + error);
      };
      if (device.platform === "Android") {
        pushNotification.register(gcmSuccessHandler, genericErrorHandler, {
          senderID: gcmSenderId,
          ecb: "onNotificationGCM"
        });
      } else if (device.platform === "iOS") {
        pushNotification.register(apnsSuccessHandler, genericErrorHandler, {
          badge: "true",
          sound: "true",
          alert: "true",
          ecb: "onNotificationAPN"
        });
      }
      window.onNotificationAPN = function(notification) {
        $log.info("APNS push notification received:", notification);
        return $rootScope.$broadcast("phonegapPush.notification", {
          data: notification,
          provider: "APNS"
        });
      };
      window.onNotificationGCM = function(notification) {
        switch (notification.event) {
          case "registered":
            if (notification.regid.length > 0) {
              $log.info("Got GCM device registration ID:", notification.regid);
              return registeredCallback(notification.regid, "GCM");
            } else {
              return $log.error("Error registering with GCM push server: No device registration ID received.");
            }
            break;
          case "message":
            $log.info("GCM push notification received (only payload forwarded):", notification);
            return $rootScope.$broadcast("phonegapPush.notification", {
              data: notification.payload,
              provider: "GCM"
            });
          case "error":
            return $log.error("Error while receiving GCM push notification:", notification);
          default:
            return $log.error("Unknown GCM push notification received:", notification);
        }
      };
      return true;
    };
    return pushNotificationsFactory;
  });

}).call(this);
