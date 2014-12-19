(function() {
  'use strict';
  this.LoadingInterceptor = this.serviceModule.factory('LoadingInterceptor', function($q, $rootScope, $injector) {
    return {
      request: function(request) {
        return request || $q.when(request);
      },
      response: function(response) {
        return response || $q.when(response);
      }
    };
  });

  this.LoadingInterceptor.$inject = ['$q', '$rootScope', '$injector'];

}).call(this);
