'use strict'

@NetworkService = @serviceModule.factory 'NetworkService', ($ionicPlatform, $q) ->

  Connection = window.Connection or
    CELL:     "cellular"
    CELL_2G:  "2g"
    CELL_3G:  "3g"
    CELL_4G:  "4g"
    ETHERNET: "ethernet"
    WIFI:     "wifi"
    NONE:     "none"
    UNKNOWN:  "unknown"

  asyncGetConnection = ->
    q = $q.defer()
    $ionicPlatform.ready ->
      if navigator.connection
        q.resolve navigator.connection
      else
        q.reject "navigator.connection is not defined"
      return

    q.promise

  return isOnline: ->
    asyncGetConnection().then (networkConnection) ->
      isConnected = false
      switch networkConnection.type
        when Connection.ETHERNET, Connection.WIFI, Connection.CELL_2G, Connection.CELL_3G, Connection.CELL_4G, Connection.CELL
          isConnected = true
      isConnected

@NetworkService.$inject = [ '$ionicPlatform', '$q' ]
