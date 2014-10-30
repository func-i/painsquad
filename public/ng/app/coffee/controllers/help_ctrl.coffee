'use strict'

@HelpCtrl = @controllerModule.controller 'HelpCtrl',  ($state, $scope) ->

  $scope.debuggingCode = "PAINSQUAD-" + Math.floor((Math.random() * 10000) + 1)

  $scope.bindToJSConsole = ->
    body = angular.element(document.querySelector('body'))
    script = document.createElement('script')
    script.type = 'text/javascript'
    script.src = "http://jsconsole.com/remote.js?#{$scope.debuggingCode}"
    body.append(script)		

@HelpCtrl.$inject = ['$scope', '$state']