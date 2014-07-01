(function() {
  var underscore;

  underscore = angular.module("underscore", []);

  underscore.factory("_", function() {
    return window._;
  });

}).call(this);
