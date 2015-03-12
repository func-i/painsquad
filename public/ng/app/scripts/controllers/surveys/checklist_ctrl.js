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
      var choice, _i, _len, _ref, _results;
      _ref = $scope.question.choices;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        choice = _ref[_i];
        if (!choice.can_disable) {
          choice.selected = false;
          _results.push(choice.disabled = !choice.disabled);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
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

  this.ChecklistCtrl.$inject = ['$scope', '$state', '$ionicScrollDelegate'];

}).call(this);
