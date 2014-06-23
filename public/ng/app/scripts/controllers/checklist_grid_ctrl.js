(function() {
  'use strict';
  this.ChecklistGridCtrl = this.controllerModule.controller("ChecklistGridCtrl", function($scope, $state) {
    return $scope.atLeastOne = function() {
      var choice, inverse, _i, _len, _ref;
      inverse = null;
      _ref = $scope.question.choices;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        choice = _ref[_i];
        if (choice.textfield) {
          if (choice.selected && choice.item && choice.value.length > 5) {
            inverse = true;
          }
        } else if (choice.selected) {
          inverse = true;
        }
      }
      return !inverse;
    };
  });

  this.ChecklistGridCtrl.$inject = ['$scope', '$state'];

}).call(this);
