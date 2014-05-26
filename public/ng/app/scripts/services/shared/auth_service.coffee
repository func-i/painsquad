'use strict'

@AuthService = @serviceModule.factory 'AuthService', ($state, $http, Session, UserService) ->

  login: (credentials) ->
    Session.save(session: credentials).$promise
      .then (response) =>
        @onSuccess(response)
      , (error) =>
        @onError(error)

  onSuccess: (responseData) ->
    # sets user in localstorage
    UserService.set(responseData.user)
    # adds token to headers
    $http.defaults.headers.common['Authorization'] = "Token token=#{responseData.user.access_token}"
    # go to home view!
    $state.go 'app.home'

  # handle errors here somehow idk maybe like show stuff to user
  onError: (errorData) ->
    console.log errorData.data

@AuthService.$inject = ['$state', '$http', 'Session', 'UserService']