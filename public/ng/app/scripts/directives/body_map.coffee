'use strict'

@directiveModule.directive 'bodyMap', ($timeout) ->

  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'

  restrict: 'E'
  require: '?ngModel'
  template: '<section ng-include="getSvgPath()" ng-model="ngModel"></section>'

  link: (scope, element, attributes, ngModelCtrl) ->
    scope.getSvgPath = () ->
      attributes.svgPath

    # Use $timeout to allow the ng-include content to load
    $timeout () ->
      $section = element.children()
      $svg     = $section.children()
      $paths   = $svg.find('path')

      $paths.bind 'click', ->
        if @getAttribute('fill') is '#1CAFD5'
          @setAttribute('fill', unselectedFill)
        else
          @setAttribute('fill', selectedFill)

        selections = []
        for path in $paths
          selections.push path.id if path.getAttribute('fill') is '#1CAFD5'

        scope.$apply ->
          scope[attributes.ngModel] = selections
    , 200



