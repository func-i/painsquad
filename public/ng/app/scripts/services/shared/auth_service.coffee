'use strict'

@serviceModule.factory 'AuthService', ['$state', 'Session', ($state, Session) ->
  currentUser = {}

  login: (user) ->
    session = Session.save(user: user).$promise.then (response) ->
      console.log response
      # debugger
      currentUser = response

    # currentUser = {
    #   firstName: 'Jon',
    #   token: 'abc123'
    # }

    $state.go('app.home')

  getCurrentUser: () ->
    currentUser

]