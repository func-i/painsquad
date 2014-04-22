'use strict'

@CaseCtrl = @controllerModule.controller 'CaseCtrl', ($rootScope, $scope, $state, $timeout, $stateParams, $ionicViewService, ApiService) ->
  if $rootScope.painCase is undefined
    $rootScope.painCase =
      points: 0

  # no pain reported
  $scope.noPain = ->
    # if
    $rootScope.painCase.points += 25

  $scope.steps = [
    # slider
    'How Much Pain',
    # radio
    'How Long Did It Last',
    # check list
    'What Caused It',
    # textbox
    'Other Details'
  ]

  $scope.selection = $scope.steps[0]

  # get current step index
  $scope.getCurrentStepIndex = ->
    _.indexOf $scope.steps, $scope.selection

  # jump to step
  $scope.goToStep = (index) ->
    $scope.selection = $scope.steps[index]  unless _.isUndefined($scope.steps[index])

  # return true if next step exists
  $scope.hasNextStep = ->
    stepIndex = $scope.getCurrentStepIndex()
    nextStep = stepIndex + 1
    not _.isUndefined($scope.steps[nextStep])

  # return true if previous step exists
  $scope.hasPreviousStep = ->
    stepIndex = $scope.getCurrentStepIndex()
    previousStep = stepIndex - 1
    not _.isUndefined($scope.steps[previousStep])

  # goto next step
  $scope.incrementStep = ->
    if $scope.hasNextStep()
      stepIndex = $scope.getCurrentStepIndex()
      nextStep = stepIndex + 1
      $scope.selection = $scope.steps[nextStep]

  # goto previous step
  $scope.decrementStep = ->
    if $scope.hasPreviousStep()
      stepIndex = $scope.getCurrentStepIndex()
      previousStep = stepIndex - 1
      $scope.selection = $scope.steps[previousStep]
