(function() {
  'use strict';
  this.EventInterceptor = this.serviceModule.factory('EventInterceptor', function($q, $injector, $rootScope) {
    var error, success;
    success = function(response) {
      var modal, _i, _len, _ref;
      if (response && response.data && response.data.activity && response.data.activity.modals) {
        _ref = response.data.activity.modals;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          modal = _ref[_i];
          $rootScope.$broadcast("event:" + modal.event_name, modal.options);
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
