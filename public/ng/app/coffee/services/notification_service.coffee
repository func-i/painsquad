'use strict'

@NotificationService = @serviceModule.factory 'NotificationService', ($q) ->

    add: (options, scope) ->
      q = $q.defer()
      window.plugin.notification.local.add options, ((result) ->
        q.resolve result
      ), scope
      q.promise

    cancel: (id, scope) ->
      q = $q.defer()
      window.plugin.notification.local.cancel id, ((result) ->
        q.resolve result
      ), scope
      q.promise

    cancelAll: (scope) ->
      q = $q.defer()
      window.plugin.notification.local.cancelAll ((result) ->
        q.resolve result
      ), scope
      q.promise

    isScheduled: (id, scope) ->
      q = $q.defer()
      window.plugin.notification.local.isScheduled id, ((result) ->
        q.resolve result
      ), scope
      q.promise

    getScheduledIds: (scope) ->
      q = $q.defer()
      window.plugin.notification.local.getScheduledIds ((result) ->
        q.resolve result
      ), scope
      q.promise

    isTriggered: (id, scope) ->
      q = $q.defer()
      window.plugin.notification.local.isTriggered id, ((result) ->
        q.resolve result
      ), scope
      q.promise

    getTriggeredIds: (scope) ->
      q = $q.defer()
      window.plugin.notification.local.getTriggeredIds ((result) ->
        q.resolve result
      ), scope
      q.promise

    getDefaults: ->
      window.plugin.notification.local.getDefaults()

    setDefaults: (Object) ->
      window.plugin.notification.local.setDefaults Object

    onadd: ->
      window.plugin.notification.local.onadd

    ontrigger: ->
      window.plugin.notification.local.ontrigger

    onclick: ->
      return false

    oncancel: ->
      window.plugin.notification.local.oncancel

@NotificationService.$inject = [ '$q' ]
