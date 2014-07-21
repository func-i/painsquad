(function() {
  'use strict';
  this.filterModule.filter('orderByWidth', function() {
    return function(input) {
      var array, lastItem, pushToEnd;
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
      if (array.length % 2 !== 0) {
        array[array.length - 1].wide = true;
      }
      return array.concat(pushToEnd).concat(lastItem);
    };
  });

}).call(this);
