(function() {
  'use strict';
  this.RankInterceptor = this.serviceModule.factory('RankInterceptor', function($q, $injector, $rootScope) {
    var error, success;
    success = function(response) {
      if (response && response.data.activity && response.data.activity.show_level_up_modal) {
        $rootScope.$broadcast('event:levelup', {
          image: response.data.activity.rank,
          prev_rank: response.data.activity.prev_rank,
          rank: response.data.activity.display_rank
        });
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

  this.RankInterceptor.$inject = ['$q', '$injector', '$rootScope'];

}).call(this);
