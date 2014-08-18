(function() {
  'use strict';
  this.PushNotificationService = this.serviceModule.factory('PushNotificationService', function($http) {
    return {
      registerPush: function(fn) {
        var errorHandler, pushNotification, successHandler, tokenHandler;
        pushNotification = window.plugins.pushNotification;
        successHandler = function(result) {
          return console.log("result = " + result);
        };
        errorHandler = function(error) {
          return console.log("error = " + error);
        };
        tokenHandler = function(result) {
          return fn({
            type: "registration",
            id: result,
            device: "ios"
          });
        };
        if (device.platform === "android" || device.platform === "Android") {
          return pushNotification.register(successHandler, errorHandler, {
            senderID: "replace_with_sender_id",
            ecb: "onNotificationGCM"
          });
        } else {
          return pushNotification.register(tokenHandler, errorHandler, {
            badge: "true",
            sound: "true",
            alert: "true",
            ecb: "onNotificationAPN"
          });
        }
      }
    };
  });

  this.PushNotificationService.$inject = ['$http'];

}).call(this);
