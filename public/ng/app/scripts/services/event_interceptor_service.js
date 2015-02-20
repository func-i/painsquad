(function() {
  'use strict';
  this.EventInterceptor = this.serviceModule.factory('EventInterceptor', function($q, $injector, $rootScope, $timeout) {
    var error, success;
    success = function(response) {
      var fn, i, j, len, modal, ref;
      if (response && response.data && response.data.activity && response.data.activity.modals) {
        ref = response.data.activity.modals;
        fn = function(m, index) {
          return $timeout(function() {
            return $rootScope.$broadcast("event:" + m.event_name, m.options);
          }, index * 7700);
        };
        for (i = j = 0, len = ref.length; j < len; i = ++j) {
          modal = ref[i];
          fn(modal, i);
        }
      }
      return response;
    };
    error = function(response) {
      if (response.data === '' && response.status === 0) {
        $injector.get("$state").transitionTo("app.notconnected");
      }
      return $q.reject(response);
    };
    return function(promise) {
      return promise.then(success, error);
    };
  });

  this.EventInterceptor.$inject = ['$q', '$injector', '$rootScope'];

}).call(this);
