(function() {
  'use strict';
  this.AuthInterceptor = this.serviceModule.factory('AuthInterceptor', function($q, $injector) {
    var error, success;
    success = function(response) {
      return response;
    };
    error = function(response) {
      if (response.status === 401 || response.status === 404) {
        $injector.get("$state").transitionTo("app.login");
        return $q.reject(response);
      } else {
        return $q.reject(response);
      }
    };
    return function(promise) {
      return promise.then(success, error);
    };
  });

  this.AuthInterceptor.$inject = ['$q', '$injector'];

}).call(this);
