(function() {
  'use strict';
  this.directiveModule.directive('gridOrder', function() {
    return {
      link: function(scope) {
        return console.log("grid order directive!");
      }
    };
  });

}).call(this);
