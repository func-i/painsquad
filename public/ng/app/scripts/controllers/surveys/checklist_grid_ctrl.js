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
      var choice, inverse, _i, _len, _ref;
      inverse = null;
      _ref = $scope.question.choices;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        choice = _ref[_i];
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
