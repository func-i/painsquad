(function() {
  'use strict';
  this.directiveModule.directive('sliderGradient', function() {
    return {
      restrict: 'A',
      scope: {
        sliderGradient: '=sliderGradient'
      },
      link: function(scope, elem, attr) {
        return scope.$watch('sliderGradient', function(value) {
          value || (value = 50);
          return elem.css('left', (parseInt(value)) + "%");
        });
      }
    };
  });

}).call(this);
