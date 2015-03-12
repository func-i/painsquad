(function() {
  'use strict';
  this.directiveModule.directive('bodyMapSelector', function() {
    var selectedFill, unselectedFill;
    selectedFill = '#1CAFD5';
    unselectedFill = '#DDC9B2';
    return {
      restrict: 'A',
      link: function(scope, elem, attr, ctrl) {
        var $paths, item, region, _i, _len, _ref, _results;
        $paths = angular.element(document.querySelector('#selections')).find('path');
        $paths.bind('click', function() {
          var path, _i, _len, _selections;
          if (this.getAttribute('fill') === selectedFill) {
            this.setAttribute('fill', unselectedFill);
          } else {
            this.setAttribute('fill', selectedFill);
          }
          _selections = [];
          for (_i = 0, _len = $paths.length; _i < _len; _i++) {
            path = $paths[_i];
            if (path.getAttribute('fill') === selectedFill) {
              _selections.push(path.id);
            }
          }
          return scope.$apply(function() {
            return scope.$parent.modalSelection.tempSelections = _selections;
          });
        });
        _ref = scope.$parent.selections[attr.region];
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          region = _ref[_i];
          item = _.find($paths, function(path) {
            return path.id === region;
          });
          _results.push(item.setAttribute('fill', selectedFill));
        }
        return _results;
      }
    };
  });

}).call(this);
