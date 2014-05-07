'use strict'

@directiveModule.directive 'bodyMap', ($timeout) ->

  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'

  restrict: 'E'
  # require: '?ngModel'
  template: '<section ng-include="getSvgPath()"></section>'

  link: (scope, element, attributes) ->
    scope.getSvgPath = () ->
      attributes.svgPath

    # Use $timeout to allow the ng-include content to load
    $timeout () ->
      $paths   = angular.element(document.querySelector('#selections')).find('path')

      $paths.bind 'click', ->
        if @getAttribute('fill') is selectedFill
          @setAttribute('fill', unselectedFill)
        else
          @setAttribute('fill', selectedFill)

        selections = []
        for path in $paths
          selections.push path.id if path.getAttribute('fill') is selectedFill
    , 200
