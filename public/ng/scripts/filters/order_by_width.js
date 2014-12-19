(function() {
  'use strict';
  this.filterModule.filter('orderByWidth', function() {
    return function(input) {
      var array, compare, lastItem, pushToEnd;
      array = [];
      pushToEnd = [];
      lastItem = [];
      angular.forEach(input, function(item) {
        if (item.content.length >= 10) {
          item.wide = true;
          return pushToEnd.push(item);
        } else if (item.textfield) {
          return lastItem.push(item);
        } else {
          return array.push(item);
        }
      });
      compare = function(a, b) {
        if (a.content < b.content) {
          return -1;
        }
        if (a.content > b.content) {
          return 1;
        }
        return 0;
      };
      if (array.length % 2 !== 0) {
        array[array.length - 1].wide = true;
      }
      return array.sort(compare).concat(pushToEnd.sort(compare)).concat(lastItem);
    };
  });

}).call(this);
