(function() {
  'use strict';
  this.directiveModule.directive('onExitListener', function($document, $timeout) {
    return {
      link: function(scope, elem, attr) {
        return elem[0].addEventListener('webkitendfullscreen', function(event) {
          return $timeout(function() {
            return scope.$parent.showInlineVideo = false;
          }, 50);
        });
      }
    };
  });

}).call(this);
