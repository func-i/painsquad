(function() {
  'use strict';
  this.directiveModule.directive('validRadioForm', function() {
    return {
      link: function(scope) {
        return scope.$watch('currentForm.$dirty', function(isDirty) {
          if (isDirty) {
            return scope.$emit('currentForm:valid');
          } else {
            return scope.$emit('currentForm:invalid');
          }
        });
      }
    };
  });

}).call(this);
