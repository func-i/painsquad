(function() {
  'use strict';
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, settings, moment, AuthService, UserService, SettingResource) {
    var init, saveSelection;
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.morningAlerts = settings.morning_alerts;
    $scope.eveningAlerts = settings.evening_alerts;
    $scope.selectedMorningAlert = {};
    $scope.selectedEveningAlert = {};
    $scope.handleSelection = function(alert, alertArray) {
      var date, index, _i, _len;
      for (index = _i = 0, _len = alertArray.length; _i < _len; index = ++_i) {
        date = alertArray[index];
        if (date.selected) {
          date.selected = !date.selected;
        }
        if (alert === date) {
          date.selected = !date.selected;
          alert = alertArray[index];
        }
      }
      return saveSelection(alert);
    };
    saveSelection = function(alert) {
      return SettingResource.update(alert);
    };
    init = function() {
      var date, index, _i, _j, _len, _len1, _ref, _ref1, _results;
      _ref = $scope.morningAlerts;
      for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
        date = _ref[index];
        if (date.selected) {
          $scope.selectedMorningAlert = $scope.morningAlerts[index];
        }
      }
      _ref1 = $scope.eveningAlerts;
      _results = [];
      for (index = _j = 0, _len1 = _ref1.length; _j < _len1; index = ++_j) {
        date = _ref1[index];
        if (date.selected) {
          _results.push($scope.selectedEveningAlert = $scope.eveningAlerts[index]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };
    $scope.logout = function() {
      return AuthService.logout();
    };
    return init();
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'settings', 'moment', 'AuthService', 'UserService'];

}).call(this);
