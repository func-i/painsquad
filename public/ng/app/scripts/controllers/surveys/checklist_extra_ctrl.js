(function() {
  'use strict';
  this.ChecklistExtraCtrl = this.controllerModule.controller("ChecklistExtraCtrl", function($scope, $state, $stateParams, $ionicModal) {
    var currentChoice;
    $scope.detailData = currentChoice = {};
    $ionicModal.fromTemplateUrl("templates/surveys/questions/modal.checklist.html", {
      scope: $scope,
      animation: "slide-left-right"
    }).then(function(modal) {
      return $scope.modal = modal;
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.delegateSelection = function(choice) {
      if (this.choice.can_disable) {
        return $scope.disableAllChoices();
      } else if (this.choice.selected) {
        return this.choice.selected = false;
      } else {
        $scope.detailData.currentChoice = choice;
        return $scope.modal.show();
      }
    };
    $scope.isNotNone = function() {
      if (this.choice.can_disable) {
        return false;
      } else {
        return true;
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
        if (choice.selected) {
          inverse = true;
        }
      }
      return !inverse;
    };
  });

  this.ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal'];

}).call(this);
