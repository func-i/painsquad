'use strict'

@controllerModule.controller "ChecklistExtraCtrl", ['$scope', '$state', ($scope, $state) ->

  $scope.atLeastOneSelection = (choices) ->
    atLeastOne = _.some choices, (choice) ->
      choice.selected
    !atLeastOne

]
