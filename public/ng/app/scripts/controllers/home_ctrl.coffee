'use strict'

@controllerModule.controller 'HomeCtrl', ['$scope', '$state', '$stateParams', 'AuthService', ($scope, $state, $stateParams, AuthService) ->

  # TODO: This should probably be set somewhere globally
  $scope.currentUser = AuthService.getCurrentUser()

]