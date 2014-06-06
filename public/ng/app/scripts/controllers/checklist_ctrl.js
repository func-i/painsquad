(function() {
  'use strict';
  this.ChecklistCtrl = this.controllerModule.controller("ChecklistCtrl", function($scope, $state) {
    $scope.disableIfNone = function() {
      if (this.choice.can_disable) {
        return $scope.disableAllChoices();
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
      var atLeastOne;
      atLeastOne = _.some($scope.question.choices, function(choice) {
        if (choice.textfield) {
          return choice.selected && choice.value && choice.value.length > 5;
        } else {
          return choice.selected;
        }
      });
      return !atLeastOne;
    };
  });

  this.ChecklistCtrl.$inject = ['$scope', '$state'];

}).call(this);
