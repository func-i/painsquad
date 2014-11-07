(function() {
  'use strict';
  this.directiveModule.directive('scriptInjector', function() {
    return {
      restrict: "E",
      scope: {
        src: "="
      },
      template: '<script src="{{src}}"></script>'
    };
  });

}).call(this);
