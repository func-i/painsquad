'use strict'

@LoginCtrl = @controllerModule.controller 'LoginCtrl',  ($rootScope, $state, $scope, AuthService, UserService) ->
  # $rootScope.sideMenuEnabled = false
  $scope.message             = ""
  $scope.user =
    email:    null
    password: null

  $scope.login = ->
    AuthService.login $scope.user

  $scope.$on "event:auth-loginRequired", (e, rejection) ->
    $scope.loginModal.show()

  $scope.$on "event:auth-loginConfirmed", ->
    $scope.email    = null
    $scope.password = null
    $scope.loginModal.hide()

  $scope.$on "event:auth-login-failed", (e, status) ->
    if status.status is 401
      error = "Invalid Username or Password."
    else
      error = "Login failed."
    $scope.message = error

  $scope.$on "event:auth-logout-complete", ->
    $state.go "app.login", {}, reload: true, inherit: false

@LoginCtrl.$inject = [ '$rootScope', '$state', '$scope', 'AuthService', 'UserService' ]