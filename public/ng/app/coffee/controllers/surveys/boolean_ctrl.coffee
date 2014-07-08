'use strict'

@BooleanCtrl = @controllerModule.controller "BooleanCtrl", ($scope, $state) ->
  console.log 'boolean ctrl'

@BooleanCtrl.$inject = ['$scope', '$state']
