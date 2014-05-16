'use strict'

@directiveModule.directive 'bodyMapSelectorSwitch', () ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'A'

  link: (scope, elem, attr, ctrl) ->
    $paths                = angular.element(document.querySelector("[region='#{attr.region}'] #selections")).find('path')
    $availablePaths       = _.pluck($paths, 'id')
    $persistedSelections  = scope.$parent.selections
    $directiveSelections  = scope.$parent.modalSelection.tempSelections || []

    # redraws from tempSelections
    for region in scope.$parent.modalSelection.tempSelections
      if region in $availablePaths
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill)

    # redraws from persisted selections
    for region in $persistedSelections
      if region in $availablePaths
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill)

    $paths.bind 'click', ->
      if @getAttribute('fill') is selectedFill
        @setAttribute('fill', unselectedFill)
        $directiveSelections.splice $directiveSelections.indexOf(@id), 1
      else
        @setAttribute('fill', selectedFill)
        $directiveSelections.push @id

      scope.$apply ->
        scope.$parent.modalSelection.tempSelections = _.uniq($directiveSelections)
