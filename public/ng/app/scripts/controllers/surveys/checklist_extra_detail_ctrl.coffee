'use strict'

@controllerModule.controller "ChecklistExtraDetailCtrl", ['$scope', '$state', '$stateParams', ($scope, $state, $stateParams) ->
  console.log "Checklist Detail Ctrl instantiated!"
  $scope.choice = $stateParams.choice
]
