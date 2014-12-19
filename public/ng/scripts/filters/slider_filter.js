(function() {
  'use strict';
  this.filterModule.filter('sliderFilter', function() {
    return function(input) {
      if (input) {
        return Math.floor(input / 10);
      } else {
        return 0;
      }
    };
  });

}).call(this);
