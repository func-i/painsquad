(function() {
  'use strict';
  this.ChecklistGridCtrl = this.controllerModule.controller("ChecklistGridCtrl", function($scope, $state) {
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

  this.ChecklistGridCtrl.$inject = ['$scope', '$state'];

}).call(this);
