(function() {
  'use strict';
  this.HomeCtrl = this.controllerModule.controller('HomeCtrl', function($scope, $state, UserService) {
    return $scope.currentUser = UserService.currentUser();
  });

  this.HomeCtrl.$inject = ['$scope', '$state', 'UserService'];

}).call(this);
