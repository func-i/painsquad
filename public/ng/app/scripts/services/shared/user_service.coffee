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

# attaches promise to 'session#create' action
# Session.authenticate = (credentials) ->
#   deferred = $q.defer()
#   session = new Session(credentials)
#   session.$save null, (credentials) ->
#     deferred.resolve(credentials)
#   return deferred.promise

# Session.loggedIn = ->
#   !!localStorage.getItem("current_user")

# Session.loggedOut = ->
#   !Session.loggedIn()

# Session.get = ->
#   if localStorage.getItem "current_user"
#     $rootScope.user = localStorage.getItem('current_user')

# Session.set = (user) ->
#   $rootScope.user = user
#   localStorage.removeItem "current_user"
#   localStorage.setItem "current_user", JSON.stringify(user)

# Session.remove = ->
#   localStorage.removeItem "current_user"

# Session

