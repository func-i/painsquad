'use strict'

@UserService = @serviceModule.factory 'UserService', () ->

  currentUser: ->
    JSON.parse(@get())

  get: ->
    localStorage.getItem 'current_user'

  set: (user) ->
    @remove()
    localStorage.setItem 'current_user', JSON.stringify(user)

  remove: ->
    localStorage.removeItem 'current_user'

@UserService.$inject = [ ]
