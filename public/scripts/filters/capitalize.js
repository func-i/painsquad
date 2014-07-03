(function() {
  'use strict';
  this.filterModule.filter('capitalize', function() {
    return function(input) {
      if (input != null) {
        input = input.toLowerCase();
        return input.substring(0, 1).toUpperCase() + input.substring(1);
      }
    };
  });

}).call(this);
