(function() {
  'use strict';
  this.ManageCtrl = this.controllerModule.controller('ManageCtrl', function($scope, $state, $stateParams, ManagementRecommendations, PainService) {
    return PainService.init(ManagementRecommendations);
  });

  this.ManageCtrl.$inject = ['$scope', '$state', '$stateParams', 'ManagementRecommendations', 'PainService'];

}).call(this);
