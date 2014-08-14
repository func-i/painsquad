(function() {
  'use strict';
  this.IntroInterceptor = this.serviceModule.factory('IntroInterceptor', function($q, $injector, $rootScope) {
    var error, success;
    success = function(response) {
      if ($injector.get('$rootScope').firstLaunch) {
        $injector.get("$state").transitionTo("app.intro");
      }
      return response;
    };
    error = function(response) {
      return $q.reject(response);
    };
    return function(promise) {
      return promise.then(success, error);
    };
  });

  this.IntroInterceptor.$inject = ['$q', '$injector'];

}).call(this);
