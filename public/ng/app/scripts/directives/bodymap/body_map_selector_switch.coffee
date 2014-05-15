'use strict'

@directiveModule.directive 'bodyMapSelectorSwitch', () ->
  selectedFill   = '#1CAFD5'
  unselectedFill = '#DDC9B2'
  restrict: 'A'

  link: (scope, elem, attr, ctrl) ->
    $paths               = angular.element(document.querySelector("[region='#{attr.region}'] #selections")).find('path')
    $availablePaths      = _.pluck($paths, 'id')
    $persistedSelections = scope.$parent.selections[scope.$parent.modalSelection.choice.content.toLowerCase()]
    $existingSelections  = scope.$parent.modalSelection.tempSelections

    $paths.bind 'click', ->
      if @getAttribute('fill') is selectedFill
        @setAttribute('fill', unselectedFill)
      else
        @setAttribute('fill', selectedFill)

      _selections = []
      for path in $paths
        if path.getAttribute('fill') is selectedFill
          _selections.push path.id
        else
          # console.log _selections
          # _selections.splice _selections.indexOf(path.id), 1

      scope.$apply ->
        scope.$parent.modalSelection.tempSelections = _.uniq($existingSelections.concat _selections)
        # fuckfuckfuck
        # scope.$parent.modalSelection.tempSelections = _selections if _selections.length
        # scope.$parent.modalSelection
        # scope.switchSelections.data = _.uniq((scope.switchSelections.data.concat(_selections)))

    # redraws from tempSelections
    for region in $existingSelections
      if region in $availablePaths
        item = _.find $paths, (path) -> path.id is region
        item.setAttribute('fill', selectedFill)

    # redraws from persisted selections
    if $persistedSelections.length
      for region in $persistedSelections
        if region in $availablePaths
          item = _.find $paths, (path) -> path.id is region
          item.setAttribute('fill', selectedFill)
