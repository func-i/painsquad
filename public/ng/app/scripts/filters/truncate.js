(function() {
  'use strict';
  this.filterModule.filter('truncate', function() {
    return function(input, chars, breakOnWord) {
      var lastspace;
      if (isNaN(chars)) {
        return input;
      }
      if (chars <= 0) {
        return "";
      }
      if (input && input.length > chars) {
        input = input.substring(0, chars);
        if (!breakOnWord) {
          lastspace = input.lastIndexOf(" ");
          if (lastspace !== -1) {
            input = input.substr(0, lastspace);
          }
        } else {
          while (input.charAt(input.length - 1) === " ") {
            input = input.substr(0, input.length - 1);
          }
        }
        return input + "...";
      }
      return input;
    };
  });

}).call(this);
