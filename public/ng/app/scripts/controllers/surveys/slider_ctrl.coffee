'use strict'

@SliderCtrl = @controllerModule.controller "SliderCtrl", ($scope, $state) ->

  $scope.$on 'resetQuestion', (event) ->
    event.currentScope.currentForm.$setPristine()

@SliderCtrl.$inject = ['$scope', '$state']
