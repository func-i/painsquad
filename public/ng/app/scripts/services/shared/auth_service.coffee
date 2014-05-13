'use strict'

@serviceModule.factory 'AuthService', ['$state', 'Session', ($state, Session) ->
  currentUser = {}

  login: (user) ->
    # TODO: Uncomment
    # session = Session.save(user: user).$promise.then((response) ->
    #   currentUser = response
    # )

    currentUser = {
      firstName: 'Jon',
      token: 'abc123'
    }

    $state.go('app.home')

  getCurrentUser: () ->
    currentUser

]