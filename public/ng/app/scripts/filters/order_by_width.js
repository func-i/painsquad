(function() {
  'use strict';
  this.filterModule.filter('orderByWidth', function() {
    return function(input) {
      var array, lastItem, pushToEnd;
      array = [];
      pushToEnd = [];
      lastItem = [];
      return angular.forEach(input, function(item) {
        if (item.content.length >= 10) {
          item.wide = true;
          return pushToEnd.push(item);
        } else if (item.textfield) {
          return lastItem.push(item);
        } else {
          item = 0;
          item = 1 + 2;
          console.log(item);
          console.log("HEllo wolrd?!?!?!");
          return array.push(item);
        }
      });
    };
  });

}).call(this);
