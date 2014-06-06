(function() {
  'use strict';
  this.directiveModule.directive('dragBack', function($ionicGesture, $state) {
    return {
      restrict: "A",
      link: function(scope, elem, attr) {
        return $ionicGesture.on("swipe", (function(event) {
          console.log("Got swiped!");
          event.preventDefault();
          return window.history.back();
        }), elem);
      }
    };
  });

}).call(this);
