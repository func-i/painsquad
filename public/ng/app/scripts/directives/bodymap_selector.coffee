'use strict'

@directiveModule.directive 'bodymapSelector', () ->

  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'

  restrict: 'A'

  link: (scope, elem, attr) ->
    $paths             = angular.element(document.querySelector('#selections')).find('path')
    $currentSelections = if scope.selections[attr.regionType].length then scope.selections[attr.regionType] else []

    regionInSelection = (selections, parentNode, region) ->
      _.contains(selections, region)

    addRegion = (parentNode, region) ->
      $currentSelections.push(region)
      # scope.selections[parentNode].push region

    removeRegion = (parentNode, region) ->
      $currentSelections.splice($currentSelections.indexOf(region), 1)
      # scope.selections[parentNode].splice(scope.selections[parentNode].indexOf(region), 1)

    $paths.bind 'click', ->
      parentNode = event.target.parentNode.id
      region     = event.target.id
      if regionInSelection($currentSelections, parentNode, region)
        removeRegion(parentNode, region)
        event.target.setAttribute('fill', unselectedFill)
      else
        addRegion(parentNode, region)
        event.target.setAttribute('fill', selectedFill)

    scope.$watch "selections.#{attr.regionType}", (regionArray) ->
      _.each regionArray, (region) ->
        item = _.find $paths, (path) ->
          path.id is region
        item.setAttribute('fill', selectedFill)
