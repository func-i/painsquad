(function() {
  'use strict';
  this.BodymapCtrl = this.controllerModule.controller("BodymapCtrl", function($scope, $state, $ionicModal, BodymapService) {
    var getPainRegion, resetModalSelection;
    $scope.selections = BodymapService.getSelections();
    $scope.modalSelection = {
      choice: {},
      tempSelections: []
    };
    $ionicModal.fromTemplateUrl("templates/surveys/question_types/modal.bodymap.html", {
      scope: $scope,
      animation: "slide-in-up"
    }).then(function(modal) {
      return $scope.modal = modal;
    });
    $scope.$on('$destroy', function() {
      return $scope.modal.remove();
    });
    $scope.contentSaved = function(painRegion) {
      if (painRegion == null) {
        return;
      }
      if (BodymapService.anyElementsInRegion(painRegion.toLowerCase())) {
        $scope.$emit('currentForm:valid');
        return true;
      }
    };
    $scope.openModal = function(choice) {
      $scope.modalSelection.choice = choice;
      $scope.modalSelection.tempSelections = angular.copy($scope.selections[getPainRegion()]);
      return $scope.modal.show();
    };
    $scope.saveModalSelections = function() {
      $scope.selections[getPainRegion()] = $scope.modalSelection.tempSelections;
      resetModalSelection();
      return $scope.modal.hide();
    };
    $scope.discardModalSelections = function() {
      resetModalSelection();
      return $scope.modal.hide();
    };
    $scope.renderBodymapPartial = function() {
      if ($scope.modalSelection.choice.content == null) {
        return;
      }
      return "templates/surveys/question_types/bodymap." + (getPainRegion()) + ".html";
    };
    getPainRegion = function() {
      return $scope.modalSelection.choice.content.toLowerCase();
    };
    return resetModalSelection = function() {
      return $scope.modalSelection = {
        choice: {},
        tempSelections: []
      };
    };
  });

  this.BodymapCtrl.$inject = ['$scope', '$state', '$ionicModal', 'BodymapService'];

}).call(this);
