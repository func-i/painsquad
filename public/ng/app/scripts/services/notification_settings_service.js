(function() {
  this.NotificationSettingsService = this.serviceModule.factory('NotificationSettingsService', function($rootScope, $q, NotificationService) {
    return {
      setDefaultNotifications: function() {
        var d, v;
        d = new Date();
        v = new Date();
        v.setMinutes(d.getMinutes() + 1);
        return this.addAlert(v, 0);
      },
      addAlert: function(date, index) {
        return NotificationService.add({
          id: index.toString(),
          message: 'Headquarters has just assigned you a case!',
          repeat: 'daily',
          date: date,
          badge: 0,
          json: JSON.stringify({
            'type': 'full'
          })
        });
      },
      handleClick: function(id, state, json) {
        return alert("handling alert event, id: " + id + ", state: " + state + ", json: " + json);
      }
    };
  });

  this.NotificationSettingsService.$inject = ['$rootScope', '$q', 'NotificationService'];

}).call(this);
