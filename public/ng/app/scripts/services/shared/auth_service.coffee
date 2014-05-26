'use strict'

@AuthService = @serviceModule.factory 'AuthService', ($rootScope, $state, $http, Session) ->
  # currentUser = {}

  login: (credentials) ->
    Session.authenticate(credentials).then (response) ->
      $rootScope.user = response.user
      $http.defaults.headers.common['Authorization'] = "Token token=#{response.user.access_token}"
      $state.go 'app.home'

    # Session.save(session: credentials).$promise.then (response) =>
    #   # @init(response)
    #   $state.go 'app.home'
    # , (error) ->
    #   console.log "Error occurred: ", error

  # getCurrentUser: ->
  #   currentUser

  # isAuthenticated: ->
  #   console.log currentUser?
  #   if currentUser then true else false

  # init: (response) ->
  #   if response.user?#.access_token?
  #     token = response.user.access_token
  #     $http.defaults.headers.common['Authorization'] = "Token token=#{token}"
  #   else
  #     $state.go 'login'


@AuthService.$inject = [ '$rootScope', '$state', '$http', 'Session' ]