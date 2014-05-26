'use strict'

@SessionResource = @resourceModule.factory 'Session', ($http, $resource, $q, CONFIG) ->

  $http.defaults.useXDomain = true
  Session = $resource "#{CONFIG.apiUrl}/session/", {}

  authenticate: (credentials) ->
    deferred = $q.defer()
    session = new Session(credentials)
    session.$save null, (credentials) ->
      deferred.resolve(credentials)

    return deferred.promise


  # service.loggedIn = ->
  #   !!localStorage.getItem("current_user")

  # service.loggedOut = ->
  #   !service.loggedIn()

  # service.getCurrentUser = (callback) ->
  #   if service.get() and $rootScope.user
  #     callback service.get()
  #   else

  #     # User.requestCurrentUser().success (response) ->
  #     #   callback(response.user)
  #     #   service.set(response.user)
  #     # .error ->
  #     #   callback(null)

  # service.get = ->
  #   if localStorage.getItem "current_user"
  #     $rootScope.user = localStorage.getItem('current_user')
  #     # $rootScope.user = new User(localStorage.getItem("current_user"))

  # service.set = (user) ->
  #   $rootScope.user = user
  #   localStorage.removeItem "current_user"
  #   localStorage.setItem "current_user", JSON.stringify(user)

  # service.remove = ->
  #   localStorage.removeItem "current_user"

  # service.create = (user) ->
  #   $http.post('/session', user).success (response) ->
  #     service.set(response.user)

  # service.destroy = ->
  #   $http.delete('/session').success ->
  #     service.remove()

@SessionResource.$inject = [ '$http', '$resource', '$q', 'CONFIG' ]