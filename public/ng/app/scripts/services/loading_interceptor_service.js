(function() {
  'use strict';
  this.LoadingInterceptor = this.serviceModule.factory('LoadingInterceptor', function($q, $rootScope, $injector) {
    return {
      request: function(request) {
        $injector.get('$ionicLoading').show({
          content: "Loading...",
          animation: "fade-in",
          showBackdrop: true,
          showDelay: 300
        });
        return request || $q.when(request);
      },
      response: function(response) {
        $injector.get('$ionicLoading').hide();
        return response || $q.when(response);
      }
    };
  });

  this.LoadingInterceptor.$inject = ['$q', '$rootScope', '$injector'];

}).call(this);
