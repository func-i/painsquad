'use strict'

@HomeCtrl = @controllerModule.controller 'HomeCtrl', ($scope, $rootScope, $state, $stateParams, AuthService, SubmissionService) ->
  $scope.currentUser = $rootScope.user

@HomeCtrl.$inject = ['$scope', '$rootScope', '$state', '$stateParams', 'AuthService', 'SubmissionService']