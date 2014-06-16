(function() {
  'use strict';
  this.RadioCtrl = this.controllerModule.controller("RadioCtrl", function($scope, $state) {
    $scope.deselectOther = function(selectedChoice) {
      var choice, _i, _len, _ref, _results;
      _ref = $scope.question.choices;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        choice = _ref[_i];
        if (choice !== selectedChoice) {
          _results.push(choice.selected = false);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };
    return $scope.preventDeselect = function(selectedChoice) {
      if (selectedChoice.selected) {
        return true;
      }
    };
  });

  this.RadioCtrl.$inject = ['$scope', '$state'];

}).call(this);
