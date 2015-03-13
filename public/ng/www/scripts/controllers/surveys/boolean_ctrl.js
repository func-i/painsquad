(function() {
  'use strict';
  this.BooleanCtrl = this.controllerModule.controller("BooleanCtrl", function($scope, $state) {
    return console.log('boolean ctrl');
  });

  this.BooleanCtrl.$inject = ['$scope', '$state'];

}).call(this);
