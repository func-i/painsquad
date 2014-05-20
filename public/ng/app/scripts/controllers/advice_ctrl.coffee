'use strict'

@AdviceCtrl = @controllerModule.controller 'AdviceCtrl', ($scope, $state) ->
  $scope.data = {}
  $scope.data.test = "hello world"

@AdviceCtrl.$inject = ['$scope', '$state']
