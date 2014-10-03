(function() {
  'use strict';
  this.EventInterceptor = this.serviceModule.factory('EventInterceptor', function($q, $injector, $rootScope) {
    var error, success;
    success = function(response) {
      if (response && response.data && response.data.activity) {
        if (response.data.activity.show_level_up_modal) {
          $rootScope.$broadcast('event:levelup', {
            image: response.data.activity.rank,
            prev_rank: response.data.activity.prev_rank,
            rank: response.data.activity.display_rank
          });
        }
        if (response.data.activity.show_advice_modal) {
          $rootScope.$broadcast('event:advice', {
            name: response.data.activity.advice_name
          });
        }
      }
      return response;
    };
    error = function(response) {
      if (response.data === '' && response.status === 0) {
        console.log("I am not connected");
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
