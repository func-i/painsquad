'use strict'

@ManageCtrl = @controllerModule.controller 'ManageCtrl', ($scope, $state, $stateParams, ManagementRecommendations, PainService) ->
  PainService.init(ManagementRecommendations)

@ManageCtrl.$inject = ['$scope', '$state', '$stateParams', 'ManagementRecommendations', 'PainService']
