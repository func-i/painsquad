'use strict'

@directiveModule.directive 'bodyMap', ($timeout) ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'E'
  template: '<section ng-include="getSvgPath()"></section>'

  link: (scope, elem, attr) ->
    scope.getSvgPath = () ->
      attr.svgPath

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

        # scope.$apply is automatic when using $timeout
        scope.$parent.painRegion.tempSelections = selections
    , 100

    # $timeout () ->
    #   $paths = angular.element(document.querySelector('#selections')).find('path')

    #   scope.$parent.$watch "selections.#{attr.regionType}", (regionArray) ->
    #     for region in regionArray
    #       item = _.find $paths, (path) -> path.id is region
    #       item.setAttribute('fill', selectedFill)
    # , 100

    #   for region in scope.$parent.selections[attr.regionType]
    #     item = _.find $paths, (path) -> path.id is region
    #     item.setAttribute('fill', selectedFill)
