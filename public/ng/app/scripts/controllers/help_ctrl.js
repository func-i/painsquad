(function() {
  'use strict';
  this.HelpCtrl = this.controllerModule.controller('HelpCtrl', function($state, $scope) {
    $scope.debuggingCode = "PAINSQUAD-" + Math.floor((Math.random() * 10000) + 1);
    return $scope.bindToJSConsole = function() {
      var body, script;
      body = angular.element(document.querySelector('body'));
      script = document.createElement('script');
      script.type = 'text/javascript';
      script.src = "http://jsconsole.com/remote.js?" + $scope.debuggingCode;
      return body.append(script);
    };
  });

  this.HelpCtrl.$inject = ['$scope', '$state'];

}).call(this);
