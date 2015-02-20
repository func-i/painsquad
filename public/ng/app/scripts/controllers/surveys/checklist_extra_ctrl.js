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
      var choice, i, len, ref, results;
      ref = $scope.question.choices;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        choice = ref[i];
        if (!choice.can_disable) {
          choice.selected = false;
          results.push(choice.disabled = !choice.disabled);
        } else {
          results.push(void 0);
        }
      }
      return results;
    };
    return $scope.atLeastOne = function() {
      var choice, i, inverse, len, ref;
      inverse = null;
      ref = $scope.question.choices;
      for (i = 0, len = ref.length; i < len; i++) {
        choice = ref[i];
        if (choice.selected) {
          inverse = true;
        }
      }
      return !inverse;
    };
  });

  this.ChecklistExtraCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal'];

}).call(this);
