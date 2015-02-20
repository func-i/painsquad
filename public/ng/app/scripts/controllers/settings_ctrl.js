(function() {
  this.SettingsCtrl = this.controllerModule.controller('SettingsCtrl', function($rootScope, $scope, settings, moment, UserService, SettingResource) {
    var init, saveSelection;
    $scope.currentUser = UserService.currentUser();
    $scope.isLoggedIn = UserService.isLoggedIn();
    $scope.morningAlerts = settings.morning_alerts;
    $scope.eveningAlerts = settings.evening_alerts;
    $scope.selectedMorningAlert = {};
    $scope.selectedEveningAlert = {};
    $scope.handleSelection = function(alert, alertArray) {
      var date, i, index, len;
      for (index = i = 0, len = alertArray.length; i < len; index = ++i) {
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
      var date, i, index, j, len, len1, ref, ref1, results;
      ref = $scope.morningAlerts;
      for (index = i = 0, len = ref.length; i < len; index = ++i) {
        date = ref[index];
        if (date.selected) {
          $scope.selectedMorningAlert = $scope.morningAlerts[index];
        }
      }
      ref1 = $scope.eveningAlerts;
      results = [];
      for (index = j = 0, len1 = ref1.length; j < len1; index = ++j) {
        date = ref1[index];
        if (date.selected) {
          results.push($scope.selectedEveningAlert = $scope.eveningAlerts[index]);
        } else {
          results.push(void 0);
        }
      }
      return results;
    };
    return init();
  });

  this.SettingsCtrl.$inject = ['$rootScope', '$scope', 'settings', 'moment', 'UserService'];

}).call(this);
