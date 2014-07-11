@NotificationSettingsService = @serviceModule.factory 'NotificationSettingsService', ($rootScope, $state, $q, NotificationService, moment) ->

  # TODO:
  # need follow-up alerts after the initial morning/evening alerts are triggered
  # these happen 1 hour after the initial one and have the truncated type

  morningAlert =
    id:         $rootScope.notificationID.toString()
    message:    'Headquarters has just assigned you a case!'
    repeat:     'daily'
    date:       `new Date().setHours(8, 30, 00, 000)`
    json:       JSON.stringify({'type': 'full'})
    autoCancel: false

  eveningAlert =
    id:         $rootScope.notificationID.toString()
    message:    'Headquarters has just assigned you a case!'
    repeat:     'daily'
    date:       `new Date().setHours(18, 30, 00, 000)`
    json:       JSON.stringify({'type': 'full'})
    autoCancel: false


    defaultAlert: (submittedTime) ->
      return item =
        id:      $rootScope.notificationID.toString()
        message: 'Headquarters has just assigned you a case!'
        repeat:  'none'
        date:    submittedTime


    setDefaults: ->
      for alert in [morningAlert, eveningAlert]
        @addAlert(alert)

# window.plugin.notification.local.add({
#     id:         String,  // A unique id of the notifiction
#     date:       Date,    // This expects a date object
#     message:    String,  // The message that is displayed
#     title:      String,  // The title of the message
#     repeat:     String,  // Either 'secondly', 'minutely', 'hourly', 'daily', 'weekly', 'monthly' or 'yearly'
#     badge:      Number,  // Displays number badge to notification
#     sound:      String,  // A sound to be played
#     json:       String,  // Data to be passed through the notification
#     autoCancel: Boolean, // Setting this flag and the notification is automatically canceled when the user clicks it
#     ongoing:    Boolean, // Prevent clearing of notification (Android only)
# }, callback, scope);

    setTestAlert: ->
      alert =
        id:         $rootScope.notificationID.toString()
        date:       moment().add('s', 15)
        message:    'Headquarters has just assigned you a case!'
        repeat:     'daily'
        badge:      0
        json:       JSON.stringify({'type': 'full'})
        autoCancel: true
      @addAlert(alert)

    addAlert: (alert) ->
      NotificationService.add(alert).then ->
        @iterateID()

    addFollowupAlert: (currentTime) ->
      console.log priorAlert

    iterateID: ->
      $rootScope.notificationID++

    handleClick: (id, state, json) ->
      parsedJson = JSON.parse(json)
      alert("Debugging onclick event, id: #{id}, state: #{state}, json: #{parsedJson}")
      # $state.go('app.new_survey_by_type', type: parsedJson.type)
      # if parsedJson.type is 'full'
      #   alert = @defaultAlert(moment().add('h', 1))
      #   @addFollowupAlert(alert)

@NotificationSettingsService.$inject = [ '$rootScope', '$state', '$q', 'NotificationService', 'moment' ]
