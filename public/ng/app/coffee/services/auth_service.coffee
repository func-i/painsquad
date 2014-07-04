'use strict'

@AuthService = @serviceModule.factory 'AuthService', ($rootScope, $state, $http, $ionicLoading, Session, UserService) ->

  login: (credentials) ->
    @showLoading()
    Session.save(session: credentials).$promise
      .then (response) =>
        @onSuccess(response)
      , (error) =>
        @onError(error)

  logout: ->
    UserService.remove()
    UserService.clearToken()
    $rootScope.$broadcast('event:auth-logout-complete');

  onSuccess: (responseData) ->
    @hideLoading()
    UserService.set(responseData.user)
    $http.defaults.headers.common['Authorization'] = "Token token=#{responseData.user.access_token}"
    $state.go 'app.home'

  onError: (errorData) ->
    @hideLoading()
    $rootScope.$broadcast('event:auth-login-failed', errorData)

  showLoading: ->
    $ionicLoading.show
      template: "Loading..."

  hideLoading: ->
    $ionicLoading.hide()

@AuthService.$inject = [ '$rootScope', '$state', '$http', '$ionicModal', 'Session', 'UserService' ]