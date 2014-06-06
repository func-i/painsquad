(function() {
  'use strict';
  this.RadioCtrl = this.controllerModule.controller("RadioCtrl", function($scope, $state) {
    return $scope.setRadioAnswer = function(question, choice) {
      var c, _i, _len, _ref;
      _ref = question.choices;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        c = _ref[_i];
        delete c.selected;
      }
      return choice.selected = true;
    };
  });

  this.RadioCtrl.$inject = ['$scope', '$state'];

}).call(this);
