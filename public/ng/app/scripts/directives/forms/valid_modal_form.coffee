'use strict'

@directiveModule.directive 'validModalForm', ->
  link: (scope) ->
    scope.$watch 'currentForm.$dirty', (isDirty)  ->
      if isDirty
        scope.$emit 'detailModal:valid'
      else
        scope.$emit 'detailModal:invalid'
