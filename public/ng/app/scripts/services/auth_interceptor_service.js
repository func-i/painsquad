(function() {
  'use strict';
  this.AuthInterceptor = this.serviceModule.factory('AuthInterceptor', function($q, $injector, $location) {
    var error, success;
    success = function(response) {
      console.log('success response: ', response);
      return response;
    };
    error = function(response) {
      console.log('error response: ', response);
      if (response.status === 401) {
        if (!localStorage.getItem('introComplete')) {
          $injector.get("$state").transitionTo("app.intro");
        } else {
          $injector.get("$state").transitionTo("app.login");
        }
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
