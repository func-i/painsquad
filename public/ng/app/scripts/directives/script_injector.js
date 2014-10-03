(function() {
  'use strict';
  this.directiveModule.directive('scriptInjector', function() {
    var updateScripts;
    updateScripts = function(element) {
      return function(scripts) {
        element.empty();
        return angular.forEach(scripts, function(source, key) {
          return console.log(source, key);
        });
      };
    };
    return {
      restrict: "EA",
      scope: {
        scripts: "="
      },
      link: function(scope, element) {
        return scope.$watch("scripts", updateScripts(element));
      }
    };
  });

}).call(this);
