'use strict'

@UserService = @serviceModule.factory 'UserService', ($http) ->

  isLoggedIn: ->
    @currentUser()?

  currentUser: ->
    JSON.parse(@get())

  get: ->
    localStorage.getItem 'current_user'

  set: (user) ->
    @remove()
    localStorage.setItem 'current_user', JSON.stringify(user)

  remove: ->
    localStorage.removeItem 'current_user'

  clearToken: ->
    $http.defaults.headers.common['Authorization'] = ''


@UserService.$inject = [ '$http' ]