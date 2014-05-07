'use strict'

@directiveModule.directive 'bodyMap', ($timeout) ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'E'
  template: '<section ng-include="getSvgPath()"></section>'

  link: (scope, element, attributes) ->
    $paths = angular.element(document.querySelector('#selections')).find('path')

    scope.getSvgPath = () ->
      attributes.svgPath

    # Use $timeout to allow the ng-include content to load
    $timeout () ->
      $paths = angular.element(document.querySelector('#selections')).find('path')
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
          # scope[attributes.ngModel] = selections
    , 200

    $timeout () ->
      scope.$parent.$watch "selections.#{attributes.regionType}", (regionArray) ->
        _.each regionArray, (region) ->
          item = _.find $paths, (path) ->
            path.id is region
          item.setAttribute('fill', selectedFill)
    , 200

