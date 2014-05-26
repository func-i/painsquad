'use strict'

@AuthService = @serviceModule.factory 'AuthService', ($state, Session) ->
  currentUser = {}

  login: (credentials) ->
    Session.save(session: credentials).$promise
      .then (response) ->
        console.log "Sucess: ", response
      , (error) ->
        console.log "Error!", error

  getCurrentUser: ->
    currentUser

  # isAuthenticated: ->
  #   !!Session.userId


  # login: (credentials) ->
  #   # console.log credentials
  #   debugger
  #   Session.save(user: credentials)
  #   .$promise.then (response) ->
  #     console.log response
  #     # currentUser = response

    # session = Session.save(user: credentials)
    #   .$promise.then (response) ->
    #     console.log response.credentials
    #     currentUser = response

@AuthService.$inject = [ '$state', 'Session' ]