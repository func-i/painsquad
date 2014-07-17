(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, settings, moment, AuthService, UserService) {
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.morningAlert = settings.morning_alert;
    $scope.eveningAlert = settings.evening_alert;
    $scope.defaultMorningAlerts = ['8:00am', '8:30am', '9:00am', '9:30am', '10:00am', '10:30am', '11:00am'];
    $scope.defaultEveningAlerts = ['6:00pm', '6:30pm', '7:00pm', '7:30pm', '8:00pm', '8:30pm', '9:00pm'];
    $scope.logout = function() {
      return AuthService.logout();
    };
    return $scope.displayTime = function(time) {
      return moment(time).format('LT');
    };
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'settings', 'moment', 'AuthService', 'UserService'];

}).call(this);
