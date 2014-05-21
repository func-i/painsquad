'use strict'

@AdviceCtrl = @controllerModule.controller 'AdviceCtrl', ($scope, $state, advice) ->
  console.log "Advice Ctrl Instantiated"

  $scope.test = ->
    "yes"


# @AdviceCtrl.$inject = ['$scope', '$state']

# resolve this resource before loading the controller
@AdviceCtrl.resolve =
  advice: (Advice, $q) ->
    deferred = $q.defer()

    Advice.query (response) ->
      deffered.resolve response
      # deferred.resolve response.survey

    deferred.promise
