(function() {
  'use strict';
  this.directiveModule.directive('validForm', function() {
    return {
      link: function(scope) {
        return scope.$watch('currentForm.$valid', function(isValid) {
          if (isValid) {
            return scope.$emit('currentForm:valid');
          } else {
            return scope.$emit('currentForm:invalid');
          }
        });
      }
    };
  });

}).call(this);
