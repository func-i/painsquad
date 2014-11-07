(function() {
  'use strict';
  this.directiveModule.directive('scriptInjector', function() {
    return {
      restrict: "E",
      scope: {
        src: "="
      },
      link: function(scope, element, attrs) {
        return scope.$watch("src", function(src) {
          var scriptTag;
          console.log(element);
          console.log(src);
          element.empty();
          scriptTag = document.createElement("script");
          console.log(scriptTag);
          return element.html(scriptTag);
        });
      }
    };
  });

}).call(this);
