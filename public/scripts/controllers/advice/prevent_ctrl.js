(function() {
  'use strict';
  this.PreventCtrl = this.controllerModule.controller('PreventCtrl', function($scope, $state, $stateParams, PreventionRecommendations, PainService) {
    return PainService.init(PreventionRecommendations);
  });

  this.PreventCtrl.$inject = ['$scope', '$state', '$stateParams', 'PreventionRecommendations', 'PainService'];

}).call(this);
