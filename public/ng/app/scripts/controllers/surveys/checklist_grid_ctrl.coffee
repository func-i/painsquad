'use strict'

@controllerModule.controller "ChecklistGridCtrl", ['$scope', '$state', ($scope, $state) ->
  console.log 'Checklist Grid Ctrl Instantiated!!!'

  $scope.atLeastOneSelection = (choices) ->
    atLeastOne = _.some choices, (choice) ->
      choice.selected
    !atLeastOne
]
