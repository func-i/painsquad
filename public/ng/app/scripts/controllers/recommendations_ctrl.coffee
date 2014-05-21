'use strict'

@RecommendationsCtrl = @controllerModule.controller 'RecommendationsCtrl', ($scope, $state, $stateParams, adviceResource) ->
  $scope.data = {}
  $scope.data.recommended = adviceResource.advice.recommendations

@RecommendationsCtrl.$inject = ['$scope', '$state', '$stateParams', 'adviceResource']
