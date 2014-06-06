(function() {
  'use strict';
  this.ChecklistExtraCtrl = this.controllerModule.controller("ChecklistExtraCtrl", function($scope, $state, $stateParams, $ionicModal) {
    var currentChoice;
    $scope.detailData = currentChoice = {};
    $ionicModal.fromTemplateUrl("templates/surveys/question_types/modal.checklist.html", function(modal) {
      return $scope.modal = modal;
    }, {
      animation: "slide-in-up",
      scope: $scope
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.goToSectionOrDisable = function(choice) {
      if (this.choice.can_disable) {
        return $scope.disableAllChoices();
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
      var atLeastOne;
      atLeastOne = _.some($scope.question.choices, function(choice) {
        if (choice.textfield) {
          return choice.selected && choice.custom_text && choice.custom_text.length > 5;
        } else {
          return choice.selected;
        }
      });
      return !atLeastOne;
    };
  });

  this.ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal'];

}).call(this);
