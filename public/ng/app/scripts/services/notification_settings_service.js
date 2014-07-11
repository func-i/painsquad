(function() {
  this.NotificationSettingsService = this.serviceModule.factory('NotificationSettingsService', function($rootScope, $state, $q, NotificationService, moment) {
    var eveningAlert, morningAlert;
    morningAlert = {
      id: $rootScope.notificationID.toString(),
      message: 'Headquarters has just assigned you a case!',
      repeat: 'daily',
      date: new Date().setHours(8, 30, 00, 000),
      json: JSON.stringify({
        'type': 'full'
      }),
      autoCancel: false
    };
    return eveningAlert = {
      id: $rootScope.notificationID.toString(),
      message: 'Headquarters has just assigned you a case!',
      repeat: 'daily',
      date: new Date().setHours(18, 30, 00, 000),
      json: JSON.stringify({
        'type': 'full'
      }),
      autoCancel: false,
      defaultAlert: function(submittedTime) {
        var item;
        return item = {
          id: $rootScope.notificationID.toString(),
          message: 'Headquarters has just assigned you a case!',
          repeat: 'none',
          date: submittedTime
        };
      },
      setDefaults: function() {
        var alert, _i, _len, _ref, _results;
        _ref = [morningAlert, eveningAlert];
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          alert = _ref[_i];
          _results.push(this.addAlert(alert));
        }
        return _results;
      },
      setTestAlert: function() {
        var alert;
        alert = {
          id: $rootScope.notificationID.toString(),
          date: moment().add('s', 15),
          message: 'Headquarters has just assigned you a case!',
          repeat: 'daily',
          badge: 0,
          json: JSON.stringify({
            'type': 'full'
          }),
          autoCancel: true
        };
        return this.addAlert(alert);
      },
      addAlert: function(alert) {
        return NotificationService.add(alert).then(function() {
          return this.iterateID();
        });
      },
      addFollowupAlert: function(currentTime) {
        return console.log(priorAlert);
      },
      iterateID: function() {
        return $rootScope.notificationID++;
      },
      handleClick: function(id, state, json) {
        var parsedJson;
        parsedJson = JSON.parse(json);
        return alert("Debugging onclick event, id: " + id + ", state: " + state + ", json: " + parsedJson);
      }
    };
  });

  this.NotificationSettingsService.$inject = ['$rootScope', '$state', '$q', 'NotificationService', 'moment'];

}).call(this);
