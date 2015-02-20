(function() {
  'use strict';
  this.ChecklistGridCtrl = this.controllerModule.controller("ChecklistGridCtrl", function($scope, $state, $ionicScrollDelegate) {
    $scope.resizeIfOther = function() {
      if (this.choice.textfield) {
        $ionicScrollDelegate.resize();
        return $ionicScrollDelegate.scrollBottom();
      }
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

  this.ChecklistGridCtrl.$inject = ['$scope', '$state', '$ionicScrollDelegate'];

}).call(this);
