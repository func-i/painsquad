'use strict'

@directiveModule.directive 'bodyMapSelector', () ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'A'

  link: (scope, elem, attr, ctrl) ->
    $paths = angular.element(document.querySelector('#selections')).find('path')

    $paths.bind 'click', ->
      if @getAttribute('fill') is selectedFill
        @setAttribute('fill', unselectedFill)
      else
        @setAttribute('fill', selectedFill)

      _selections = []
      for path in $paths
        _selections.push path.id if path.getAttribute('fill') is selectedFill

      scope.$apply ->
        scope.$parent.modalSelection.tempSelections = _selections

    # redraws from $scope.selections
    for region in scope.$parent.selections[attr.region]
      item = _.find $paths, (path) -> path.id is region
      item.setAttribute('fill', selectedFill)
