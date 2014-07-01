(function() {
  'use strict';
  this.ChecklistModalCtrl = this.controllerModule.controller("ChecklistModalCtrl", function($scope, $state, $stateParams, $ionicModal) {
    $scope.ifSliderNull = function(choice) {
      if (choice && !((choice.value != null) || choice.slider_disabled === true)) {
        return true;
      }
    };
    $scope.ifTextareaPresent = function(choice) {
      if (choice && !(choice.custom_text && choice.custom_text.length < 1)) {
        return true;
      }
    };
    $scope.saveDetails = function(choice) {
      choice.selected = true;
      return $scope.modal.hide();
    };
    $scope.discardDetails = function(choice) {
      choice.selected = false;
      choice.value = null;
      return $scope.modal.hide();
    };
    $scope.showSave = false;
    $scope.$on('detailModal:valid', function(event) {
      return $scope.showSave = true;
    });
    return $scope.$on('detailModal:invalid', function(event) {
      return $scope.showSave = false;
    });
  });

  this.ChecklistModalCtrl.$inject = ['$scope', '$state', '$stateParams', '$ionicModal'];

}).call(this);
