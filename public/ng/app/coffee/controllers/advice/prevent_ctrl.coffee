'use strict'

@PreventCtrl = @controllerModule.controller 'PreventCtrl', ($scope, $state, $stateParams, PreventionRecommendations, PainService) ->
  PainService.init(PreventionRecommendations)

@PreventCtrl.$inject = ['$scope', '$state', '$stateParams', 'PreventionRecommendations', 'PainService']
