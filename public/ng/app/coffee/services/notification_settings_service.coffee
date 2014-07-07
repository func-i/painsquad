# 'use strict'

@NotificationSettingsService = @serviceModule.factory 'NotificationSettingsService', ($rootScope, $q, NotificationService) ->

    # setDefaultNotifications: ->
    #   # 8:30 am
    #   morningAlert     = `new Date().setHours(8, 30, 00, 000)`
    #   morningRepeatOne = `new Date().setHours(8, 45, 00, 000)`
    #   morningRepeatTwo = `new Date().setHours(9, 00, 00, 000)`
    #   # 6:30 pm
    #   eveningAlert     = `new Date().setHours(18, 30, 00, 000)`
    #   eveningRepeatOne = `new Date().setHours(18, 45, 00, 000)`
    #   eveningRepeatTwo = `new Date().setHours(19, 00, 00, 000)`
    #   dates = [morningAlert, morningRepeatOne, morningRepeatTwo, eveningAlert, eveningRepeatOne, eveningRepeatTwo]
    #   for date, index in dates
    #     @addAlert(date, index)

    setDefaultNotifications: ->
      d = new Date()
      v = new Date()
      v.setMinutes d.getMinutes() + 1
      @addAlert(v, 0)

    addAlert: (date, index) ->
      NotificationService.add
        id:      index.toString()
        message: 'Headquarters has just assigned you a case!'
        repeat:  'daily'
        date:    date
        badge:   0
        json:    JSON.stringify({'type': 'full'})

    handleClick: (id, state, json) ->
      alert("handling alert event, id: #{id}, state: #{state}, json: #{json}")

    # addAlerts: (datesArray) ->
    #   id =  0
    #   for dateElement in datesArray
    #     NotificationService.add
    #       id:      id
    #       message: 'Headquarters has just assigned you a case!'
    #       repeat:  'daily'
    #       date:    dateElement
    #       badge:   0
    #       json:    JSON.stringify({type: 'full'})
    #     , $rootScope
    #     id++

@NotificationSettingsService.$inject = [ '$rootScope', '$q', 'NotificationService' ]
