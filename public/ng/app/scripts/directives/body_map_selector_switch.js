(function() {
  'use strict';
  var indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  this.directiveModule.directive('bodyMapSelectorSwitch', function() {
    var selectedFill, unselectedFill;
    selectedFill = '#1CAFD5';
    unselectedFill = '#DDC9B2';
    return {
      restrict: 'A',
      link: function(scope, elem, attr, ctrl) {
        var $availablePaths, $directiveSelections, $paths, $persistedSelections, i, item, j, len, len1, ref, region;
        $paths = angular.element(document.querySelector("[region='" + attr.region + "'] #selections")).find('path');
        $availablePaths = _.pluck($paths, 'id');
        $persistedSelections = scope.$parent.selections;
        $directiveSelections = scope.$parent.modalSelection.tempSelections || [];
        ref = scope.$parent.modalSelection.tempSelections;
        for (i = 0, len = ref.length; i < len; i++) {
          region = ref[i];
          if (indexOf.call($availablePaths, region) >= 0) {
            item = _.find($paths, function(path) {
              return path.id === region;
            });
            item.setAttribute('fill', selectedFill);
          }
        }
        for (j = 0, len1 = $persistedSelections.length; j < len1; j++) {
          region = $persistedSelections[j];
          if (indexOf.call($availablePaths, region) >= 0) {
            item = _.find($paths, function(path) {
              return path.id === region;
            });
            item.setAttribute('fill', selectedFill);
          }
        }
        return $paths.bind('click', function() {
          if (this.getAttribute('fill') === selectedFill) {
            this.setAttribute('fill', unselectedFill);
            $directiveSelections.splice($directiveSelections.indexOf(this.id), 1);
          } else {
            this.setAttribute('fill', selectedFill);
            $directiveSelections.push(this.id);
          }
          return scope.$apply(function() {
            return scope.$parent.modalSelection.tempSelections = _.uniq($directiveSelections);
          });
        });
      }
    };
  });

}).call(this);
