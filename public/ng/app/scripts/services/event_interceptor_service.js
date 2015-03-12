(function() {
  'use strict';
  this.EventInterceptor = this.serviceModule.factory('EventInterceptor', function($q, $injector, $rootScope, $timeout) {
    var error, success;
    success = function(response) {
      var i, modal, _fn, _i, _len, _ref;
      if (response && response.data && response.data.activity && response.data.activity.modals) {
        _ref = response.data.activity.modals;
        _fn = function(m, index) {
          return $timeout(function() {
            return $rootScope.$broadcast("event:" + m.event_name, m.options);
          }, index * 7700);
        };
        for (i = _i = 0, _len = _ref.length; _i < _len; i = ++_i) {
          modal = _ref[i];
          _fn(modal, i);
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
