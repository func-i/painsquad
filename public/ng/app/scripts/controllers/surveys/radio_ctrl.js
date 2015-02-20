(function() {
  'use strict';
  this.RadioCtrl = this.controllerModule.controller("RadioCtrl", function($scope, $state) {
    $scope.deselectOther = function(selectedChoice) {
      var choice, i, len, ref, results;
      ref = $scope.question.choices;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        choice = ref[i];
        if (choice !== selectedChoice) {
          results.push(choice.selected = false);
        } else {
          results.push(void 0);
        }
      }
      return results;
    };
    return $scope.preventDeselect = function(selectedChoice) {
      if (selectedChoice.selected) {
        return true;
      }
    };
  });

  this.RadioCtrl.$inject = ['$scope', '$state'];

}).call(this);
