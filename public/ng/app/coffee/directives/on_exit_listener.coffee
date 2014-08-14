'use strict'

@directiveModule.directive 'onExitListener', ($document, $timeout) ->
  link: (scope, elem, attr) ->
    elem[0].addEventListener 'webkitendfullscreen', (event) ->
      $timeout ->
        scope.$parent.showInlineVideo = false
      , 50
