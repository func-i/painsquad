'use strict'

@directiveModule.directive 'bodyMap', ($timeout) ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'E'
  template: '<section ng-include="getSvgPath()"></section>'

  link: (scope, element, attributes) ->
    scope.getSvgPath = () ->
      attributes.svgPath

    $paths = angular.element(document.querySelector('#selections')).find('path')

    # Use $timeout to allow the ng-include content to load
    $timeout () ->
      $paths = angular.element(document.querySelector('#selections')).find('path')
      console.log "paths", $paths
      $paths.bind 'click', ->
        if @getAttribute('fill') is selectedFill
          @setAttribute('fill', unselectedFill)
        else
          @setAttribute('fill', selectedFill)

        selections = []
        for path in $paths
          selections.push path.id if path.getAttribute('fill') is selectedFill

        scope.$apply ->
          scope.$parent.tempSelections = selections

      # Load saved selections from the parent
      # Loop through them and reselect their regions
      for region in scope.$parent.selections[attributes.regionType]
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill)

    , 100
