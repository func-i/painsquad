(function() {
  'use strict';
  this.directiveModule.directive('validModalForm', function() {
    return {
      link: function(scope, elem, attr) {
        return scope.$watch('currentForm.$valid', function(isValid) {
          if (isValid) {
            return scope.$emit('detailModal:valid');
          } else {
            return scope.$emit('detailModal:invalid');
          }
        });
      }
    };
  });

}).call(this);
