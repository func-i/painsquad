(function() {
  this.NotificationSettingsService = this.serviceModule.factory('NotificationSettingsService', function($rootScope, $state, $q, NotificationService) {
    return {
      setDefaultNotifications: function() {
        var now;
        now = new Date();
        now.setSeconds(now.getSeconds() + 15);
        return this.addAlert(now, 0);
      },
      addAlert: function(date, index) {
        var note;
        note = NotificationService.add({
          id: index.toString(),
          message: 'Headquarters has just assigned you a case!',
          repeat: 'daily',
          date: date,
          badge: 0,
          json: JSON.stringify({
            'type': 'full'
          })
        });
        return console.log(note);
      },
      handleClick: function(id, state, json) {
        return $state.go('app.new_survey');
      }
    };
  });

  this.NotificationSettingsService.$inject = ['$rootScope', '$state', '$q', 'NotificationService'];

}).call(this);
