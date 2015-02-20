(function() {
  'use strict';
  this.ChecklistCtrl = this.controllerModule.controller("ChecklistCtrl", function($scope, $state, $ionicScrollDelegate) {
    $scope.disableIfNone = function() {
      if (this.choice.can_disable) {
        return $scope.disableAllChoices();
      } else if (this.choice.textfield) {
        $ionicScrollDelegate.resize();
        return $ionicScrollDelegate.scrollBottom();
      }
    };
    $scope.disableAllChoices = function() {
      var choice, i, len, ref, results;
      ref = $scope.question.choices;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        choice = ref[i];
        if (!choice.can_disable) {
          choice.selected = false;
          results.push(choice.disabled = !choice.disabled);
        } else {
          results.push(void 0);
        }
      }
      return results;
    };
    return $scope.atLeastOne = function() {
      var choice, i, inverse, len, ref;
      inverse = null;
      ref = $scope.question.choices;
      for (i = 0, len = ref.length; i < len; i++) {
        choice = ref[i];
        if (choice.textfield) {
          if (choice.selected && choice.custom_text && choice.custom_text.length >= 1) {
            inverse = true;
          }
        } else if (choice.selected) {
          inverse = true;
        }
      }
      return !inverse;
    };
  });

  this.ChecklistCtrl.$inject = ['$scope', '$state', '$ionicScrollDelegate'];

}).call(this);
