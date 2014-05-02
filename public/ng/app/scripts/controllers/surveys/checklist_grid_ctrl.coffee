'use strict'

@controllerModule.controller "ChecklistGridCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.atLeastOneSelection = (choices) ->
    atLeastOne = _.some choices, (choice) ->
      choice.selected
    !atLeastOne
]
