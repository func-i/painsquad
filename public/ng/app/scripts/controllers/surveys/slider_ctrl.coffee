'use strict'

@SliderCtrl = @controllerModule.controller "SliderCtrl", ($scope, $state) ->

  $scope.$on 'resetQuestion', (event, $scope) ->
    event.currentScope.currentForm.$setPristine()

@SliderCtrl.$inject = ['$scope', '$state']
