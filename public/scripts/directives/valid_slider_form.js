(function() {
  'use strict';
  this.directiveModule.directive('validSliderForm', function() {
    return {
      link: function(scope) {
        return scope.$watch('currentForm', function(form) {
          return scope.$emit('currentForm:valid');
        });
      }
    };
  });

}).call(this);
