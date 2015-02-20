(function() {
  'use strict';
  this.directiveModule.directive('bodyMapSelector', function() {
    var selectedFill, unselectedFill;
    selectedFill = '#1CAFD5';
    unselectedFill = '#DDC9B2';
    return {
      restrict: 'A',
      link: function(scope, elem, attr, ctrl) {
        var $paths, i, item, len, ref, region, results;
        $paths = angular.element(document.querySelector('#selections')).find('path');
        $paths.bind('click', function() {
          var _selections, i, len, path;
          if (this.getAttribute('fill') === selectedFill) {
            this.setAttribute('fill', unselectedFill);
          } else {
            this.setAttribute('fill', selectedFill);
          }
          _selections = [];
          for (i = 0, len = $paths.length; i < len; i++) {
            path = $paths[i];
            if (path.getAttribute('fill') === selectedFill) {
              _selections.push(path.id);
            }
          }
          return scope.$apply(function() {
            return scope.$parent.modalSelection.tempSelections = _selections;
          });
        });
        ref = scope.$parent.selections[attr.region];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          region = ref[i];
          item = _.find($paths, function(path) {
            return path.id === region;
          });
          results.push(item.setAttribute('fill', selectedFill));
        }
        return results;
      }
    };
  });

}).call(this);
