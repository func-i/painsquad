'use strict'

@directiveModule.directive 'bodyMapDual', ($timeout) ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'E'
  template: '<section ng-include="getSvgPath()"></section>'

  link: (scope, element, attr) ->
    scope.getSvgPath = () ->
      attr.svgPath

    # Use $timeout to allow the ng-include content to load
    $timeout () ->
      $paths = angular.element(document.querySelector('#selections')).find('path')

      # redraws from ng-switch selections
      for region in scope.$parent.tempSelections[attr.boundScope]
      # for region in scope.$parent.selections[attr.region]
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill) if item

      # redraws from persisted selections
      for region in scope.$parent.selections[attr.region]
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill) if item

      $paths.bind 'click', ->
        if @getAttribute('fill') is selectedFill
          @setAttribute('fill', unselectedFill)
        else
          @setAttribute('fill', selectedFill)

        selections = []
        for path in $paths
          selections.push path.id if path.getAttribute('fill') is selectedFill

        scope.$apply ->
          scope.$parent.tempSelections[attr.boundScope] = selections

    , 50