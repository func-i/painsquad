(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, AuthService, UserService, NotificationService) {
    var debugNotifications, setDefaultNotification;
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.logout = function() {
      return AuthService.logout();
    };
    debugNotifications = function() {
      return console.log('getDefaults', NotificationService.getDefaults());
    };
    setDefaultNotification = function() {
      var time;
      time = new Date();
      time.setSeconds(time.getSeconds() + 30);
      return NotificationService.add({
        id: 1,
        title: "PainSquad",
        message: "Time for a pain case!",
        repeat: "minutely",
        date: time
      }, $scope);
    };
    return setDefaultNotification();
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'AuthService', 'UserService'];

}).call(this);
